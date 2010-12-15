#include "stack.h"

Memory::Memory()
{
	this->clear();
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
	const string reg_name[17] = 
			{"t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9",
			 "s0", "s1", "s2", "s3", "s4", "s5", "s6"};
	const int reg_num = 17;
	for (int i = 0; i < reg_num; i++)
	{
		string name = reg_name[i];
		
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

string Memory::new_value(int value, Stack &s )
{
	string name = this->find_slot();
	stringstream ss;
	ss << value;
	string cmd = "li $" + name + ", " + ss.str();
	s.add_cmd(cmd);
	return name;
}

int Memory::add_var(string name, int len )
{
	this->map_it = this->vars.find(name);
	if (this->map_it != this->vars.end())
	{
		throw("variable already exist");
	}
	else
	{
		vars[name] = this->num;
		this->num += len;
	}
	return 0;
}

int Memory::set_var(string name, string reg, Stack &s, string move  )
{
	string sp;
	string pos = s.find_var(name, sp);
	if (move != "")
	{
		s.add_cmd("sll $" +  move + ", $" + move + ", 2");
		s.add_cmd("sub $"+sp+", $"+sp+", $" +  move);
	}
	string cmd = "sw $" + reg + ", " + pos + "($"+sp+")";
	s.add_cmd(cmd);
	if (move != "")
	{
		s.add_cmd("add $"+sp+", $"+sp+", $" + move);
		this->remove_slot(move);
	}
	return 0;
}

string Memory::get_var(string name, Stack &s, string move )
{
	string sp;
	string pos = s.find_var(name, sp);
	string reg = this->find_slot();
	if (move != "")
	{
		s.add_cmd("sll $" +  move + ", $" + move + ", 2");
		s.add_cmd("sub $"+sp+", $"+sp+", $" + move);
	}
	string cmd = "lw $" + reg + ", " + pos + "($"+sp+")";
	s.add_cmd(cmd);
	if (move != "")
	{
		s.add_cmd("add $"+sp+", $"+sp+", $" + move);
		this->remove_slot(move);
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
	int cnt = this->num * step;
	while (this->set_it != this->regi.end())
	{
		cnt += step;
		stringstream ss;
		ss<< -cnt;
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
	this->num = 0;
	this->call_fun = false;
	this->release_list.clear();
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
