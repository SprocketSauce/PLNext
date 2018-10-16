%{
	#include "plnext.tab.h" // get token types from Bison
	#include <iostream>
	using namespace std;
	int line_num = 1;
%}

%option noyywrap

%%

[ \t] 		;
PROGRAM		{ return PROGRAM; }
TERMINATE	{ return TERMINATE; }
DECL		{ return DECL; }
::			{ return DOUBLECOLON; }
CONST		{ return CONST; }
VAR			{ return VAR; }
DECLARATION	{ return DECLARATION; }
END			{ return END; }
PROC		{ return PROC; }
FUNC		{ return FUNC; }
TYPE		{ return TYPE; }
=>			{ return ARROW; }
:=			{ return COLONEQUALS; }
IS			{ return IS; }
ARR			{ return ARR; }
OF			{ return OF; }
TO			{ return TO; }
IMPL		{ return IMPL; }
SET			{ return SET; }
EXECUTE		{ return EXECUTE; }
IF			{ return IF; }
THEN		{ return THEN; }
FI			{ return FI; }
WHILE		{ return WHILE; }
DO			{ return DO; }
ELIHW		{ return ELIHW; }
OD			{ return OD; }
FOR			{ return FOR; }
ROF			{ return ROF; }
START		{ return START; }
STOP		{ return STOP; }
\n			{ ++line_num; }
[a-z]+		{ yylval.sval = strdup(yytext); return IDENT; }
[0-9]+ 		{ yylval.ival = atoi(yytext); return NUM; }
.			{ return yytext[0];}

%%

//[;\(\)\+\-\*\\=,:\{\}\[\]\./]	{ return yytext[0]; }
