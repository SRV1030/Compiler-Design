// Write a yacc program to recognise strings “aaab”, “abbb”, “ab” and “a” using the grammar ambn, where m, n >= 0.

%{
    #include "lab6_2.tab.h"    
%}

%%
[aA] {return A;}
[bB] {return B;}
\n {return NL;}
. {return yytext[0];}
%%

int yywrap () {
    return 1;
}