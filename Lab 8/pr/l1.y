
%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token ID
%left '+' '-'
%left '*' '/'
%right NEGATIVE

%%
Start:  Expression {printf ("\n");}
;
Expression:  Expression '+' Expression {printf ("+");}
| Expression '*' Expression {printf ("*");}
| Expression '-' Expression {printf ("-");}
| Expression '/' Expression {printf ("/");}
| '(' Expression ')'
| '-' Expression %prec NEGATIVE {printf ("-");}
| ID {printf ("%c", yylval);}
;
%%

int yyerror (char *msg) {
    fprintf (stderr, "%s\n", msg);
    exit (1);
}

int main () {
    printf ("ENTER INFIX EXPRESSION: ");
    yyparse ();
    return 0;
}