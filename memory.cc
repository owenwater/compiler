#include "memory.h"

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

string Memory::new_value(int value)
{
	string name = this->find_slot();
	cout << "li $" << name<<", " << value << endl;
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

int Memory::set_var(string name, string reg)
{
	this->map_it = this->vars.find(name);
	if (this->map_it == this->vars.end())
	{
		throw("variable doesnt exist");
	}
	else
	{
		int step = this->step;
		cout <<"sw $"<<reg<<", " << (*map_it).second*step+step<<"($sp)"<< endl;
	}
	return 0;
}

string Memory::get_var(string name)
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
		cout <<"lw $"<<reg<<", " << (*map_it).second*step+step<<"($sp)"<< endl;
	}
	return reg;
}

int Memory::save_and_load(int flag)
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
		cout << op <<" $"<<(*set_it)<<", " << cnt <<"($sp)"<< endl;
		set_it++;
	}
	this->cnt = cnt;
	return cnt;
}


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
		this->stack[this->sp].save_and_load(SAVE);
		cout <<"subu $sp, " << this->stack[this->sp].cnt << endl;
	}
	this->sp += 1;
	return 0;
}

int Stack::out()
{
	if (this->sp < 0)
	{
		throw("stack is empty");
	}

	this->sp -= 1;
	if (this->sp >= 0)
	{
		cout <<"addu $sp, " << this->stack[this->sp].cnt << endl;
		this->stack[this->sp].save_and_load(LOAD);
	}
	return 0;
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
