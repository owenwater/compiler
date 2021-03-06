
%{
	#include "base.h"
	#include "memory.h"
	int yylex(void);
	void yyerror(char *s);
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
	   		cout <<"(program "<<$1 << $2 << $3<<$4;
			cout << $5 << $6<< ")" <<endl;
	   }
class_name: id {
		  	$$ = "(class_name "+$1+")";
		  }
field_decl_list: field_decl_list field_decl {
			   		$$ = "(field_decl_list "+ $1+$2+")";
			   }
			 	| { $$ = "(field_decl_list EPSILON)"}
field_decl: type field_list {
		  			$$ = "(field_decl "+$1 + $2 + ")";
		       }
		   |type id tassign constant tsemicolon{
		   			$$ = "(field_decl "+$1+$2+$3+$4+$5+")";
		   	   }
field_list: field tcomma field_list {
		  		$$ = "(field_list " +$1+ $2 + $3 +")"
		    }
			| field tsemicolon {$$ = "(field_list "+$1+$2+")";}
field:  id {
				$$ = "(field "+ $1 + ")";
			}
	    | id tlsb intconstant trsb  {
		 		$$ = "(field "+ $1+$2+$3+$4+")";
		    }

method_decl_list: method_decl_list method_decl {
					$$ = "(method_decl_list "+ $1+$2+")";
				}
				| { $$ = "";}
method_decl: type id tlparen param_list trparen block{
		   		$$ = "(method_decl " + $1+$2+$3+$4+$5+$6+")";
		   }
		    | tvoid id tlparen param_list trparen block{
		   		$$ = "(method_decl " + $1+$2+$3+$4+$5+$6+")";
		   }

param_list: param_comma_list {
		  		$$ = "(param_list "+$1 + ")";
		  }
		  | {$$ = "(param_list EPSILON)";}
param_comma_list: param tcomma param_comma_list {
				$$ = "(param_comma_list "+ $1+$2+$3+")";
				}
				| param {
					$$= "(param_comma_list " + $1+")";
				}
param: type id {$$ = "(param "+$1+$2+")";}

block: tlcb var_decl_list statement_list trcb {
					$$ = "(block " + $1+$2+$3+$4+")";
				}
var_decl_list: var_decl var_decl_list {
			 	$$ = "(var_decl_list " + $1+$2+")";
			 }
			 | {$$ = "(var_decl_list EPSILON)";}

var_decl: type  id id_comma_list tsemicolon   {
			$$ = "(var_decl "+$1+$2+$3+$4+")";
		}

id_comma_list: tcomma id id_comma_list {
			 		$$ = "(id_comma_list "+$1+$2+$3+")";}
			   | {
			   $$ =  "(id_comma_list EPSILON)";
			   }
type:  T_INT {$$ = "(type (T_INT int))";}
	 | T_BOOL{$$ = "(type (T_BOOL bool))";}

tvoid: T_VOID{$$ = "(T_VOID void)";}

statement_list: statement statement_list{
			  	$$ = "(statement_list "+$1+$2+")";
			  }
			  | {$$ = "(statement_list EPSILON)";}

statement:
		 assign tsemicolon {
		 	$$ = "(statement "+$1+$2+")";
		 }
		 |method_call tsemicolon {
		 	$$ = "(statement "+$1+$2+")";
		 }
		 |tif tlparen expr trparen block {
		 	$$ = "(statement "+$1+$2+$3+$4+$5+")";
		 }
		 |tif tlparen expr trparen block telse block {
		 	$$ = "(statement "+$1+$2+$3+$4+$5+$6+$7+")";
		 }
		 | twhile tlparen expr trparen block {
		 	$$ = "(statement "+$1+$2+$3+$4+$5+")";
		 }
		 | tfor tlparen assign_comma_list tsemicolon expr tsemicolon assign_comma_list trparen block {
		 	$$ = "(statement "+$1+$2+$3+$4+$5+$6+$7+$8+")";
		 }
		 | treturn opt_expr tsemicolon {
		 	$$ = "(statement "+$1+$2+$3+")";
		 }
		 | tbreak tsemicolon {
		 	$$ = "(statement "+$1+$2+")";
		 }
		 | tcontinue tsemicolon {
		 	$$ = "(statement "+$1+$2+")";
		 }
		 | block {
		 	$$ = "(statement "+$1+")";
		 }

assign_comma_list: assign tcomma assign_comma_list {
				 	$$ = "(assign_comma_list "+$1+$2+$3+")";
				 }
				 | assign {
				 	$$ = "(assign_comma_list "+ $1+")";
				 }
assign:	lvalue tassign expr {
	  		$$ = "(assign " + $1+$2+$3+")";
	  	}

method_call: method_name tlparen expr_comma_list trparen {
				$$ = "(method_call "+ $1+$2+$3+$4+")";
			}
			| tcallout tlparen callout_arg_list trparen {
				$$ = "(method_call "+ $1+$2+$3+$4+")";
			}

callout_arg_list: stringconstant callout_arg_comma_list {
					$$ = "(callout_arg_list " + $1+$2+")";
				}
callout_arg_comma_list: tcomma callout_arg callout_arg_comma_list {
					  $$ = "(callout_arg_comma_list " + $1+$2+$3+")";

				}
				|  {
					$$ = "(callout_arg_comma_list EPSILON)";
				}
callout_arg: expr {
		   		$$ = "(callout_arg " + $1 + ")";
		   }
		   | stringconstant {
		   		$$ = "(callout_arg " + $1 +")";
			}
method_name: id {$$ = $1;}

lvalue: id {$$ = "(lvalue " + $1 + ")";}
	  | id tlsb expr trsb {
	  	$$ = "(lvalue " + $1+$2+$3+$4+ ")";
	  }

expr_comma_list: opt_expr tcomma expr_comma_list {
			   		$$ = "(expr_comma_list "+$1+$2+$3+")";
				}
				| opt_expr {
			   		$$ = "(expr_comma_list "+$1+")";
				}

opt_expr: expr{ $$ = "(opt_expr " + $1+ ")";}
		| {$$ = "(opt_expr EPSILON)";}

expr: lvalue {
		$$ = "(expr " + $1+")";
	  }
	  | method_call {
		$$ = "(expr " + $1+")";
	  }
	  | constant {
		$$ = "(expr " + $1+")";
	  }
	  | expr bin_op expr {
		$$ = "(expr " + $1+$2+$3+")";
	  }
	  | tminus expr %prec T_UMINUS {
		$$ = "(expr " + $1+$2+")";
	  }
	  | tnot expr {
		$$ = "(expr " + $1+$2+")";
	  }
	  | tlparen expr trparen {
		$$ = "(expr " + $1+$2+$3+")";
	  }

bin_op: arith_op { $$ = $1;}
	    |rel_op {$$ = $1;}
	    |eq_op {$$ = $1;}
	    |cond_op {$$ = $1;}

arith_op:tplus {$$ = $1;}
	    |tminus {$$ = $1;}
	    |tmult {$$ = $1;}
	    |tdiv  {$$ = $1;}
	    |tmod {$$ = $1;}
	    |tleftshift {$$ = $1;}
	    |trightshift {$$ = $1;}
	    |trot {$$ = $1;}

rel_op : tgeq {$$ = $1;}
	    |tgt {$$ = $1;}
	    |tleq {$$ = $1;}
	    |tlt {$$ = $1;}

eq_op : teq {$$ = $1;}
	    |tneq {$$ = $1;}

cond_op : tand {$$ = $1;}
	    |tor {$$ = $1;}

constant: intconstant {
			$$ = "(constant "+$1+")";
		}
		|T_CHARCONSTANT {
			$$ = "(constant (T_CHARCONSTANT '"+$1+"'))";
		}
		|bool_constant {
			$$ = "(constant " + $1 + ")";
		}
bool_constant: T_TRUE {$$ = "(bool_constant (T_TRUE "+$1+"))";}
			|T_FALSE {$$ = "(bool_constant (T_FALSE "+$1+"))";}
intconstant: T_INTCONSTANT { $$ = "(T_INTCONSTANT "+$1+")";}


stringconstant: T_STRINGCONSTANT {$$ = "(T_STRINGCONSTANT "+$1+")"; }
id: T_ID {$$ = "(T_ID "+ $1+")";}

tand: T_AND { $$ = "(T_AND &&)"; }
tassign: T_ASSIGN { $$ = "(T_ASSIGN =)"; }
tbreak: T_BREAK { $$ = "(T_BREAK break)"; }
tcallout: T_CALLOUT { $$ = "(T_CALLOUT callout)"; }
tclass: T_CLASS { $$ = "(T_CLASS class)"; }
tcomma: T_COMMA { $$ = "(T_COMMA ,)"; }
tcontinue: T_CONTINUE { $$ = "(T_CONTINUE continue)"; }
tdiv: T_DIV { $$ = "(T_DIV /)"; }
tdot: T_DOT { $$ = "(T_DOT .)"; }
telse: T_ELSE { $$ = "(T_ELSE else)"; }
teq: T_EQ { $$ = "(T_EQ ==)"; }
textends: T_EXTENDS { $$ = "(T_EXTENDS extends)"; }
tfor: T_FOR { $$ = "(T_FOR for)"; }
tgeq: T_GEQ { $$ = "(T_GEQ >=)"; }
tgt: T_GT { $$ = "(T_GT >)"; }
tif: T_IF { $$ = "(T_IF if)"; }
tlcb: T_LCB { $$ = "(T_LCB {)"; }
tleftshift: T_LEFTSHIFT { $$ = "(T_LEFTSHIFT <<)"; }
tleq: T_LEQ { $$ = "(T_LEQ <=)"; }
tlparen: T_LPAREN { $$ = "(T_LPAREN \\()"; }
tlsb: T_LSB { $$ = "(T_LSB [)"; }
tlt: T_LT { $$ = "(T_LT <)"; }
tminus: T_MINUS { $$ = "(T_MINUS -)"; }
tmod: T_MOD { $$ = "(T_MOD %)"; }
tmult: T_MULT { $$ = "(T_MULT *)"; }
tneq: T_NEQ { $$ = "(T_NEQ !=)"; }
tnew: T_NEW { $$ = "(T_NEW new)"; }
tnot: T_NOT { $$ = "(T_NOT !)"; }
tnull: T_NULL { $$ = "(T_NULL null)"; }
tor: T_OR { $$ = "(T_OR or)"; }
tplus: T_PLUS { $$ = "(T_PLUS +)"; }
trcb: T_RCB { $$ = "(T_RCB })"; }
treturn: T_RETURN { $$ = "(T_RETURN return)"; }
trightshift: T_RIGHTSHIFT { $$ = "(T_RIGHTSHIFT >>)"; }
trot: T_ROT { $$ = "(T_ROT rot)"; }
trparen: T_RPAREN { $$ = "(T_RPAREN \\))"; }
trsb: T_RSB { $$ = "(T_RSB ])"; }
tsemicolon: T_SEMICOLON { $$ = "(T_SEMICOLON ;)"; }
twhile: T_WHILE { $$ = "(T_WHILE while)"; }

	
%%

void yyerror(char *s)
{
	string msg(s);
	cerr << s << endl;
}

int main()
{
	Stack s;
	yydebug = 0;
	yyparse();
	return 0;
}
