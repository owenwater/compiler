
#include "symbol_table.h"

Symbol_Table::Symbol_Table
{
	this->tree.clear();
	this->pos = -1;
}

int Symbol_Table::add_var(string name, string type, int len)
{
	this->tree[this->pos].set_var(pos, reg, move);
}

string Symbol_Table::get_var(string name, string &type, string move)
{
	string pos = this->find_var(name, type, false);
	string reg = regi.find_slot();
	this->tree[this->pos].get_var(pos, reg, move);
	this->remove_slot(move);
}

int Symbol_Table::set_var(string name, string type, 
		              string reg , string move)
{
	string pos = this->find_var(name, type, true);
	this->tree[this->pos].set_var(pos, reg, move);
	regi.remove_slot(move);
	return 0;
}

string Symbol_Table::find_var(string name, string type, bool check)
{
	map<string, int>::iterator it;
	int pos = this->pos;
	string var_pos;
	while (true)
	{
		if (pos == 0)
		{
			break;
		}
		it = this->tree[pos].id.find(name);
		if (it == this->tree[pos].id.end())
		{
			pos = this->tree[pos].father;
			continue;
		}

		int slot = (*it).second();
		if (check && this->tree[pos].type[slot] != type)
		{
				throw("type error");
		}
		else if (!check)
		{
			type = this->tree[pos].type[slot];
		}

	}
}


