%{
    #include<stdio.h>
%}
%%
if|else|for|float|int|while|do|goto|char {printf("keywords");}
[a-zA-Z]|([a-zA-Z]|[0-9])* {printf("Identifier");}
[0-9]* {printf("Number");}
"+"|"-"|"*"|"/" {printf("operator");}
. {printf("symbol");}
%%
int yywrap(){
    return 1;
}
int main(){
    printf("Enter string\n");
    yylex();
}