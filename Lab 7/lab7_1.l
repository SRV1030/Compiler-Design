// Write a YACC program to check whether a given string is Palindrome or not.

%{
    #include "lab7_1.tab.h"
%}

%%
[a-zA-Z]+ {yylval.ff = yytext; return STR;}
[-+()*/] {return yytext [0];}
[ \t\n_] {;}
%%

int yywrap () {
    return 1;
}