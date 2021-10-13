%option noyywrap
%{
	#include "grammar.tab.h"
	#include "SyntaxTree/Includes.hpp"
%}

DIGIT [0-9]
ALPHA [a-zA-Z]
NAME {ALPHA}({DIGIT}*{ALPHA}*)+
WHITESPACE [ \r\t\v\f]
LINEFEED \n
SINGLECOMMENT {SLASH}{SLASH}{}
SLASH [/]

%%

{NAME}		{ 
			//yylval = new compiler::Name(yytext);
			return NAME; 
		}
":"		{ return COLON; }
";"		{ return SEMICOLON; }
"->"		{ return RIGHT_ARROW; }
"{"		{ return LEFT_CURLY_BRACE; }
"}"		{ return RIGHT_CURLY_BRACE; }
"("		{ return LEFT_PARENTHESIS; }
")"		{ return RIGHT_PARENTHESIS; }
{WHITESPACE}
{LINEFEED}	++yylineno;

%%

#include <stdio.h>


