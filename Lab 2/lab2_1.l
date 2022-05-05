// Write a lex program to identify keywords, symbols and operators.

%{
	#include <stdio.h>
%}

%%
if|else|for|while|do|switch|int|char|float { printf ("<KEYWORD>");}
[a-zA-Z]([a-zA-Z]|[0-9])* { /*<IDENTIFIER>*/}
[0-9]* { /*<NUMBER>*/}
"+"|"-"|"*"|"/"|"%" { printf ("<OPERATOR>");}
. { printf ("<SYMBOL>");}
%%

yywrap(){
	return 1;
}

main(){
	printf ("ENTER A CHARACTER OR STRING OF CHARACTERS:\n");
	yylex();
}