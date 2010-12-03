#ifndef _STACK_H_
#define _STACK_H_

#include "base.h"
#include "define.h"
#include "output.h"

class Stack;

class Memory
{
	public:
		Memory();
		void remove_slot(string name);
		string find_slot();
		string new_value(int value, Stack &s);
		int add_var(string name);
		int set_var(string name, string reg, Stack &s);
		string get_var(string name, Stack &s);
		int save_and_load(int flag, Stack &s);
		int clear();
		
		int cnt;
		const static int step = 4;
		map<string, int> vars;

	private:

		set<string> regi;
		set<string>::iterator set_it;
		map<string, int>::iterator map_it;
		

};

class Stack
{
	public:
		const static int max_size = 10000;
		
		Stack();
		int in();
		string out();
		Memory stack[max_size];
		Output output_stack[max_size];		
		int add_cmd(string s, char split='\n');
		string find_var(string name);

		int sp;
	private:
		
};



#endif
