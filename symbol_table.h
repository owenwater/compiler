#ifndef _SYMBOL_TABLE_H_
#define _SYMBOL_TABLE_H_

#include "base.h"
#include "define.h"

class Symbol_Table
{
	public:
		Symbol_Table();
		int add_var(string name);
		int set_var(string name, string reg);
		string get_var(string name);
		int father_level;
	private:
		string find_var(string name);
		vector <string> id, address, type;
		string start_address;
		map<string,int> record;

};

#endif
