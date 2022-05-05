%{
    #include<stdio.h>
    #include<stdlib.h>
    int flag = 0;
%}

%token NUM ID
%left '+''-'
%right '*''/'

%%

start: exp{
    if(!flag) printf("Result: %d\n",$$);
    return 0;
} 
exp:exp'+'exp {$$=$1+$3;}
|exp'-'exp {$$=$1-$3;}
|exp'*'exp {$$=$1*$3;}
|exp'/'exp {
        if($3==0)yyerror();
        else $$=$1/$3;
}
|'-' NUM {$$ = -$2;}
|'-' ID {$$ = -$2;}
|'('exp')' {$$ = $2;}
|NUM {$$ = $1;}
|ID {$$ = $1;};

%%

int main(){
    printf("Enter exp: \n");
    yyparse();
    if(flag==0) printf("valid");
    return 0;
}
int yyerror () {
    printf ("\nINVALID ARITHMETIC EXPRESSION\n");
    flag = 1;
    return 0;
}
