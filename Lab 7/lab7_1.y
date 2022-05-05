// Write a YACC program to check whether a given string is Palindrome or not.

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    extern int yylex ();
    void yyerror (char *msg);
    int flag, ii, kk = 0;
%}

%union {
    char* ff;
}

%token <ff> STR
%type <ff> EE

%%
start: EE {
    flag = 0;
    kk = strlen ($1) - 1;
    if (kk % 2 == 0) {
        for (ii = 0; ii <= kk / 2; ++ii) {
            if (!($1 [ii] == $1 [kk - ii])) {
                flag = 1;
            }
        }
        if (flag == 1)
            printf ("NOT PALINDROME\n");
        else
            printf ("PALINDROME\n");
    }
    else {
        for (ii = 0; ii < kk / 2; ++ii) {
            if (!($1 [ii] == $1 [kk - ii])) {
                flag = 1;
            }
        }
        if (flag == 1)
            printf ("NOT PALINDROME\n");
        else
            printf ("PALINDROME\n");
    }
}
;
EE: STR {$$ = $1;}
;
%%

void yyerror (char *msg) {
    fprintf (stderr, "%s\n", msg);
    exit (1);
}

int main () {
    printf ("ENTER STRING: ");
    yyparse ();
    return 0;
}