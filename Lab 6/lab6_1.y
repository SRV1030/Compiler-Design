// // Write a yacc program to recognise a valid variable, which starts with a letter followed by any number of digit and letter.

%{
    #include <stdio.h>    
    #include <stdlib.h>
%}

%token DIGIT LETTER NL UND

%%
start: variable NL {printf ("\n<VALID IDENTIFIER>\n"); exit (0);} ;
variable: LETTER alnum ;
alnum: LETTER alnum
| DIGIT alnum 
| UND alnum
| LETTER
| DIGIT
| UND
;
%%

int yyerror (char *msg) {
    printf ("\n<INVALID IDENTIFIER>\n");
    exit (0);
}

int main () {
    printf ("ENTER VARIABLE NAME: ");
    yyparse ();
}