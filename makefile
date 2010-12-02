LEX = flex
YYAC = bison
CC = g++
OPTION = 

cpptargets = lex.o parser.o
cctargets = stack.o memory.o print.o output.o
target = a

all: $(target)

$(target): $(cpptargets) $(cctargets)
	$(CC) -o a $(cpptargets) $(cctargets)

$(cpptargets): lex.cpp parser.hpp parser.cpp

$(cctargets): memory.h stack.h

lex.cpp: decaflex.l
	$(LEX) -o lex.cpp decaflex.l

parser.hpp: decaflex.y
	$(YYAC) -oparser.cpp decaflex.y -d -t 

test:
	./$(target) < test1 > a.s 2> b.s

run:
	./run.sh

clean:
	rm *.cpp *.hpp *.gch *.o a 

