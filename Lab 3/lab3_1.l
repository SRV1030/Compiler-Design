// Write a lex program to count the number of vowels and consonants in a given Sentence.

%{
	#include <stdio.h>
	#include <conio.h>
	int vCount = 0, cCount = 0;
%}

%%
[^a-zA-Z] {}
[aeiouAEIOU] {++vCount;}
[a-zA-Z] {++cCount;}
%%

int yywrap(){
	return 1;
}

main(){
	printf ("Write a Sentence:\n");
	yylex();
	printf ("Number of Vowels = %d\n", vCount);
	printf ("Number of Consonants = %d", cCount);
	getch();
}