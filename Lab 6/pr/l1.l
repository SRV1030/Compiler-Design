
%{
    #include "l1.tab.h"
    extern int yylval;    
%}
%%

[a] {return A;}
[b] {return B;}
. {return yytext[0];}

%%

int yywrap(){
    return 1;
}

