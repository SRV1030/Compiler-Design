
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "l1.tab.h"
    extern int yylval;
%}

%%
[a-zA-Z]([A-Za-z]|[0-9])* {yylval = yytext [0]; return ID;}
[0-9]+ {yylval = yytext [0]; return ID;}
[ \t] {}
[\n] {return 0;}
. {return yytext [0];}
%%

int yywrap () {
    return 1;
}