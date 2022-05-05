// Write a YACC program which accepts strings that start or end with 0 or 1.

%{
    #include <stdio.h>
    #include <stdlib.h>    
%}

%token ZERO ONE

%%
start: ACCEPT {printf ("<SEQUENCE ACCEPTED>\n");};
ACCEPT: ZERONE | ZERO ZZ | ONE OO;
ZZ: ZERONE ZZ | ZERO;
OO: ZERONE OO | ONE;
ZERONE: ZERO | ONE; 
%%

int yyerror (char *msg) {
    fprintf (stderr, "%s\n", msg);
    exit (1);
}

int main () {
    printf ("ENTER BINARY SEQUENCE: ");
    yyparse ();
    return 0;
}