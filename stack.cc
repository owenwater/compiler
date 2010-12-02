#include "stack.h"

Stack::Stack()
{
	this->sp = -1;
}

int Stack::in()
{
	if (this->sp >= this->max_size - 1)
	{
		throw("stack is full");
	}
	
	if (this->sp >= 0)
	{
		this->stack[this->sp].save_and_load(SAVE, (*this));
		
		stringstream ss;
		ss << this->stack[this->sp].cnt;
		string cmd = "subu $sp, " + ss.str();
		this->add_cmd(cmd);
	}
	this->sp += 1;
	return 0;
}

string Stack::out()
{
	if (this->sp < 0)
	{
		throw("stack is empty");
	}

	string ret;
	if (this->sp >= 0)
	{
		if (this->sp > 0)
		{
			stringstream ss;
			ss << this->stack[(this->sp)-1].cnt;
			string cmd = "addu $sp, " + ss.str();
			this->add_cmd(cmd);
		
			this->stack[(this->sp) - 1].save_and_load(LOAD, (*this));
		
		}
		ret = this->output_stack[this->sp].get_cmd();
	}
	this->sp -= 1;
	return ret;
}

int Stack::add_cmd(string s, char split)
{
	//cerr << s<< endl;
	int ret = this->output_stack[this->sp].add(s, split);
	return ret;
}

