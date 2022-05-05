// Write a yacc program to recognise nested “IF” control statements, and display the number of levels of listing.

%{
    #include <stdio.h>
    #include <stdlib.h>
    int count = 0;
%}

%token IF RELOP SS NUMBER ID

%%
start: ifStatement {
    printf ("NUMBER OF NESTED \"IF\" STATEMENTS = %d\n", count);
    return 0;
}
ifStatement: IF'('cond')''{'ifStatement'}' {++count;}
|SS {;}
cond: x RELOP x {;}
x: ID|NUMBER {;};
%%

int main () {
    printf ("ENTER THE STATEMENT:\n");
    yyparse ();
    return 0;
}

int yyerror (char *str) {
    printf ("INVALID EXPRESSION!");
    exit (0);
}