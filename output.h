#ifndef _OUTPUT_H_
#define _OUTPUT_H_

#include "base.h"
#include "define.h"

class Output
{
	public:
		Output();
		int add(string s, char split = '\n');
		string get_cmd();
	private:
		string cmd;
};

#endif
