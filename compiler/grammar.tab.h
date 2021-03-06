/* A Bison parser, made by GNU Bison 3.7.5.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_GRAMMAR_TAB_H_INCLUDED
# define YY_YY_GRAMMAR_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 1 "compiler/grammar.y"

	#include <string>

#line 53 "grammar.tab.h"

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    NAME = 258,                    /* NAME  */
    COLON = 259,                   /* COLON  */
    RIGHT_ARROW = 260,             /* RIGHT_ARROW  */
    LEFT_CURLY_BRACE = 261,        /* LEFT_CURLY_BRACE  */
    RIGHT_CURLY_BRACE = 262,       /* RIGHT_CURLY_BRACE  */
    SEMICOLON = 263,               /* SEMICOLON  */
    LEFT_PARENTHESIS = 264,        /* LEFT_PARENTHESIS  */
    RIGHT_PARENTHESIS = 265,       /* RIGHT_PARENTHESIS  */
    SINGLECOMMENT = 266,           /* SINGLECOMMENT  */
    MULTILINECOMMENT = 267,        /* MULTILINECOMMENT  */
    PUTS = 268,                    /* PUTS  */
    QUOTES = 269,                  /* QUOTES  */
    CHARACTERS_BLOCK = 270,        /* CHARACTERS_BLOCK  */
    INTEGER = 271,                 /* INTEGER  */
    INTEGER_VALUE = 272,           /* INTEGER_VALUE  */
    GETS = 273,                    /* GETS  */
    STDIN = 274,                   /* STDIN  */
    DOLLAR_SIGN = 275,             /* DOLLAR_SIGN  */
    INC = 276,                     /* INC  */
    DEC = 277,                     /* DEC  */
    BOOLEAN = 278,                 /* BOOLEAN  */
    SET = 279,                     /* SET  */
    TRUE = 280,                    /* TRUE  */
    FALSE = 281,                   /* FALSE  */
    ITOB = 282,                    /* ITOB  */
    IF = 283,                      /* IF  */
    LEFT_BRACKET = 284,            /* LEFT_BRACKET  */
    RIGHT_BRACKET = 285,           /* RIGHT_BRACKET  */
    EQ = 286,                      /* EQ  */
    LE = 287,                      /* LE  */
    LT = 288,                      /* LT  */
    GT = 289,                      /* GT  */
    GE = 290,                      /* GE  */
    NE = 291,                      /* NE  */
    COMMA = 292                    /* COMMA  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef  std::string  YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_GRAMMAR_TAB_H_INCLUDED  */
