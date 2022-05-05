// // Write a yacc program to recognise strings “aaab”, “abbb”, “ab” and “a” using the grammar ambn, where m, n >= 0.

%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token A B NL

%%
start: string NL {printf ("<VALID STRING>\n"); exit (0);} ;
string: A string B | ;
%%

int yyerror (char *msg) {
    printf ("<INVALID STRING>\n");
    exit (0);
}

int main () {
    printf ("ENTER A STRING: ");
    yyparse ();
}