#include "stack.h"

Memory::Memory()
{
	this->regi.clear();
	this->vars.clear();
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
		this->set_it = this->regi.find(name);
		if (set_it == regi.end())
		{
			regi.insert(name);
			return name;
		}
	}
	throw("register is full");
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
	this->map_it = this->vars.find(name);
	if (this->map_it == this->vars.end())
	{
		throw("variable doesnt exist");
	}
	else
	{
		int step = this->step;
		stringstream ss;
		ss <<  (*map_it).second*step+step;
		string cmd = "sw $" + reg + ", " + ss.str() + "($sp)";
		s.add_cmd(cmd);

	}
	return 0;
}

string Memory::get_var(string name, Stack &s)
{
	this->map_it = this->vars.find(name);
	string reg;
	if (this->map_it == this->vars.end())
	{
		throw("variable doesnt exist");
	}
	else
	{
		reg = this->find_slot();
		int step = this->step;
		stringstream ss;
		ss <<  (*map_it).second*step+step;
		string cmd = "lw $" + reg + ", " + ss.str() + "($sp)";
		s.add_cmd(cmd);
	}
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
