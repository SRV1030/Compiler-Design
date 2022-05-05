// Write a lex program to count the number of lines, words, special characters and letters in a program.

%{
	#include <stdio.h>
	#include <conio.h>
	int lines = 0, words = 0, specialchars = 0, letters = 0;
%}

%%
"\n" {++lines; ++words;}
" "|"\t" {++words;}
[a-zA-Z] {++letters;}
[0-9] {/*numbers*/}
. {++specialchars;}
%%

int yywrap(){
	return 1;
}

main(){
	printf ("ENTER A PASSAGE:\n");
	yylex();
	printf ("NUMBER OF LINES: %d\n", lines);
	printf ("NUMBER OF WORDS: %d\n", words);
	printf ("NUMBER OF SPECIAL CHARACTERS: %d\n", specialchars);
	printf ("NUMBER OF LETTERS: %d\n", letters);
	getch();
}