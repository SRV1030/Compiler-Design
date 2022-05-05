%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%token A B

%%
start: A S {
    printf("valid");
    return 0;
}
S : A | B;

%%

int yyerror(){
    printf("Invalid");
}

int main(){
    printf("Enter i/p \n");
    yyparse();
    return 0;
}