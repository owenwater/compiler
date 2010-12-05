
#include "print.h"

string Print::print_int(string s)
{
	//cerr << s << endl;
	string ret;
	ret =  "move $a0, $" +  s + Output::get_line_tag()
		  + "\nli $v0, 1" + Output::get_line_tag()
		  + "\nsyscall";
	return ret;
}

string Print::print_str(string s)
{
	string ret;
	ret = "li $v0, 4\n";
	if (s ==" ")
	{
		ret += "la $a0, space" + Output::get_line_tag() + "\n";
	}
	else if (s == "\n")
	{
		ret += "la $a0, enter" + Output::get_line_tag() + "\n";
	}
	else
	{
		ret += "la $a0, " + s + Output::get_line_tag() + "\n";
	}
	ret += "syscall" ;
	return ret;
}

/*
 * Unit Test
 */
/*
int main()
{
	string s =  "t0" ;
	cout << Print::print_int(s) << endl;
	cout << Print::print_str(" ")<< endl;
	cout << Print::print_str("\n")<< endl;

}*/

