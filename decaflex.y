
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
	int add_arg(string reg, int arg_cnt);
	int end_function(string reg);
	int add_var_list();
	string op_assign(string op, string value, string expr);

	bool for_loop;
	
	Stack s;
	vector <string> args_list;
	vector <string> string_record;
	vector <string> id_list;
	const string for_split = "@@";
	const char fun_tag = '~';
	const char address_tag= '-';
	
	int if_cnt, loop_cnt, cmp_cnt;
%}
%debug
%code requires{
	#define YYSTYPE string
}

%token T_COMMA
%right T_ASSIGN T_PLUS_ASSIGN T_MINUS_ASSIGN T_MULT_ASSIGN T_DIV_ASSIGN T_MOD_ASSIGN T_AND_ASSIGN T_OR_ASSIGN T_LEFTSHIFT_ASSIGN T_RIGHTSHIFT_ASSIGN T_XOR_ASSIGN
%token T_BOOL T_BREAK T_CALLOUT T_CONTINUE T_CLASS T_COMMENT T_DOT T_ELSE T_WQ T_EXTENDS T_FOR T_IF T_NEW T_NULL T_RETURN T_SEMICOLON T_VOID T_WHILE T_INT T_FUN
%left T_CHARCONSTANT T_FALSE T_INTCONSTANT T_TRUE T_STRINGCONSTANT T_ID
%left T_OR
%left T_XOR
%left T_AND
%left T_NEQ T_EQ
%left T_GEQ T_GT T_LEQ T_LT
%left T_LEFTSHIFT T_RIGHTSHIFT T_ROT
%left T_MINUS T_PLUS
%left T_DIV T_MOD T_MULT 
%left T_NOT
%right T_UMINUS T_UPLUS
%right T_ADDRESS
%right T_INCREASE T_DECREASE
%right T_LPAREN T_RPAREN
%right T_LSB T_RSB
%right T_LCB T_RCB

%%
program: tclass class_name tlcb field_decl_lists method_decl_list trcb {
			print_string_taget();
			cout << ".text"<< endl;
			cout << ".globl main"<< endl;
			cout << "main: " << endl;
			cout << "lui $" << hp << ", 0x1001" << endl;
			cout << "move $v1, $ra" << endl;

			cout << $6 << endl;
	   }
class_name: id {
		  }
field_decl_lists: field_decl_list
{
			s.add_cmd("move $ra, $v1");
}
field_decl_list: field_decl_list field_decl {
			   }
			 	| {
				}
field_decl: type field_list {

		  int i;
			  add_var_list();
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
		| id T_ASSIGN expr {
		id_list.push_back($1+"="+$3);
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
		|T_FUN id {
					id_list.push_back($2);
				}
		|type T_ADDRESS id{
			id_list.push_back(address_tag+$3);
		}

block: tlcb var_decl_list statement_list trcb {
	 			$$ = $4;
				}
var_decl_list: var_decl var_decl_list {
			 }
			 | {}

var_decl: type var id_comma_list tsemicolon   {
			id_list.push_back($2);
		    add_var_list();
		}

id_comma_list: tcomma var id_comma_list {
			 id_list.push_back($2)
				}
			   | {
			   }
var:id {
		//id_list.push_back($1);
		$$ = $1;
			}
	    | id tlsb T_INTCONSTANT trsb  {
		 $$ = $1+"["+ $3+"]";
		    }
		| id T_ASSIGN expr {
		$$ = $1+"="+$3;
		   }

type:  T_INT { $$ = "int";}
	 | T_BOOL{ $$ = "bool";}

tvoid: T_VOID{ $$ = "void";}

statement_list: statement statement_list{
			  }
			  | {}

statement:
		 var_decl {
		 }
		 |expr tsemicolon {
		 	if ($1 != "zero")
			{
				s.stack[s.sp].remove_slot($1);
			}
		 }
		 |method_call tsemicolon {
		 	if ($1 != "zero")
			{
				s.stack[s.sp].remove_slot($1);
			}
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
		 	int tmp_sp = s.sp;
		 	end_function($2);
			s.sp = tmp_sp;
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
				 	s.stack[s.sp].remove_slot($1);
				 }
				 | assign {
				 	s.stack[s.sp].remove_slot($1);
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
			
			//s.stack[s.sp].remove_slot($3);
			$$ = $3;
	  	}
		|lvalue T_PLUS_ASSIGN expr {
			$$ = op_assign("add", $1, $3);
		}
		|lvalue T_MINUS_ASSIGN expr {
			$$ = op_assign("sub", $1, $3);
		}
		|lvalue T_MULT_ASSIGN expr {
			$$ = op_assign("mul", $1, $3);
		}
		|lvalue T_DIV_ASSIGN expr {
			$$ = op_assign("div", $1, $3);
		}
		|lvalue T_MOD_ASSIGN expr {
			$$ = op_assign("mod", $1, $3);
		}
		|lvalue T_AND_ASSIGN expr {
			$$ = op_assign("and", $1, $3);
		}
		|lvalue T_OR_ASSIGN expr {
			$$ = op_assign("or", $1, $3);
		}
		|lvalue T_LEFTSHIFT_ASSIGN expr {
			$$ = op_assign("sllv", $1, $3);
		}
		|lvalue T_RIGHTSHIFT_ASSIGN expr {
			$$ = op_assign("srlv", $1, $3);
		}
		|lvalue T_XOR_ASSIGN expr {
			$$ = op_assign("xor", $1, $3);
		}

method_call: method_name tlparen expr_comma_list trparen {
		   //user method call
		    bool flag = false;
		    s.add_cmd($4);
		    s.in(true);
			for (int i = 0; i < s.stack[s.sp-1].release_list.size(); i++)
			{
				add_arg(s.stack[s.sp-1].release_list[i], i);
			}
		   	s.add_cmd("jal " + $1);
			/*Calling...*/
			s.out(2);
			for (int i = 0 ; i < s.stack[s.sp].release_list.size(); i++)
			{
				s.stack[s.sp].remove_slot(s.stack[s.sp].release_list[i]);
			}
			s.stack[s.sp].release_list.clear();
			//string ret("v0");
			string ret = s.stack[s.sp].find_slot();
			s.add_cmd("move $"+ ret+", $v0"); 
			$$ = ret;

			}
			| tcallout tlparen callout_arg_list trparen {
			// system method call
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
					$$ = "zero";
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
					$$ = "zero";
				}
				else if ($1 == "read_int")
				{
					try{
						//s.stack[s.sp].add_slot("v0");
					}
					catch (const char *s){}
					s.add_cmd("li $v0, 5");
					s.add_cmd("syscall");
					//string ret("v0");
					string ret = s.stack[s.sp].find_slot();
					s.add_cmd("move $"+ ret+", $v0"); 
					$$ = ret;
				}
				else
				{
					throw("system method does not exist");
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
method_name: id {
		   try{
		   	string reg = s.stack[s.sp].get_var($1, s);
			s.stack[s.sp].release_list.push_back(reg);
			$$ = "$"+reg;
		   }
		   catch (...)
		   {
		   		$$ = $1;
		   }
		   //TODO: method exist check
		   }

lvalue: id { 
	  $$ = $1;
	  }
	  | id tlsb expr trsb {
	    $$ = $1 + "[" + $3 +"]";
	  }

expr_comma_list: expr tcomma expr_comma_list {
			   	//add_arg($1);
				s.stack[s.sp].release_list.push_back($1);
				}
				| opt_expr {
					if ($1 != "zero")
					{
						s.stack[s.sp].release_list.push_back($1);
						//add_arg($1);
					}
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
	  | assign {
			$$ = $1;	  
	  }
	  | method_call {
	    //if ($1 != "zero")
		//    s.stack[s.sp].add_slot($1);
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
	  | expr T_XOR expr {
	  	s.add_cmd("xor $" + $1 + ", $" + $1 + ", $" + $3);
		s.stack[s.sp].remove_slot($3);
		$$ = $1;
	  }

	  | T_MINUS expr %prec T_UMINUS {
	  	s.add_cmd("sub $" + $2 + ", $0, $" + $2);
		$$ = $2;
	  }
	  | T_PLUS expr %prec T_UPLUS {
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
	  | T_INCREASE lvalue {
	  	string one = s.stack[s.sp].new_value(1, s);
		$$ = op_assign("add", $2, one);
	  }
	  | lvalue T_INCREASE{
	  	string one = s.stack[s.sp].new_value(1, s);
		$$ = op_assign("add", $1, one);
	  }
	  | T_DECREASE lvalue {
	  	string one = s.stack[s.sp].new_value(1, s);
		$$ = op_assign("sub", $2, one);
	  }
	  | lvalue T_DECREASE{
	  	string one = s.stack[s.sp].new_value(1, s);
		$$ = op_assign("sub", $1, one);
	  }
	  | T_ADDRESS id{
	  try{
	  	string sp;
	  	string address = s.find_var($2, sp);
		string reg = s.stack[s.sp].find_slot();
		s.add_cmd("addi $"+ reg+", $"+sp+", "+address);
		$$ = reg;
		}
		catch (...)
		{
	  	string reg = s.stack[s.sp].find_slot();
		s.add_cmd("la $"+reg+", " + $2);
		$$ = reg;
		}
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
tlcb: T_LCB {
			  s.output_in();
			  s.in(false);
			  if (s.sp == 1)
			  {
		          s.stack[s.sp].add_slot("ra");
			  }
			if (!id_list.empty())
			{
				for (int i = id_list.size() - 1; i >= 0 ; i--)
				{
					if (id_list[i][0] == address_tag)
					{
						s.stack[s.sp].add_var(id_list[i].substr(1),-1);
					}
					else
					{
						s.stack[s.sp].add_var(id_list[i]);
					}
				}
				id_list.clear();
			}
			}
tlparen: T_LPAREN {s.output_in();}
tlsb: T_LSB { }
tlt: T_LT {}
tnew: T_NEW {}
tnull: T_NULL {}
trcb: T_RCB {
	if (s.sp == 1)
	{
		end_function("zero");
	}
	s.out(2);
	$$ = s.output_out();
	}
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

string op_assign(string op, string value, string expr)
{

	int len = value.length();
	string reg;
	if (value[len-1] == ']')
	{
		int i = value.find('[');
		string pos;
		pos = s.stack[s.sp].find_slot();
		s.add_cmd("move $" + pos +", $"+value.substr(i+1, len - i - 2));
		reg =s.stack[s.sp].get_var(value.substr(0,i),  s,  
		value.substr(i+1, len - i - 2));
		//register is fine till here
		if (op == "div" || op == "mod")
		{
			s.add_cmd("div $" + reg + ", $" + expr);
			string op2;
			if (op =="div") op2 = "mflo"; else op2 = "mfhi";
			s.add_cmd(op2+" $" + reg);
		}
		else
		{
			s.add_cmd(op+" $" + reg + ", $" + reg + ", $" +  expr);
		}
		s.stack[s.sp].set_var(value.substr(0,i), reg,  s, 
							  pos);
	}
	else
	{
		reg = s.stack[s.sp].get_var(value,s);
		if (op == "div" || op == "mod")
		{
			s.add_cmd("div $" + reg + ", $" + expr);
			string op2;
			if (op =="div") op2 = "mflo"; else op2 = "mfhi";
			s.add_cmd(op2+" $" + reg);
		}
		else
		{
			s.add_cmd(op+" $" + reg + ", $" + reg + ", $" +  expr);
		}

		s.stack[s.sp].set_var(value, reg, s);
	}
	//s.stack[s.sp].remove_slot(reg);
	s.stack[s.sp].remove_slot(expr);
	return reg;

}


int add_var_list()
{
	  for (int i = id_list.size() - 1; i >= 0; i--)
	  {
		int len = id_list[i].length();
		if (id_list[i].find('=') != string::npos)
		{
			int index = id_list[i].find('=');
			string id = id_list[i].substr(0,index);
			string value = id_list[i].substr(index+1);
			s.stack[s.sp].add_var(id);
			s.stack[s.sp].set_var(id, value, s);
			s.stack[s.sp].remove_slot(value);
		}
		else if (id_list[i][len - 1] != ']')
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

int end_function(string reg)
{
	s.add_cmd("move $a3, $" + reg);
	if (reg != "zero")
	{
		s.stack[s.sp].remove_slot(reg);
	}
	while (!s.stack[s.sp].call_fun)
	{
		if (s.stack[s.sp-1].call_fun)
		{
			s.out(1);
			break;
		}
		else
		{	
			s.out(0);
		}
	}
 	s.add_cmd("move $v0, $a3"); /*save return*/
	s.add_cmd("j $ra");
}

int add_arg(string reg, int arg_cnt)
{
	stringstream ss;
	ss << (-arg_cnt * Memory::step - Memory::step);
	s.add_cmd("sw $" + reg + ", " + ss.str() +"($sp)");
	//s.stack[s.sp-1].release_list.push_back(reg);
}


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
	tag = "_"+s+tag;
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

		hp = "s7";

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
