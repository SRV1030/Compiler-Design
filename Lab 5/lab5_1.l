// Write a yacc program to evaluate an arithmetic expression involving +, ‐, ×, ÷.

%{
    #include "lab5_1.tab.h"
    extern int yylval;
%}

%%
[0-9]+ {
    yylval = atoi (yytext);
    return NUM;    
}
[a-zA-Z]+ {return ID;}
[+] {return '+';}
[-] {return '-';}
[*] {return '*';}
[/] { return '/';}
[ \t]+ {;}
\n {return 0;}
. {return yytext[0];}
%%

int yywrap(){
	return 1;
}