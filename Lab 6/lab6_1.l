// Write a yacc program to recognise a valid variable, which starts with a letter followed by any number of digit and letter.

%{
    #include "lab6_1.tab.h"
    extern int yylval;    
%}

%%
[a-zA-Z] {return LETTER;}
[0-9] {return DIGIT;}
\n {return NL;}
_ {return UND;}
. {return yytext[0];}
%%

int yywrap () {
    return 1;
}