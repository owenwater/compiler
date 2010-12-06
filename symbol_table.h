#ifndef _SYMBOL_TABLE_H_
#define _SYMBOL_TABLE_H_

#include "base.h"
#include "define.h"

class Symbol_Table;

class Tree_Node
{
	public:
		Tree_Node();
		int add_var(string name, string type, int len = 1);
		int set_var(string pos, string, reg, string move = "");
		string get_var(string pos, string reg, string move = "");
		void clear();
		void new_node(int fater);

		int get_num();
		int get_father();

		map<string,int> id
		vector <string>address, type;

	private:
		int father;
		int num;
		string start_address;
		map<string,int>::iterator it;

};

class Symbol_Table
{
	public 
		int add_var(string name, string type, int len);
		string get_var(string name, string type, string move = "");
		int set_var(string name, string type, string reg, string move = "");

		string find_var(string name, string &type, bool check );

		void in();
		void out();

		int pos;
		
	private:
		vector <Tree_Node> tree;
}

#endif
