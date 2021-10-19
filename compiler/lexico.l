%option noyywrap
%{
	#include "grammar.tab.h"
%}

DIGIT [0-9]
ALPHA [a-zA-Z]
CHARACTERS_BLOCK {QUOTES}({ALPHA}*{WHITESPACE}*{DIGIT}*)+{QUOTES}
NAME {ALPHA}([0-9]*{ALPHA}*)+
WHITESPACE [ \r\t\v\f]
LINEFEED \n
SINGLECOMMENT {SLASH}{SLASH}({DOT}*{WHITESPACE}*)+{LINEFEED}
MULTILINECOMMENT {SLASH}{WILDCARD}({DOT}*{WHITESPACE}*{LINEFEED}*)+{WILDCARD}{SLASH}
SLASH [/]
DOT .
WILDCARD [*]
QUOTES [\"]

%%

"puts"			{ return PUTS; }
{NAME}			{ 
			//yylval = new compiler::Name(yytext);
			return NAME; 
			}
{CHARACTERS_BLOCK}      { return CHARACTERS_BLOCK; }
{QUOTES}		{ return QUOTES; }
{SINGLECOMMENT}         { return SINGLECOMMENT; }
{MULTILINECOMMENT}      { return MULTILINECOMMENT; }
":"			{ return COLON; }
";"			{ return SEMICOLON; }
"->"			{ return RIGHT_ARROW; }
"{"			{ return LEFT_CURLY_BRACE; }
"}"			{ return RIGHT_CURLY_BRACE; }
"("			{ return LEFT_PARENTHESIS; }
")"			{ return RIGHT_PARENTHESIS; }
{WHITESPACE}
{LINEFEED}		++yylineno;

%%

#include <stdio.h>


