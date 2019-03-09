all: lexer parser
	# c++11 standard is set because c++17 doesn't allow to use 'register' keyword
	g++ -std=c++11 calc.tab.c lex.yy.c methods.cpp -lfl -o calc

lexer: 
	flex calc.l

parser:
	bison -d calc.y

clean:
	rm calc.tab.h calc.tab.c lex.yy.c calc