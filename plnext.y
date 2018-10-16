%{
	#include <cstdio>
	#include <iostream>
	using namespace std;

	extern int yylex();
	extern int yyparse();
	extern FILE *yyin;
	extern int line_num;

	void yyerror(const char *s);
	int enumCount = 0;
	int tempInt;
	char tempChar[255];

%}

%union
{
	int ival;
	float fval;
	char *sval;
}

%token PROGRAM TERMINATE DECL DOUBLECOLON CONST VAR DECLARATION END PROC FUNC TYPE COLONEQUALS
%token ARROW IS ARR OF TO IMPL SET EXECUTE IF THEN FI WHILE DO ELIHW OD FOR ROF START STOP

%token <ival> NUM
%token <sval> IDENT

%%

program:
	PROGRAM declaration_unit implementation_unit TERMINATE
	;
declaration_unit:
	DECL DOUBLECOLON IDENT const_unit var_unit type_unit proc_unit func_unit DECLARATION END { cout << "Program " << $3 << " declaration unit detected\n"; }
	;
const_unit:
	| CONST constant_declaration
	;
var_unit:
	| VAR variable_declaration
	;
type_unit:
	| type_declaration
	;
proc_unit:
	| procedure_interface
func_unit:
	| function_interface
procedure_interface:
	PROC IDENT formal_parameters
	| PROC IDENT
function_interface:
	FUNC IDENT formal_parameters
	| FUNC IDENT
type_declaration:
	TYPE IDENT ARROW type ';' { cout << "Type " << $2 << " declared\n"; }
	;
formal_parameters:
	'(' paramlist ')'
	;
paramlist:
	IDENT
	| paramlist ';' IDENT
constant_declaration:
	multi_const ';'
multi_const:
	IDENT IS NUM { cout << "Constant " << $1 << " set to " << $3 << endl; }
	| multi_const ',' IDENT IS NUM { cout << "Constant " << $3 << " set to " << $5 << endl; }
	;
variable_declaration:
	multi_var ';'
	;
multi_var:
	IDENT ':' IDENT { cout << "Variable " << $1 << " set to " << $3 << endl; }
	| multi_var ',' IDENT ':' IDENT { cout << "Variable " << $3 << " set to " << $5 << endl; }
type:
	basic_type
	| array_type
	;
basic_type:
	IDENT
	| enumerated_type
	| range_type
	;
enumerated_type:
	'{' multident '}' {
		enumCount = 0;
		cout << "Enumerated type detected\n"; }
	;
multident:
	IDENT {	
		enumCount++;
		cout << "Enum entry " << enumCount << ": " << $1 << endl; }
	| multident ',' IDENT {	
		enumCount++;
		cout << "Enum entry " << enumCount << ": " << $3 << endl; }
	;
range_type:
	'[' range ']'
	;
array_type:
	ARR IDENT '[' range ']' OF type
	;
// This is a comment
range:
	NUM TO NUM { cout << "Range from " << $1 << " to " << $3 << " detected\n"; }
	;
implementation_unit:
	IMPL DOUBLECOLON IDENT block '.' { cout << "Implementation unit " << $3 << " detected\n"; }
	;
block:
	specification_part implementation_part
	;
specification_part:
	CONST constant_declaration
	| VAR variable_declaration
	| procedure_declaration
	| function_declaration
	|
	;
procedure_declaration:
	PROC IDENT ';' block ';' { cout << "Procedure " << $2 << " declared\n"; }
	;
function_declaration:
	FUNC IDENT ';' block ';' { cout << "Function " << $2 << " declared\n"; }
	;
implementation_part:
	statement
	;
statement:
	assignment
	| procedure_call
	| if_statement
	| while_statement
	| do_statement
	| for_statement
	| compound_statement
	;
multi_statement:
	statement
	| multi_statement ';' statement
	;
assignment:
	IDENT SET expression { cout << $1 << " assigned\n"; }
	;
procedure_call:
	EXECUTE IDENT { cout << $2 << " executed\n"; }
	;
if_statement:
	IF expression THEN statement FI { cout << "If statement detected\n"; }
	;
while_statement:
	WHILE expression multi_statement ELIHW { cout << "While loop detected\n"; }
	;
do_statement:
	DO multi_statement WHILE expression OD { cout << "Do-while loop detected\n"; }
	;
for_statement:
	FOR IDENT COLONEQUALS expression DO multi_statement ROF { cout << "For loop detected\n"; }
	;
compound_statement:
	START multi_statement STOP { cout << "Compound statement detected\n"; }
	;
expression:
	term
	| expression '+' term { cout << "Addition detected\n"; }
	| expression '-' term { cout << "Subtraction detected\n"; }
	;
term:
	id_num
	| term '*' id_num { cout << "Multiplication detected\n"; }
	| term '/' id_num { cout << "Division detected\n"; }
	;
id_num:
	NUM
	| IDENT
	;

%%

int main(int argc, char* argv[])
{
	if (argc != 2)
	{
		cout << "Invalid number of input arguments." << endl;
		cout << "Correct usage: ./PL-NEXT-SYNTAX <filename>" << endl;
	}
	
	FILE *myfile = fopen(argv[1], "r");

	if (!myfile)
	{
		cout << "Cannot open " << argv[1] << endl;
		return -1;
	}

	yyin = myfile;
	yyparse();
}

void yyerror(const char *s)
{
	cout << "Parsing error on line " << line_num << ": " << s << endl;
	exit(-1);
}
