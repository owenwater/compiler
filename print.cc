
#include "print.h"

string Print::print_int(string s)
{
	cerr << s << endl;
	string ret;
	ret =  "move $a0, $" +  s + "\nli $v0, 1\nsyscall";
	return ret;
}

string Print::print_str(string s)
{
	string ret;
	ret = "li $v0, 4\n";
	if (s ==" ")
	{
		ret += "la $a0, space\n";
	}
	else if (s == "\n")
	{
		ret += "la $a0, enter\n";
	}
	else
	{
		ret += "la $a0, " + s + "\n";
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

