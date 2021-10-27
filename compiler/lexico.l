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

"itob"			{ return ITOB; }
"inc"			{ return INC; }
"dec"			{ return DEC; }
"gets"			{ return GETS; }
"stdin"			{ return STDIN; }
"puts"			{ return PUTS; }	
"set"			{ return SET; }
"Integer"		{ return INTEGER; }
"Boolean"		{ return BOOLEAN; }
"true"			{ return TRUE; }
"false"			{ return FALSE; }
{DIGIT}+                { return INTEGER_VALUE; }
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
"$"			{ return DOLLAR_SIGN; }
{WHITESPACE}
{LINEFEED}		++yylineno;

%%

#include <stdio.h>


