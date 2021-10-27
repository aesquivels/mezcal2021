%code requires {
	#include <string>
}
%{
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	#include <iostream>
	#include <memory>
	#include <string>
	using namespace std;
	extern char *yytext;
	std::string result;
	int yylex(void);	
	void yyerror(char const *);
%}

%define api.value.type { std::string }

%token  NAME COLON RIGHT_ARROW LEFT_CURLY_BRACE RIGHT_CURLY_BRACE SEMICOLON LEFT_PARENTHESIS RIGHT_PARENTHESIS SINGLECOMMENT 
	MULTILINECOMMENT PUTS QUOTES CHARACTERS_BLOCK INTEGER INTEGER_VALUE GETS STDIN DOLLAR_SIGN INC DEC BOOLEAN SET TRUE FALSE ITOB

%start input

%%

input:
	function function_list	{ result = std::string("#include <cstdio>\n #include <iostream>\n using namespace std;\n") + $1 + $2; }
	;

function_list:
	function function_list                  { $$ = $1 + $2; }
	|
	%empty					{ $$ = ""; }
	;

function:
	name COLON RIGHT_ARROW LEFT_CURLY_BRACE statements RIGHT_CURLY_BRACE    
	{ 
		if($1 == "enter"){
			$$ = "int main(int argc, char *argv[]){\n" + $5 + "\n}\n";
		}else{
			$$ = std::string("\n void ") + "_" + $1 + "()" + "{\n" + $5 + "\n}\n";
		} 
	}
	|
	%empty					{ $$ = ""; }
	;

statements:
	statements statement { 
				$$ = $1 + $2;
				}
	|
	%empty					{ $$ = ""; }
	;

statement:
	assignment SEMICOLON { $$ = $1; }
	|
	unitaryOperations SEMICOLON { $$ = $1; }
	|
	std_input SEMICOLON { $$ = $1; }
	|
	definition SEMICOLON { $$ = $1; }
	|
	std_output SEMICOLON { $$ = $1; }
	|
	MULTILINECOMMENT	{ $$ = ""; }
	|
	SINGLECOMMENT	{ $$ = ""; }
	|
	expression SEMICOLON { $$ = $1; }
	;

assignment:
	SET name FALSE  { $$ = $2 + "=false; \n"; }
	|
	SET name TRUE	{ $$ = $2 + "=true; \n"; }
	|
	SET name integer_value { $$ = $2 + "=" + $3 + ";\n";}
	;

integer_value:
	INTEGER_VALUE { $$ = std::string(yytext); }
	;

unitaryOperations:
	INC identifiers	{ $$ = $2 + "++;\n";}
	|
	DEC identifiers { $$ = $2 + "--;\n";}
	;

std_input:
	GETS STDIN name { $$ = "\t cin >> " + $3 + ";\n"; }
	;

definition:
	BOOLEAN identifiers { $$ = "bool " + $2 + ";\n"; }
	|
	INTEGER identifiers	{ $$ = "\t int " + $2 + ";\n"; }
	;

identifiers:
	identifiers ids	{ $$ = $1 + $2; }
	|
	%empty	{ $$ = ""; }
	;

ids:
	name	{ $$ = $1; }
	;

std_output:
	PUTS ITOB DOLLAR_SIGN name	{ 
					$$ = "cout << ((" + $4 + "==1) ? \"true\" : \"false\") << endl;"; 
					}
	|
	PUTS characters_block	{ $$ = "\t cout << " + $2 + " << endl;\n"; }
	|
	PUTS DOLLAR_SIGN name	{ $$ = "cout << " + $3 + " << endl;"; }
	;

expression:
	name LEFT_PARENTHESIS RIGHT_PARENTHESIS	{ $$ = std::string("\t _") + $1 + "();\n"; }
	;

characters_block: 
	CHARACTERS_BLOCK { $$ = std::string(yytext); }
	;

name:
	NAME    {  
		$$ = std::string(yytext);
		}
	;

%%

void yyerror (char const *x){
	printf ("Error %s \n", x);
	exit(1);
}
