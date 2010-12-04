
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
	
	Stack s;
	vector <string> args_list;
	vector <string> string_record;
	vector <string> id_list;
	
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
			cout << $6 << endl;
	   		//cout <<"(program "<<$1 << $2 << $3<<$4;
			//cout << $5 << $6<< ")" <<endl;
	   }
class_name: id {
		  	/*$$ = "(class_name "+$1+")";*/
		  }
field_decl_list: field_decl_list field_decl {
			   		/*$$ = "(field_decl_list "+ $1+$2+")";*/
			   }
			 	| { /*$$ = "(field_decl_list EPSILON)";*/}
field_decl: type field_list {
		  			/*$$ = "(field_decl "+$1 + $2 + ")";*/
		       }
		   |type id T_ASSIGN constant tsemicolon{
		   			/*$$ = "(field_decl "+$1+$2+$3+$4+$5+")";*/
		   	   }
field_list: field tcomma field_list {
		  		/*$$ = "(field_list " +$1+ $2 + $3 +")";*/
		    }
			| field tsemicolon {/*$$ = "(field_list "+$1+$2+")";*/}
field:  id {
				/*$$ = "(field "+ $1 + ")";*/
			}
	    | id tlsb T_INTCONSTANT trsb  {
		 		/*$$ = "(field "+ $1+$2+$3+$4+")";*/
		    }

method_decl_list: method_decl_list method_decl {
					/*$$ = "(method_decl_list "+ $1+$2+")";*/
				}
				| {
				/*$$ = "";*/}
method_decl: type id tlparen param_list trparen block{
		   		s.add_cmd($2 + ":");
				s.add_cmd($6);
		   		/*$$ = "(method_decl " + $1+$2+$3+$4+$5+$6+")";*/
		   }
		    | tvoid id tlparen param_list trparen block{
		   		s.add_cmd($2 + ":");
				s.add_cmd($6);
				if ($2 == "main")
				{
					s.add_cmd("li $v0, 10");;
					s.add_cmd("syscall");
				}
		   		/*$$ = "(method_decl " + $1+$2+$3+$4+$5+$6+")";*/
		   }

param_list: param_comma_list {
		  		/*$$ = "(param_list "+$1 + ")";*/
		  }
		  | {/*$$ = "(param_list EPSILON)";*/}
param_comma_list: param tcomma param_comma_list {
				/*$$ = "(param_comma_list "+ $1+$2+$3+")";*/
				}
				| param {
					/*$$= "(param_comma_list " + $1+")";*/
				}
param: type id {/*$$ = "(param "+$1+$2+")";*/}

block: tlcb var_decl_list statement_list trcb {
	 			$$ = $4;
				}
var_decl_list: var_decl var_decl_list {
			 	/*$$ = "(var_decl_list " + $1+$2+")";*/
			 }
			 | {/*$$ = "(var_decl_list EPSILON)";*/}

var_decl: type  id id_comma_list tsemicolon   {
			id_list.push_back($2);
			for (int i = 0; i < id_list.size(); i++)
			{
				//cerr << id_list[i]<<endl;
				int rt = s.stack[s.sp].add_var(id_list[i]);

			}
			id_list.clear();
			/*$$ = "(var_decl "+$1+$2+$3+$4+")";*/
		}

id_comma_list: tcomma id id_comma_list {
			 id_list.push_back($2)

			 		/*$$ = "(id_comma_list "+$1+$2+$3+")";*/}
			   | {
			   /*$$ =  "(id_comma_list EPSILON)";*/
			   }
type:  T_INT { $$ = "int"/*$$ = "(type (T_INT int))";*/}
	 | T_BOOL{ $$ = "bool"/*$$ = "(type (T_BOOL bool))";*/}

tvoid: T_VOID{ $$ = "void"/*$$ = "(T_VOID void)";*/}

statement_list: statement statement_list{
			  	/*$$ = "(statement_list "+$1+$2+")";*/
			  }
			  | {/*$$ = "(statement_list EPSILON)";*/}

statement:
		 assign tsemicolon {
		 	/*$$ = "(statement "+$1+$2+")";*/
		 }
		 |method_call tsemicolon {
		 	/*$$ = "(statement "+$1+$2+")";*/
		 }
		 |tif tlparen expr trparen block {
		 	if_cnt++;
			string then_tag  = get_tag(if_cnt, "then");
			string end_tag   = get_tag(if_cnt, "end_if");
			
			string condition = $3;
			s.add_cmd("beq $" + condition + ", $zero, "+ end_tag);

			s.add_cmd(then_tag+":");
			s.add_cmd($5);
			s.add_cmd(end_tag+":");
		 	
		 	/*$$ = "(statement "+$1+$2+$3+$4+$5+")";*/
		 }
		 |tif tlparen expr trparen block telse block {
		 	if_cnt++;
			string then_tag = get_tag(if_cnt, "then");
			string else_tag = get_tag(if_cnt, "else");
			string end_tag   = get_tag(if_cnt, "end_if");
			
			string condition = $3;
			s.add_cmd("beq $" + condition + ", $zero, "+ else_tag);

			s.add_cmd(then_tag+":");
			s.add_cmd($5);
			s.add_cmd("j " +  end_tag);
			s.add_cmd(else_tag+":");
			s.add_cmd($7);
			s.add_cmd(end_tag+":");

		 	/*$$ = "(statement "+$1+$2+$3+$4+$5+$6+$7+")";*/
		 }
		 | twhile tlparen expr trparen block {
		 	/*$$ = "(statement "+$1+$2+$3+$4+$5+")";*/
		 }
		 | tfor tlparen assign_comma_list tsemicolon expr tsemicolon assign_comma_list trparen block {
		 	/*$$ = "(statement "+$1+$2+$3+$4+$5+$6+$7+$8+")";*/
		 }
		 | treturn opt_expr tsemicolon {
		 	/*$$ = "(statement "+$1+$2+$3+")";*/
		 }
		 | tbreak tsemicolon {
		 	/*$$ = "(statement "+$1+$2+")";*/
		 }
		 | tcontinue tsemicolon {
		 	/*$$ = "(statement "+$1+$2+")";*/
		 }
		 | block {
		 	s.add_cmd($1);
		 	/*$$ = "(statement "+$1+")";*/
		 }

assign_comma_list: assign tcomma assign_comma_list {
				 	/*$$ = "(assign_comma_list "+$1+$2+$3+")";*/
				 }
				 | assign {
				 	/*$$ = "(assign_comma_list "+ $1+")";*/
				 }
assign:	lvalue T_ASSIGN expr {
	  		s.stack[s.sp].set_var($1, $3, s);
			s.stack[s.sp].remove_slot($3);
			$$ = $1;
	  		/*$$ = "(assign " + $1+$2+$3+")";*/
	  	}

method_call: method_name tlparen expr_comma_list trparen {
				/*$$ = "(method_call "+ $1+$2+$3+$4+")";*/
			}
			| tcallout tlparen callout_arg_list trparen {
			$$ = $3;
				/*$$ = "(method_call "+ $1+$2+$3+$4+")";*/
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
					/*$$ = "(callout_arg_list " + $1+$2+")";*/
				}
callout_arg_comma_list: tcomma callout_arg callout_arg_comma_list {
					  args_list.push_back($2);
					  /*$$ = "(callout_arg_comma_list " + $1+$2+$3+")";*/

				}
				|  {
					/*$$ = "(callout_arg_comma_list EPSILON)";*/
				}
callout_arg: expr {
		   $$ = $1;
		   		/*$$ = "(callout_arg " + $1 + ")";*/
		   }
		   | stringconstant {
		   $$ = $1;
		   		/*$$ = "(callout_arg " + $1 +")";*/
			}
method_name: id {/*$$ = $1;*/}

lvalue: id { $$ = $1;/*$$ = "(lvalue " + $1 + ")";*/}
	  | id tlsb expr trsb {
	  	/*$$ = "(lvalue " + $1+$2+$3+$4+ ")";*/
	  }

expr_comma_list: opt_expr tcomma expr_comma_list {
			   		/*$$ = "(expr_comma_list "+$1+$2+$3+")";*/
				}
				| opt_expr {
			   		/*$$ = "(expr_comma_list "+$1+")";*/
				}

opt_expr: expr{ /*$$ = "(opt_expr " + $1+ ")";*/}
		| {/*$$ = "(opt_expr EPSILON)";*/}

expr: lvalue {
		$$ = s.stack[s.sp].get_var($1,s);
		/*$$ = "(expr " + $1+")";*/
	  }
	  | method_call {
	  	$$ = $1;
		/*$$ = "(expr " + $1+")";*/
	  }
	  | constant {
	  	$$ = $1;
		/*$$ = "(expr " + $1+")";*/
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
	  $$ = $2;
		/*$$ = "(expr " + $1+$2+$3+")";*/
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
			  /*$$ = "(T_STRINGCONSTANT "+$1+")";*/ }
id: T_ID { $$ = $1; /*$$ = "(T_ID "+ $1+")";*/}

tbreak: T_BREAK { /*$$ = "(T_BREAK break)";*/ }
tcallout: T_CALLOUT { /*$$ = "(T_CALLOUT callout)";*/ }
tclass: T_CLASS { /*$$ = "(T_CLASS class)";*/ }
tcomma: T_COMMA { /*$$ = "(T_COMMA ,)";*/ }
tcontinue: T_CONTINUE { /*$$ = "(T_CONTINUE continue)";*/ }
tdot: T_DOT { /*$$ = "(T_DOT .)";*/ }
telse: T_ELSE { /*$$ = "(T_ELSE else)";*/ }
textends: T_EXTENDS { /*$$ = "(T_EXTENDS extends)";*/ }
tfor: T_FOR { /*$$ = "(T_FOR for)";*/ }
tif: T_IF { /*$$ = "(T_IF if)";*/ }
tlcb: T_LCB { s.in();
			//cerr<<"SP: " << s.sp << endl;/*$$ = "(T_LCB {)";*/
			}
tlparen: T_LPAREN { /*$$ = "(T_LPAREN \\()";*/ }
tlsb: T_LSB { /*$$ = "(T_LSB [)";*/ }
tlt: T_LT { /*$$ = "(T_LT <)";*/ }
tnew: T_NEW { /*$$ = "(T_NEW new)";*/ }
tnull: T_NULL { /*$$ = "(T_NULL null)";*/ }
trcb: T_RCB { $$ = s.out();/*$$ = "(T_RCB })";*/ }
treturn: T_RETURN { /*$$ = "(T_RETURN return)";*/ }
trot: T_ROT { /*$$ = "(T_ROT rot)";*/ }
trparen: T_RPAREN { /*$$ = "(T_RPAREN \\))";*/ }
trsb: T_RSB { /*$$ = "(T_RSB ])";*/ }
tsemicolon: T_SEMICOLON { /*$$ = "(T_SEMICOLON ;)";*/ }
twhile: T_WHILE { /*$$ = "(T_WHILE while)";*/ }

	
%%

void yyerror(const char *s)
{
	string msg(s);
	cerr << s << endl;
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
