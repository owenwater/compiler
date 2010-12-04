#include "stack.h"

Stack::Stack()
{
	this->sp = -1;
	this->output_sp = -1;
}

int Stack::in()
{
	if (this-> sp        >= this->max_size - 1 
	 || this-> output_sp >= this->max_size - 1)
	{
		throw("stack is full");
	}
	
	this->output_sp += 1;
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
	/*stack pop, return the commands in this levestack pop, return the commands in this levell*/
	if (this->sp < 0 || this->output_sp < 0)
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
		ret = this->output_stack[this->output_sp].get_cmd();
		this->stack[this->sp].clear();
	}
	this->sp -= 1;
	this->output_sp -= 1;
	return ret;
}


int Stack::output_in()
{
	if (this-> output_sp >= this->max_size - 1)
	{
		throw("stack is full");
	}
	this->output_sp += 1;
}

string Stack::output_out()
{
	if ( this->output_sp < 0)
	{
		throw("stack is empty");
	}
	string ret = this->output_stack[this->output_sp].get_cmd();
	this->output_sp -= 1;
	return ret;
}
int Stack::add_cmd(string s, char split)
{
	//cerr << s<< endl;
	int ret = this->output_stack[this->output_sp].add(s, split);
	return ret;
}

string Stack::find_var(string name)
{
	int sp = this->sp + 1;
	map<string, int>::iterator it;
	int base = 0;
	do
	{
		sp--;
		if (sp < 0) throw("variable already exist");
		if (sp < this->sp)
			base += this->stack[sp].cnt;
		it = this->stack[sp].vars.find(name);
	}
	while (it == this->stack[sp].vars.end());
	int pos = base + (*it).second * Memory::step + Memory::step;
	stringstream ss;
	ss << pos;
	//cerr << name <<": " << pos << endl;
	//cerr << name << ": " << endl;
	//cerr << this->sp <<", " << sp << endl;
	//cerr << base <<", " << pos << endl;
	//cerr <<ss.str() << endl;
	//cerr << "===" << endl;
	return ss.str();
}

