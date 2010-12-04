#include "stack.h"

Memory::Memory()
{
	this->regi.clear();
	this->vars.clear();
	this->cnt = 0;
}

void Memory::remove_slot(string name)
{
	this->set_it = this->regi.find(name);
	if (this->set_it == this->regi.end())
		throw("register doesnt exist");
	else
		this->regi.erase(this->set_it);
}

string Memory::find_slot()
{
	for (int i = 0; i <= 9; i++)
	{
		string name = "t";
		char c = i + '0';
		name += c;
		
		try
		{
			this->add_slot(name);
		}
		catch (const char *s)
		{
			continue;
		}
		return name;
	}
	throw("register is full");
}

int Memory::add_slot(string name)
{
	this->set_it = this->regi.find(name);
	if (set_it == regi.end())
	{
		regi.insert(name);
	}
	else
	{
		throw ("register exist");
	}
}

string Memory::new_value(int value, Stack &s)
{
	string name = this->find_slot();
	stringstream ss;
	ss << value;
	string cmd = "li $" + name + ", " + ss.str();
	s.add_cmd(cmd);
	return name;
}

int Memory::add_var(string name)
{
	this->map_it = this->vars.find(name);
	if (this->map_it != this->vars.end())
	{
		throw("variable already exist");
	}
	else
	{
		int num = vars.size();
		vars[name] = num;
	}
	return 0;
}

int Memory::set_var(string name, string reg, Stack &s)
{
	string pos = s.find_var(name);
	string cmd = "sw $" + reg + ", " + pos + "($sp)";
	s.add_cmd(cmd);
	return 0;
}

string Memory::get_var(string name, Stack &s)
{
	string pos = s.find_var(name);
	string reg = this->find_slot();
	string cmd = "lw $" + reg + ", " + pos + "($sp)";
	s.add_cmd(cmd);
	return reg;
}

int Memory::save_and_load(int flag, Stack &s)
{
	string op;
	if (flag == SAVE) 
		op = "sw";
	else
		op = "lw";
	this->set_it = this->regi.begin();
	int step = this->step;
	int cnt = this->vars.size() * step;
	while (this->set_it != this->regi.end())
	{
		cnt += step;
		stringstream ss;
		ss<< cnt;
		string cmd = op + " $" + (*set_it) + ", " + ss.str() + "($sp)";
		s.add_cmd(cmd);
		set_it++;
	}
	this->cnt = cnt;
	return cnt;
}

int Memory::clear()
{
	this->regi.clear();
	this->vars.clear();
	this->cnt = 0;
}

/*
 * Unit Test
 */
/*
int main()
{
	try
	{
		Stack s;
		s.stack[s.sp].new_value(3);
		s.stack[s.sp].new_value(3);
		s.stack[s.sp].add_var("a");
		s.stack[s.sp].set_var("a","t0");
		s.stack[s.sp].get_var("a");
		s.in();
		s.out();
		s.stack[s.sp].remove_slot("t0");
		s.stack[s.sp].new_value(4);
		s.stack[s.sp].add_var("a");
	}
	catch (const char *s)
	{
		string err(s);
		cerr << err << endl;
	}

}
*/
