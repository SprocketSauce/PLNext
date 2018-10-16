/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PLNEXT_TAB_H_INCLUDED
# define YY_YY_PLNEXT_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    PROGRAM = 258,
    TERMINATE = 259,
    DECL = 260,
    DOUBLECOLON = 261,
    CONST = 262,
    VAR = 263,
    DECLARATION = 264,
    END = 265,
    PROC = 266,
    FUNC = 267,
    TYPE = 268,
    COLONEQUALS = 269,
    ARROW = 270,
    IS = 271,
    ARR = 272,
    OF = 273,
    TO = 274,
    IMPL = 275,
    SET = 276,
    EXECUTE = 277,
    IF = 278,
    THEN = 279,
    FI = 280,
    WHILE = 281,
    DO = 282,
    ELIHW = 283,
    OD = 284,
    FOR = 285,
    ROF = 286,
    START = 287,
    STOP = 288,
    NUM = 289,
    IDENT = 290
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 19 "plnext.y" /* yacc.c:1909  */

	int ival;
	float fval;
	char *sval;

#line 96 "plnext.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PLNEXT_TAB_H_INCLUDED  */
