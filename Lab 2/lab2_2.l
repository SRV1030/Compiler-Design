// Write a lex program, which takes a C program as input, and display the list of identifiers and operators.

%{
	#include <stdio.h>
	#include <string.h>
	#include <conio.h>
	char store[50][500];
	int ii = 0;
%}

%%
"\n" {++ii;}
"auto"|"double"|"main"|"int"|"struct" {strcat (store[ii], "<KEYWORD> ");}
"break"|"else"|"long"|"switch"|"case"|"printf" {strcat (store[ii], "<KEYWORD> ");}
"enum"|"register"|"typedef"|"char" {strcat (store[ii], "<KEYWORD> ");}
"for"|"signed"|"void"|"do"|"if" {strcat (store[ii], "<KEYWORD> ");}
"extern"|"return"|"union"|"continue" {strcat (store[ii], "<KEYWORD> ");}
"static"|"while"|"default"|"goto" {strcat (store[ii], "<KEYWORD> ");}
"sizeof"|"volatile"|"const"|"float"|"short" {strcat (store[ii], "<KEYWORD> ");}
"#include"[ \<a-z.A-Z\>]* {strcat (store[ii], "<HEADER FILE>\n");}
[{;}] {strcat (store[ii], " <SEPARATOR>\n");}
[,()] {strcat (store[ii], " <SEPARATOR> ");}
[+-/=*%] {strcat (store[ii], "<OPERATOR> ");}
[a-zA-Z][a-zA-Z0-9_]* {strcat (store[ii], "<IDENTIFIER> ");}
[0-9]* {strcat (store[ii], "<VALUE> ");}
. {}			
%%

int yywrap() {
	return 1;
}

int main () {
	printf ("WRITE YOUR C PROGRAM:\n");
	yylex();
	// FOR LINUX USERS: The EOF trigger is Ctrl+D
    // FOR WINDOWS USERS: The EOF trigger is Ctrl+Z+Enter
    // WHY EOF TRIGGER?! To execute lines/statements after yylex() function.
	int jj;
	for (jj=0; jj<ii; ++jj)
		printf ("%s ", store[jj]);
	getch();
	return 0;
}