// Write a YACC program which accepts strings that start or end with 0 or 1.

%{
    #include "lab7_2.tab.h"
    extern int yylval;
%}

%%
0 {yylval = 0; return ZERO;}
1 {yylval = 1; return ONE;}
.|\n {yylval = 2; return 0;}
%%

int yywrap () {
    return 1;
}