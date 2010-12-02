
#include "output.h"

Output::Output()
{
	this->cmd.clear();
}

int Output::add(string s, char split)
{
	this->cmd += s + split;
	return 0;
}

string Output::get_cmd()
{
	string ret = this->cmd;
	this->cmd.clear();
	return ret;
}
