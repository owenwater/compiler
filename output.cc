
#include "output.h"

Output::Output()
{
	this->cmd.clear();
}

int Output::add(string s, char split)
{
	if (s[s.length() - 1] == split)
		this->cmd += s;
	else
	{
		this->cmd += s + Output::get_line_tag() + split;
	}
	return 0;
}

string Output::get_line_tag()
{
	stringstream ss;
	ss << (line + 1);
	return " # " + ss.str();
}

string Output::get_cmd()
{
	string ret = this->cmd;
	this->cmd.clear();
	return ret;
}
