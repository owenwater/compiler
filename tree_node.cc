
#include "symbol_table.h"

Tree_Node::Tree_Node()

int Tree_Node::get_num()
{
	return this->num;
}

int Tree_Node::get_father()
{
	return this->father;
}

void Tree_Node::new_node(int fater)
{
	this->clear();
	this->father = father;
}

void Tree_Node::clear()
{
	this->id.clear();
	this->type.clear();
	this->address.clear();
	this->num = 0;
}

int Tree_Node::add_var(string name, string type, int len)
{
	this->it = this->id.find(name);
	if (this->it != this->id.end())
	{
		throw("variable already exist");
	}
	else
	{
		int cnt = id.size();
		id[name] = cnt;

		stringstream ss;
		ss << this->num * step + step;

		this->address.push_back(ss.str());
		this->type.push_back(type);
		this->num += len;
	}
	
	return 0;
}

string Tree_Node::get_var(string pos, string reg, string move)
{
	if (move != "")
	{
		code.add_cmd(code.b_op(code.sll, move, move, "2"));
		code.add_cmd(code.b_op(code.add, code.sp, code.sp, move));
	}
	code.add_cmd(code.sl(code.lw, reg, pos, code.sp ));
	if (move != "")
	{
		code.add_cmd(code.b_op(code.sub, code.sp, code.sp, move));
	}
	return reg;
}

int Tree_Node::set_var(string pos, string reg, string move)
{
	if (move != "")
	{
		code.add_cmd(code.b_op(code.sll, move, move, "2"));
		code.add_cmd(code.b_op(code.add, code.sp, code.sp, move));
	}
	code.add(code.sl(code.sw, reg, pos, code.sp ));
	if (move != "")
	{
		code.add_cmd(code.b_op(code.sub, code.sp, code.sp, move));
	}
}


