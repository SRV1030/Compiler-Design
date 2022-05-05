%{
    #include<stdio.h>
%}
%%
[a-zA-Z] {printf("Is Alpha");}
.* {printf("Not Alpha");}
%%
int yywrap(){
    return 1;
}
int main(){
    printf("Enter yout string ");
    yylex();
}