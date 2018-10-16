plnext: lex.yy.c plnext.tab.c plnext.tab.h
	g++ plnext.tab.c lex.yy.c -lfl -o PL-NEXT-SYNTAX

plnext.tab.c plnext.tab.h: plnext.y
	bison -d plnext.y

lex.yy.c: plnext.l plnext.tab.h
	flex plnext.l
