// Write a yacc program to recognise nested “IF” control statements, and display the number of levels of listing.

%{
    #include "lab5_2.tab.h"
%}

%%
"if" {return IF;}
[sS][0-9]* {return SS;}
"<"|">"|"=="|"!="|"<="|">=" {return RELOP;}
[0-9]+ {return NUMBER;}
[a-zA-Z][a-zA-Z0-9_]* {return ID;}
[ \t]+ {;}
\n {return 0;}
. {return yytext[0];}
%%

int yywrap() {
    return 1;
}