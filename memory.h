
#ifndef _MEMORY_H_
#define _MEMORY_H_

#include "base.h"
#include "define.h"

class Memory
{
	public:
		Memory();
		void remove_slot(string name);
		string find_slot();
		string new_value(int value);
		int add_var(string name);
		int set_var(string name, string reg);
		string get_var(string name);
		int save_and_load(int flag);
		int cnt;

	private:

		set<string> regi;
		map<string, int> vars;
		set<string>::iterator set_it;
		map<string, int>::iterator map_it;
		const static int step = 4;
		

};

class Stack
{
	public:
		const static int max_size = 10000;
		Stack();
		int in();
		int out();
		int sp;
		Memory stack[max_size];
	private:
		
};

#endif
