// Write a yacc program to evaluate an arithmetic expression involving +, ‐, ×, ÷. 

%{
    #include <stdio.h>
    int flag = 0;    
%}

%token NUM ID
%left '-''+'
%right '*''/'

%%
start: exp {
    if (!flag)
        printf ("RESULT = %d\n", $$);
    return 0;
}
exp:exp'+'exp {$$ = $1 + $3;}
|exp'-'exp {$$ = $1 - $3;}
|exp'*'exp {$$ = $1 * $3;}
|exp'/'exp {
    if ($3 == 0)
        yyerror ("DENOMENATOR ZERO: MATH ERROR!");
    else
        $$ = $1 / $3;
}
|'-' NUM {$$ = -$2;}
|'-' ID {$$ = -$2;}
|'('exp')' {$$ = $2;}
|NUM {$$ = $1;}
|ID {$$ = $1;};
%%

int main () {
    printf ("WRITE YOUR EXPRESSION:\n");
    yyparse ();
    if (flag == 0)
        printf ("VALID ARITHMETIC EXPRESSION!");
    return 0;
}

int yyerror (char *str) {
    printf ("\nINVALID ARITHMETIC EXPRESSION\n%s", str);
    flag = 1;
    return 0;
}