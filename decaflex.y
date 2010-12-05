
%{
	#include "base.h"
	#include "stack.h"
	#include "print.h"
	int yylex(void);
	void yyerror(const char *s);
	string add_str(string s);
	int print_string_taget();
	string get_tag(int i, string s);
	string cmp_cmd(string op, string e1, string e2);
	int loop_op(string op);
	
	bool for_loop;
	
	Stack s;
	vector <string> args_list;
	vector <string> string_record;
	vector <string> id_list;
	string for_split = "@@";
	
	int if_cnt, loop_cnt, cmp_cnt;
%}
%debug
%code requires{
	#define YYSTYPE string
}

%token T_COMMA
%token T_ASSIGN
%token T_BOOL T_BREAK T_CALLOUT T_CONTINUE T_CLASS T_COMMENT T_DOT T_ELSE T_WQ T_EXTENDS T_FOR T_IF T_NEW T_NULL T_RETURN T_SEMICOLON T_VOID T_WHILE T_INT 
%left T_CHARCONSTANT T_FALSE T_INTCONSTANT T_TRUE T_STRINGCONSTANT T_ID
%left T_OR
%left T_AND
%left T_NEQ T_EQ
%left T_GEQ T_GT T_LEQ T_LT
%left T_LEFTSHIFT T_RIGHTSHIFT T_ROT
%left T_MINUS T_PLUS
%left T_DIV T_MOD T_MULT 
%left T_NOT
%left T_UMINUS
%right T_LPAREN T_RPAREN
%right T_LSB T_RSB
%right T_LCB T_RCB

%%
program: tclass class_name tlcb field_decl_list method_decl_list trcb {
			print_string_taget();
			cout << ".text"<< endl;
			cout << ".globl main"<< endl;
			cout << "main: " << endl;
			cout << $6 << endl;
	   }
class_name: id {
		  }
field_decl_list: field_decl_list field_decl {
			   }
			 	| {
				}
field_decl: type field_list {

		  int i;
		  for (i = id_list.size() - 1; i >= 0; i--)
		  {
		  	int len = id_list[i].length();
		  	if (id_list[i][len - 1] != ']')
			{
				int rt = s.stack[s.sp].add_var(id_list[i]);
			}
			else
			{
				int index = id_list[i].find('[');
				string id = id_list[i].substr(0, index);
				stringstream ss(id_list[i].substr(index +1 
				                        , len - index - 2));
				int l;
				ss >> l;
				int rt = s.stack[s.sp].add_var(id, l);
			}
		  }
		  id_list.clear();
		  }
		   |type id T_ASSIGN constant tsemicolon{
		   	int rt = s.stack[s.sp].add_var($2);
			s.stack[s.sp].set_var($2, $4, s);
			s.stack[s.sp].remove_slot($4);
		   	   }
field_list: field tcomma field_list {
		  }
			| field tsemicolon {
			}
field:  id {
		id_list.push_back($1);
			}
	    | id tlsb T_INTCONSTANT trsb  {
		 id_list.push_back($1+"["+ $3+"]");
		    }

method_decl_list: method_decl_list method_decl {
				}
				| {
				}
method_decl: type id tlparen param_list trparen block{
		   		s.add_cmd($2 + ":");
		   		s.add_cmd($5);
				s.add_cmd($6);
		   }
		    | tvoid id tlparen param_list trparen block{
				if ($2 != "main")
				{
		   			s.add_cmd($2 + ":");
				}
		   		s.add_cmd($5);
				s.add_cmd($6);
				if ($2 == "main")
				{
					s.add_cmd("li $v0, 10");;
					s.add_cmd("syscall");
				}
		   }

param_list: param_comma_list {
		  }
		  | {}
param_comma_list: param tcomma param_comma_list {
				}
				| param {
				}
param: type id {
	 				id_list.push_back($2);
				}

block: tlcb var_decl_list statement_list trcb {
	 			$$ = $4;
				}
var_decl_list: var_decl var_decl_list {
			 }
			 | {}

var_decl: type  id id_comma_list tsemicolon   {
			id_list.push_back($2);
			for (int i = 0; i < id_list.size(); i++)
			{
				int rt = s.stack[s.sp].add_var(id_list[i]);
			}
			id_list.clear();
		}

id_comma_list: tcomma id id_comma_list {
			 id_list.push_back($2)
				}
			   | {
			   }
type:  T_INT { $$ = "int";}
	 | T_BOOL{ $$ = "bool";}

tvoid: T_VOID{ $$ = "void";}

statement_list: statement statement_list{
			  }
			  | {}

statement:
		 assign tsemicolon {
		 }
		 |method_call tsemicolon {
		 }
		 |tif tlparen expr trparen block {
		 	if_cnt++;
			string then_tag  = get_tag(if_cnt, "then");
			string end_tag   = get_tag(if_cnt, "end_if");
			
			s.add_cmd($4);
			string condition = $3;
			s.add_cmd("beq $" + condition + ", $zero, "+ end_tag);
			s.stack[s.sp].remove_slot($3);

			s.add_cmd(then_tag+":");
			s.add_cmd($5);
			s.add_cmd(end_tag+":");
		 	
		 }
		 |tif tlparen expr trparen block telse block {
		 	if_cnt++;
			string then_tag = get_tag(if_cnt, "then");
			string else_tag = get_tag(if_cnt, "else");
			string end_tag   = get_tag(if_cnt, "end_if");
			
			s.add_cmd($4);
			string condition = $3;
			s.add_cmd("beq $" + condition + ", $zero, "+ else_tag);
			s.stack[s.sp].remove_slot($3);

			s.add_cmd(then_tag+":");

			s.add_cmd($5);
			s.add_cmd("j " +  end_tag);
			s.add_cmd(else_tag+":");
			s.add_cmd($7);
			s.add_cmd(end_tag+":");

		 }
		 | twhile tlparen expr trparen block {
		 	loop_cnt++;
			string begin_tag = get_tag(loop_cnt, "loop_begin");
			string end_tag = get_tag(loop_cnt, "loop_end");
			
			string condition = $3;
			s.add_cmd(begin_tag+":");
			s.add_cmd($4);
			s.add_cmd("beq $" + condition + ", $zero, "+ end_tag);
			s.stack[s.sp].remove_slot(condition);
			s.add_cmd($5);
			s.add_cmd("j " + begin_tag);
			s.add_cmd(end_tag+":");
			s.loop_out();

		 }
		 | tfor tlparen for_first_part tsemicolon expr tsemicolon for_third_part trparen block {
			loop_cnt++;
			string begin_tag = get_tag(loop_cnt, "for_begin");
			string update_tag = get_tag(loop_cnt, "loop_begin");
			string end_tag   = get_tag(loop_cnt, "loop_end");

			string loop = $8;
			string condition = $5;

			string cmd[3];
			for (int i = 0; i < 2; i++)
			{
				int index;
				index = loop.find(for_split);
				cmd[i] = loop.substr(0,index);
				loop = loop.substr(index+2);
			}
			cmd[2] = loop;
			s.add_cmd(cmd[0]);
			s.add_cmd(begin_tag + ":");
			s.add_cmd(cmd[1]);
			s.add_cmd("beq $" + condition + ", $zero, "+ end_tag);
			s.stack[s.sp].remove_slot(condition);
			s.add_cmd($9);
			s.add_cmd(update_tag+":");
			s.add_cmd(cmd[2]);
			s.add_cmd("j "+begin_tag);
			s.add_cmd(end_tag+":");
			s.loop_out();
		 }
		 | treturn opt_expr tsemicolon {
		 	s.add_cmd("move $v0, $" + $2);
			s.add_cmd("j $ra");
		 	
		 }
		 | T_BREAK tsemicolon {
		 	loop_op("loop_end");
		 }
		 | T_CONTINUE tsemicolon {
		 	loop_op("loop_begin");
		 }
		 | block {
		 	s.add_cmd($1);
		 }
for_first_part: assign_comma_list {
			  for_loop = true;
			  }
for_third_part: assign_comma_list {
			  for_loop = false;
			  }

assign_comma_list: assign tcomma assign_comma_list {
				 }
				 | assign {
				 }
assign:	lvalue T_ASSIGN expr {
			int len = $1.length();
			if ($1[len-1] == ']')
			{
				int i = $1.find('[');
				s.stack[s.sp].set_var($1.substr(0,i), $3,  s, 
									  $1.substr(i+1, len - i - 2));
			}
			else
			{
	  			s.stack[s.sp].set_var($1, $3, s);
			}
			
			s.stack[s.sp].remove_slot($3);
			$$ = $1;
	  	}

method_call: method_name tlparen expr_comma_list trparen {
			}
			| tcallout tlparen callout_arg_list trparen {
			s.add_cmd($4);
			$$ = $3;
			}

callout_arg_list: stringconstant callout_arg_comma_list {
				Print p;
				if ($1 == "print_int")
				{
					for (int i = args_list.size() - 1; i >= 0 ; i--)
					{
						s.add_cmd(p.print_int(args_list[i]));
						s.stack[s.sp].remove_slot(args_list[i]);
						if (i != 0) s.add_cmd(p.print_str(" "));
					}
					s.add_cmd(p.print_str("\n"));
					
				}
				else if ($1 == "print_str")
				{
					for (int i = args_list.size() - 1; i>= 0; i--)
					{
						string ret = add_str(args_list[i]);
						s.add_cmd(p.print_str(ret));
						s.add_cmd(p.print_str(" "));
					}
					s.add_cmd(p.print_str("\n"));
				}
				else if ($1 == "read_int")
				{
					try{
						s.stack[s.sp].add_slot("v0");
					}
					catch (const char *s){}
					s.add_cmd("li $v0, 5");
					s.add_cmd("syscall");
					string ret("v0");
					$$ = ret;
				}
				args_list.clear();
				}
callout_arg_comma_list: tcomma callout_arg callout_arg_comma_list {
					  args_list.push_back($2);

				}
				|  {
				}
callout_arg: expr {
		   $$ = $1;
		   }
		   | stringconstant {
		   $$ = $1;
			}
method_name: id {}

lvalue: id { $$ = $1;}
	  | id tlsb expr trsb {
	    $$ = $1 + "[" + $3 +"]";
	  }

expr_comma_list: expr tcomma expr_comma_list {
				}
				| opt_expr {
				}

opt_expr: expr{ $$ = $1;}
		| {
			$$ = "zero";
		}

expr: lvalue {
		int len = $1.length();
		if ($1[len-1] == ']')
		{
			int i = $1.find('[');
			$$ = s.stack[s.sp].get_var($1.substr(0,i), s, 
									   $1.substr(i+1, len - i - 2));
		}
		else
		{
			$$ = s.stack[s.sp].get_var($1,s);
		}
	  }
	  | method_call {
	  	$$ = $1;
	  }
	  | constant {
	  	$$ = $1;
	  }
	  | expr T_PLUS expr {
	  	s.add_cmd("add $" + $1 + ", $" + $1 + ", $" +  $3);
		s.stack[s.sp].remove_slot($3);

		$$ = $1;
	  }
	  | expr T_MINUS expr {
	  	s.add_cmd("sub $" + $1 + ", $" + $1 + ", $" + $3);
		s.stack[s.sp].remove_slot($3);
		$$ = $1;
	  }
	  | expr T_MULT expr {
		s.add_cmd("mul $" + $1 + ", $"+ $1 + ", $" + $3);
		s.stack[s.sp].remove_slot($3);
		$$ = $1;

	  }
	  | expr T_DIV expr {
		s.add_cmd("div $" + $1 + ", $" + $3);
		s.add_cmd("mflo $" + $1);
		s.stack[s.sp].remove_slot($3);
		$$ = $1;

	  }
	  | expr T_MOD expr {	
		s.add_cmd("div $" + $1 + ", $" + $3);
		s.add_cmd("mfhi $" + $1);
		s.stack[s.sp].remove_slot($3);
		$$ = $1;
	  }
	  | expr T_AND expr {
	  	s.add_cmd("and $" + $1 + ", $" + $1 + ", $" + $3);
		s.stack[s.sp].remove_slot($3);
		$$ = $1;
	  }
	  | expr T_OR expr {
	  	s.add_cmd("or $" + $1 + ", $" + $1 + ", $" + $3);
		s.stack[s.sp].remove_slot($3);
		$$ = $1;

	  }

	  | T_MINUS expr %prec T_UMINUS {
	  	s.add_cmd("sub $" + $2 + ", $0, $" + $2);
		$$ = $2;
	  }
	  | T_NOT expr {
		s.add_cmd("xori $"+$2+", $"+$2+", 1");
		$$ = $2;
	  	
	  }
	  | expr T_LEFTSHIFT expr {
	  	s.add_cmd("sllv $" + $1 + ", $" + $1 + ", $" + $3);
		s.stack[s.sp].remove_slot($3);
		$$ = $1;
	  }
	  | expr T_RIGHTSHIFT expr {
	  	s.add_cmd("srlv $" + $1 + ", $" + $1 + ", $" + $3);
		s.stack[s.sp].remove_slot($3);
		$$ = $1;
	  }
	  | expr T_ROT expr {
	  	$$ = $1;
			  
	  }
	  | expr T_GEQ expr {
	  	$$ = cmp_cmd("bge", $1, $3);
	  	
	  }
	  | expr T_GT expr {
	  	$$ = cmp_cmd("bgt", $1, $3);
	  }
	  | expr T_LEQ expr {
	  	$$ = cmp_cmd("ble", $1, $3);
	  }
	  | expr T_LT expr {
	  	$$ = cmp_cmd("blt", $1, $3);
	  }
	  | expr T_EQ expr {
	  	$$ = cmp_cmd("beq", $1, $3);
	  }
	  | expr T_NEQ expr {
	  	$$ = cmp_cmd("bne", $1, $3);
	  }

	  | tlparen expr trparen {
	  s.add_cmd($3);
	  $$ = $2;
	  }
constant: T_INTCONSTANT {
			stringstream ss($1);
			int value;
			ss >> value;
			$$ = s.stack[s.sp].new_value(value, s);
		}
		|T_CHARCONSTANT {
			string s = $1.substr(1, $1.length() - 2);
			$$ = s;
		}
		|bool_constant {
			$$ = $1;
		}
bool_constant: T_TRUE {
			 $$ = s.stack[s.sp].new_value(1,s);
					}
			|T_FALSE {
			 $$ = s.stack[s.sp].new_value(0,s);
					}
stringconstant: T_STRINGCONSTANT {
			  string s = $1.substr(1, $1.length() - 2);
			  $$ = s;
			}
id: T_ID { $$ = $1;}

tbreak: T_BREAK { }
tcallout: T_CALLOUT {}
tclass: T_CLASS { }
tcomma: T_COMMA {}
tdot: T_DOT {  }
telse: T_ELSE { }
textends: T_EXTENDS {}	//cerr << cmd[0]
tfor: T_FOR {
	s.loop_in(loop_cnt + 1);
	}
tif: T_IF { }
tlcb: T_LCB { s.in();
			if (!id_list.empty())
			{
				for (int i = 0; i < id_list.size(); i++)
				{
					s.stack[s.sp].add_var(id_list[i]);
				}
				id_list.clear();
			}
			}
tlparen: T_LPAREN {s.output_in();}
tlsb: T_LSB { }
tlt: T_LT {}
tnew: T_NEW {}
tnull: T_NULL {}
trcb: T_RCB { $$ = s.out();}
treturn: T_RETURN {}
trot: T_ROT {}
trparen: T_RPAREN {$$ = s.output_out(); }
trsb: T_RSB { }
tsemicolon: T_SEMICOLON { 
		  if (for_loop)
		  {
		  	s.add_cmd(for_split);
		  }
		  }
twhile: T_WHILE { 
	  s.loop_in(loop_cnt + 1);
	  }

	
%%

void yyerror(const char *s)
{
	string msg(s);
	cerr << s << endl;
}

int loop_op(string op)
{
	int pos;
	string tag = get_tag(s.current_loop(pos), op);
	int cnt = 0;
	int i;
	for (i = s.sp-1; i >= pos; i--)
	{
		cnt += s.stack[i].cnt;
	}
	stringstream ss;
	ss << cnt;
	string cmd = "addu $sp, " + ss.str();
	s.add_cmd(cmd);
	s.stack[pos].save_and_load(LOAD, s);
	s.add_cmd("j " + tag );

}


string get_tag(int i, string s)
{
	stringstream ss;
	ss << i;
	string tag(ss.str());
	tag = s+tag;
	return tag;
}

string add_str(string s)
{
	string_record.push_back(s);
	string tag = get_tag(string_record.size() - 1, "str");
	return tag;
}

string cmp_cmd(string op, string e1, string e2)
{	
	cmp_cnt++;
	string cmp_tag = get_tag(cmp_cnt, "cmp");
	string end_tag = get_tag(cmp_cnt, "cmp_end");
	s.add_cmd(op + " $" +  e1 + ", $" + e2 +", " + cmp_tag); 
	s.add_cmd("li $" + e1 + ", 0");
	s.add_cmd("j " + end_tag);
	s.add_cmd(cmp_tag+":");
	s.add_cmd("li $" + e1 + ", 1");
	s.add_cmd(end_tag+":");
	s.stack[s.sp].remove_slot(e2);
	return e1;

}

int init()
{
		string_record.clear();
		id_list.clear();

		if_cnt = -1;
		loop_cnt = -1;
		cmp_cnt = -1;

		for_loop = false;

		yydebug = 0;
		args_list.clear();

		cout << ".data"<< endl;
		
		cout <<"space:" << endl;
		cout <<".asciiz \" \""<< endl;
		
		cout <<"enter:" << endl;
		cout <<".asciiz \"\\n\""<< endl;


}

int print_string_taget()
{
	for (int i = 0 ; i < string_record.size() ; i++)
	{
		string tag = get_tag(i, "str");
		cout << tag<<":" << endl;
		cout <<".asciiz \""<< string_record[i] << "\""<< endl;
		cout << endl;
		
	}
}

int main()
{
	try{
		init();
		yyparse();
	}
	catch (const char *s)
	{
		string err(s);
		cerr << err << endl;
	}
	return 0;
}
