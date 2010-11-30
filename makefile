LEX = flex
YYAC = bison
CC = g++

a:	lex.o parser.o memory.o print.o
	$(CC) -o a lex.o parser.o memory.o print.o

lex.o: lex.cpp parser.hpp
	$(CC) -c lex.cpp

parser.o: parser.cpp memory.h print.h
	$(CC) -c parser.cpp  

memory.o: memory.cc
	$(CC) -c memory.cc

print.o: print.cc
	$(CC) -c print.cc

lex.cpp: decaflex.l
	$(LEX) -o lex.cpp decaflex.l

parser.hpp: decaflex.y
	$(YYAC) -oparser.cpp decaflex.y -d -t 


clean:
	rm *.hpp *.gch *.o a 

