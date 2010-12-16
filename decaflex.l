

s [ \f\n\r\t\v]
d [0-9]
w [a-zA-Z0-9]
c [a-zA-Z]
hex [0-9a-fA-F]

%{
#include "define.h"
#include "base.h"
#include "parser.hpp"

int line;
int pos;
int start_string;
int new_line_error;

bool checkEscape(char c)
{
    return (!(c != 't' && c != 'v' && c != 'r' && c != 'n'
			&& c != 'a' && c != 'f' && c != 'b' && c != '\\'
			&& c != '\'' && c != '\"'));
}

int errorprint(int ecode)
{
	cerr << "Error: ";
	switch (ecode)
	{
		case (ERROR1): {cerr << "unknown escape sequence in string constant";
						break;}
		case (ERROR2): {cerr << "newline in string constant"; 
						break;}
		case (ERROR5): {cerr << "char constant length is greater than one"; 	
						break;}
		case (ERROR6): {cerr << "char constant has zero width"; 
						break;}
		case (ERROR7): {cerr << "unterminated char constant"; 
						break;}
		case (ERROR8): {cerr << "string constant is missing closing delimiter"; 	
						break;}
		case (ERROR9): {cerr << "unterminated string constant";
						break;}

	}
	cerr << endl;
	cerr << "Lexical error: line " << line<<", position " << pos << endl;
}

%}
%s NORMAL C_ONE C_TWO STRING

%%
	BEGIN(NORMAL);


<NORMAL>"/*"	{BEGIN C_ONE; yylval = ""; 
				 pos += 2;  } /*NOTHING*/
<NORMAL>"//"  	{BEGIN C_TWO; yylval = "//"; 
				 pos += 2;  } /*NOTHING*/
<NORMAL>"\""	{BEGIN STRING;yylval = "\""; 
				 pos += 1; start_string = pos; 
				 new_line_error = -1;  } /*NOTHING*/
<C_ONE,C_TWO>.	{string s(yytext); yylval += s; 
                 pos += 1;  } /*NOTHING*/
<C_ONE>\n		{string s(yytext); yylval += s; 
				 line++; pos = START_POSITION;
                 } /*NOTHING*/
<C_ONE>"*/"  	{BEGIN NORMAL; pos += 2; }
<C_TWO>\n		{BEGIN NORMAL; yylval +="\\n"; line++; 
				 pos = START_POSITION; }
<STRING>"\""	{BEGIN NORMAL; yylval += "\"";
				 if (new_line_error != -1)
				 {
				 	pos = start_string;;
					return ERROR2;
				 }
				 pos += 1; return T_STRINGCONSTANT;}
<STRING>[\\]["]	{
					pos += 1;
					return ERROR8;
				}
<STRING>"\\".	{
					pos += 1;
					string s(yytext);
					if (!checkEscape(s[1]))
						return ERROR1;
				    yylval += s;
					pos += 1;
					/*NOTHING*/
				}
<STRING><<EOF>>		{
					pos = start_string;
					return ERROR9;
				}
<STRING>.		{string s(yytext); yylval += s; 
				 pos += 1; } /*NOTHING*/
<STRING>\n		{ pos += 1; new_line_error = pos; 
				  line++; pos = START_POSITION; } /*NOTHING*/


<NORMAL>&&   { yylval = "&&"; pos += 2; return T_AND;  }
<NORMAL>=   { yylval = "="; pos += 1; return T_ASSIGN;   }
<NORMAL>bool   { yylval = "bool"; pos += 4; return T_BOOL;  }
<NORMAL>break   { yylval = "break"; pos += 5; return T_BREAK; }
<NORMAL>callout   { yylval = "callout"; pos += 7; return T_CALLOUT;}
<NORMAL>"'".*"'"   { string s(yytext);
					 s = s.substr(1, s.length() - 2);
					 pos += 1;
                     if (s.length() == 2)
                     {
                        if (s[0] == '\\' && !checkEscape(s[1]))
                        {
                            return ERROR1;
                        }
						else if (s[0] != '\\')
							return ERROR5;

                     }
					 else if (s.length() > 2)
					 	return ERROR5;
					 else if (s.length() == 0)
					 	return ERROR6;
					else 
					{
						if (s[0] =='\\')
							return ERROR7;
					}
					yylval = s;
					pos = pos + s.length() + 1;
                    return T_CHARCONSTANT;   }
<NORMAL>class   { yylval = "class"; pos += 5; return T_CLASS; }
<NORMAL>","   { yylval = ","; pos += 1; return T_COMMA;  }
<NORMAL>continue  { yylval = "continue"; pos += 8; return T_CONTINUE;  }
<NORMAL>"/"   { yylval = "/"; pos += 1; return T_DIV;  }
<NORMAL>"."  { yylval = "."; pos += 1; return T_DOT;   }
<NORMAL>else   { yylval = "else"; pos += 4; return T_ELSE; }
<NORMAL>"=="   { yylval = "=="; pos += 2; return T_EQ;  }
<NORMAL>extends   { yylval = "extends"; pos += 7; return T_EXTENDS; }
<NORMAL>false   { yylval = "false"; pos += 5; return T_FALSE;}
<NORMAL>for   { yylval = "for"; pos += 3; return T_FOR; }
<NORMAL>">="   { yylval = ">="; pos += 2; return T_GEQ; }
<NORMAL>">"  { yylval = ">"; pos += 1; return T_GT;   }
<NORMAL>if   { yylval = "if"; pos += 2; return T_IF;   }
<NORMAL>{d}+ |
<NORMAL>0x{hex}+ {
					string s(yytext); 
					yylval = s; 
					pos += s.length();
					return T_INTCONSTANT; 
				 }
<NORMAL>int   { yylval = "int"; pos += 3; return T_INT;  }
<NORMAL>"{"   { yylval = "{"; pos += 1; return T_LCB;   }
<NORMAL>"<<"   { yylval = "<<"; pos += 2; return T_LEFTSHIFT;   }
<NORMAL>"<="   { yylval = "<="; pos += 2; return T_LEQ;  }
<NORMAL>"("   { yylval = "("; pos += 1; return T_LPAREN;  }
<NORMAL>"["   { yylval = "["; pos += 1; return T_LSB;   }
<NORMAL>"<"   { yylval = "<"; pos += 1; return T_LT; }
<NORMAL>"-"   { yylval = "-"; pos += 1; return T_MINUS;  }
<NORMAL>"%"   { yylval = "%"; pos += 1; return T_MOD;   }
<NORMAL>"*"   { yylval = "*"; pos += 1; return T_MULT;  }
<NORMAL>"!="   { yylval = "!="; pos += 2; return T_NEQ;  }
<NORMAL>new   { yylval = "new"; pos += 3; return T_NEW;  }
<NORMAL>"!"   { yylval = "!"; pos += 1; return T_NOT;   }
<NORMAL>null   { yylval = "null"; pos += 4; return T_NULL;   }
<NORMAL>"||"   { yylval = "||"; pos += 2; return T_OR;  }
<NORMAL>"+"   {  yylval = "+"; pos += 1; return T_PLUS;  }
<NORMAL>"}"   { yylval = "}"; pos += 1; return T_RCB; }
<NORMAL>return   { yylval = "return"; pos += 6; return T_RETURN;  }
<NORMAL>">>"   { yylval = ">>"; pos += 2; return T_RIGHTSHIFT;   }
<NORMAL>rot   { yylval = "rot"; pos += 3; return T_ROT;  }
<NORMAL>")"   { yylval = ")"; pos += 1; return T_RPAREN;  }
<NORMAL>"]"   { yylval = "]"; pos += 1; return T_RSB;   }
<NORMAL>";"   { yylval =";"; pos += 1; return T_SEMICOLON; }
<NORMAL>true   { yylval = "true"; pos += 4; return T_TRUE;}
<NORMAL>void   { yylval = "void"; pos += 4; return T_VOID; }
<NORMAL>while   { yylval = "while"; pos += 5; return T_WHILE;}
<NORMAL>"+=" {yylval = "+="; pos += 2; return T_PLUS_ASSIGN;}
<NORMAL>"-=" {yylval = "-="; pos += 2; return T_MINUS_ASSIGN;}
<NORMAL>"*=" {yylval = "*="; pos += 2; return T_MULT_ASSIGN;}
<NORMAL>"/=" {yylval = "/="; pos += 2; return T_DIV_ASSIGN;}
<NORMAL>"%=" {yylval = "%="; pos += 2; return T_MOD_ASSIGN;}
<NORMAL>"&=" {yylval = "&="; pos += 2; return T_AND_ASSIGN;}
<NORMAL>"|=" {yylval = "|="; pos += 2; return T_OR_ASSIGN;}
<NORMAL>"<<=" {yylval = "<<="; pos += 3; return T_LEFTSHIFT_ASSIGN;}
<NORMAL>">>=" {yylval = ">>="; pos += 3; return T_RIGHTSHIFT_ASSIGN;}
<NORMAL>"++" {yylval ="++"; pos += 2; return T_INCREASE;}
<NORMAL>"--" {yylval ="--"; pos += 2; return T_DECREASE;}

<NORMAL>[a-zA-Z_][a-zA-Z_0-9]* {string s(yytext); yylval = s;
									pos += s.length();
                                    return T_ID; }
<NORMAL>{s}+   { string s(yytext); 
				yylval = ""; 
				for (int i = 0 ; i < s.length(); i++)
				{
					pos++;
					if (s[i] == '\n')
					{
						line++;
						pos = START_POSITION;
						yylval += "\\n";
					}
					else 
						yylval += s[i];
				}
                } /*T_WHITESPACE*/

%%

int yywrap()
{
	return 1;
}

/*int main()
{
	line = START_LINE;
	pos = START_POSITION;
	BEGIN NORMAL;
	int rt;
	while (rt = yylex())
	{
		if (rt <= ERROR)
		{
			errorprint(rt);
			break;
		}
		else if (rt == NOTHING)
		{
		}
		else {
		switch (rt)
		{
        case (T_AND) :  cout << "T_AND" ; break;
        case (T_ASSIGN) :  cout << "T_ASSIGN" ; break;
        case (T_BOOL) :  cout << "T_BOOL" ; break;
        case (T_BREAK) :  cout << "T_BREAK" ; break;
        case (T_CALLOUT) :  cout << "T_CALLOUT" ; break;
        case (T_CHARCONSTANT) :  cout << "T_CHARCONSTANT" ; break;
        case (T_CLASS) :  cout << "T_CLASS" ; break;
        case (T_COMMENT) :  cout << "T_COMMENT" ; break;
        case (T_COMMA) :  cout << "T_COMMA" ; break;
        case (T_CONTINUE) :  cout << "T_CONTINUE" ; break;
        case (T_DIV) :  cout << "T_DIV" ; break;
        case (T_DOT) :  cout << "T_DOT" ; break;
        case (T_ELSE) :  cout << "T_ELSE" ; break;
        case (T_EQ) :  cout << "T_EQ"; break;
        case (T_EXTENDS) :  cout << "T_EXTENDS"; break;
        case (T_FALSE) :  cout << "T_FALSE"; break;
        case (T_FOR) :  cout << "T_FOR" ; break;
        case (T_GEQ) :  cout << "T_GEQ" ; break;
        case (T_GT) :  cout << "T_GT" ; break;
        case (T_IF) :  cout << "T_IF" ; break;
        case (T_INTCONSTANT) :  cout << "T_INTCONSTANT" ; break;
        case (T_INT) :  cout << "T_INT" ; break;
        case (T_LCB) :  cout << "T_LCB" ; break;
        case (T_LEFTSHIFT) :  cout << "T_LEFTSHIFT" ; break;
        case (T_LEQ) :  cout << "T_LEQ" ; break;
        case (T_LPAREN) :  cout << "T_LPAREN" ; break;
        case (T_LSB) :  cout << "T_LSB" ; break;
        case (T_LT) :  cout << "T_LT" ; break;
        case (T_MINUS) :  cout << "T_MINUS" ; break;
        case (T_MOD) :  cout << "T_MOD" ; break;
        case (T_MULT) :  cout << "T_MULT" ; break;
        case (T_NEQ) :  cout << "T_NEQ"; break;
        case (T_NEW) :  cout << "T_NEW" ; break;
        case (T_NOT) :  cout << "T_NOT" ; break;
        case (T_NULL) :  cout << "T_NULL"; break;
        case (T_OR) :  cout << "T_OR" ; break;
        case (T_PLUS) :  cout << "T_PLUS" ; break;
        case (T_RCB) :  cout << "T_RCB" ; break;
        case (T_RETURN) :  cout << "T_RETURN" ; break;
        case (T_RIGHTSHIFT) :  cout << "T_RIGHTSHIFT" ; break;
        case (T_ROT) :  cout << "T_ROT"; break;
        case (T_RPAREN) :  cout << "T_RPAREN"; break;
        case (T_RSB) :  cout << "T_RSB"; break;
        case (T_SEMICOLON) :  cout << "T_SEMICOLON"; break;
        case (T_STRINGCONSTANT) :  cout << "T_STRINGCONSTANT"; break;
        case (T_TRUE) :  cout << "T_TRUE"; break;
        case (T_VOID) :  cout << "T_VOID"; break;
        case (T_WHILE) :  cout << "T_WHILE"; break;
        case (T_ID) :  cout << "T_ID"; break;
        case (T_WHITESPACE) :  cout << "T_WHITESPACE"; break;
		}
		cout <<" ";
		cout << yylval << endl;
		}
	}
	return 0;
}*/
