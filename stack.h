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
		int add_slot(string name);
		string new_value(int value, Stack &s);
		int add_var(string name, int len = 1);
		int set_var(string name, string reg, Stack &s, string move = "");
		string get_var(string name, Stack &s, string move = "");
		int save_and_load(int flag, Stack &s);
		int clear();
		
		int cnt;
		const static int step = 4;
		map<string, int> vars;
		bool call_fun;

		vector<string> release_list;

		set<string> regi;
	private:
		
		int num;
		set<string>::iterator set_it;
		map<string, int>::iterator map_it;
		

};

class Stack
{
	public:
		const static int max_size = 30000;
		
		Stack();
		int in(bool call_fun);
		string out(int load);
		/*2: load and clear. 1:load and not clear, 0: not load*/
		Memory stack[max_size];
		Output output_stack[max_size];		
		int loop_stack[max_size];
		int loop_pos[max_size];
		
		int add_cmd(string s, char split='\n');
		string find_var(string name, string & pointer);

		int output_in();
		string output_out();

		int loop_in(int tag_num);
		int loop_out();
		int current_loop(int &pos);

		int sp;
		int output_sp;
		int loop_sp;
		
		bool main_function;
	private:
};



#endif
