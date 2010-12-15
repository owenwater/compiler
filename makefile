LEX = flex
YYAC = bison
CC = g++
OPTION = 

cpptargets = lex.o parser.o
cctargets = stack.o memory.o print.o output.o
target = a

all: $(target)

$(target): $(cpptargets) $(cctargets)
	$(CC) -o a $(cpptargets) $(cctargets) -g

$(cpptargets): lex.cpp parser.hpp parser.cpp

$(cctargets):

lex.cpp: decaflex.l
	$(LEX) -o lex.cpp decaflex.l

parser.hpp: decaflex.y
	$(YYAC) -oparser.cpp decaflex.y -d -t 

run:
	./run.sh > check
	diff check test_result

clean:
	rm *.cpp *.hpp *.gch *.o a 

