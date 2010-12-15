#include "stack.h"

string hp;

Stack::Stack()
{
	this->sp = -1;
	this->output_sp = -1;
	this->loop_sp = -1;
	this->main_function = true;
}

int Stack::in(bool call_fun)
{
	if (this-> sp >= this->max_size - 1 )
	{
		throw("stack is full");
	}
	
//	this->output_sp += 1;
	if (this->sp == 0)
	{
		this->stack[this->sp+1].call_fun = true;
	}
	else if (this->sp > 0)
	{

		this->stack[this->sp].save_and_load(SAVE, (*this));
		stringstream ss;
		ss << this->stack[this->sp].cnt;
		string cmd = "subu $sp, " + ss.str();
		//cerr << this->sp <<" " << call_fun<< endl;
		this->add_cmd(cmd);
	}


	this->sp += 1;

	return 0;
}

string Stack::out(bool call_fun)
{
	/*stack pop, return the commands in this levestack pop, return the commands in this levell*/
	if (this->sp < 0)
	{
		throw("stack is empty");
	}

	string ret;
	if (this->sp >= 0)
	{
		/*if (this->sp == 1 && !this->main_function)
		{
		}*/
		/*else*/
		if (this->sp > 1)
		{
			stringstream ss;
			ss << this->stack[(this->sp)-1].cnt;
			string cmd = "addu $sp, " + ss.str();
			this->add_cmd(cmd);
		
			this->stack[(this->sp) - 1].save_and_load(LOAD, (*this));
		
		}
		//ret = this->output_stack[this->output_sp].get_cmd();
		this->stack[this->sp].clear();
	}
	this->stack[this->sp].call_fun = false;
	this->sp -= 1;
//	this->output_sp -= 1;
	if (this->sp == 0 && this->main_function)
		this->main_function = false;
	return "";
}


int Stack::output_in()
{
	if (this-> output_sp >= this->max_size - 1)
	{
		throw("stack is full");
	}
	this->output_sp += 1;
	return 0;
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

int Stack::loop_in(int tag_num)
{	
	if (this-> loop_sp >= this->max_size - 1)
	{
		throw("stack is full");
	}
	this->loop_sp += 1;
	this->loop_stack[this->loop_sp] = tag_num;
	this->loop_pos  [this->loop_sp] = this->sp;
	return 0;
}

int Stack::loop_out()
{
	if (this->loop_sp < 0)
	{
		throw("stack is empty");
	}
	this->loop_sp -= 1;
	return 0;
}

int Stack::current_loop(int &pos)
{
	pos = this->loop_pos[this->loop_sp];
	return this->loop_stack[this->loop_sp];
}


int Stack::add_cmd(string s, char split)
{
	if (s == "")
	{
		return -1;
	}
	int ret = this->output_stack[this->output_sp].add(s, split);
	return ret;
}

string Stack::find_var(string name, string &pointer)
{
	int sp = this->sp + 1;
	map<string, int>::iterator it;
	int base = 0;
	int finding_global = 0;
	//cerr <<name <<": " << endl;
	do
	{
		sp--;
	//	cerr << "stack: " <<sp <<", " << this->stack[sp].call_fun << endl;
		if (sp < 0) throw("variable already exist");
		if (sp < this->sp)
			base += this->stack[sp].cnt;
		if (finding_global == 1) 
			finding_global = 2;
		if (finding_global == 2 && sp > 0) continue;
		if (finding_global == 0 && this->stack[sp].call_fun)
		{
			finding_global = 1;
		}
		it = this->stack[sp].vars.find(name);
	}
	while (it == this->stack[sp].vars.end());
	int pos;
	//cerr<<finding_global << endl;
	//cerr<<"===" << endl;
	if (sp > 0)
	{
		pos = base - ((*it).second)* Memory::step - Memory::step;
		pointer = "sp";
	}
	else
	{
		//cerr  << "here" << endl;
		pos = - ((*it).second)* Memory::step - Memory::step;
		pointer = hp;
	}
	stringstream ss;
	ss << pos;
	/*cerr << name <<": " << pos << endl;
	cerr << name << ": " << endl;
	cerr << this->sp <<", " << sp << endl;
	cerr << base <<", " << pos << endl;
	cerr <<ss.str() << endl;
	cerr << "===" << endl;*/
	return ss.str();
}

