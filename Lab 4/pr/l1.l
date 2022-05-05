%{
    #include<stdio.h>
    #include<stdlib.h>
    int cc=0;
    FILE *out;
%}

%s comment

%%
"/*" {BEGIN comment;}
<comment>"*/" {BEGIN 0;cc++;}
<comment>\n {}
<comment>>. {}
"//".* {cc++;}
.|\n {fprintf(out,"%s",yytext);}
%%

int yywrap(){
    return 1;
}

int main(){
    yyin=fopen("C_TestFileIn.c","r");
    out=fopen("C_TestFileOut.c","w");
    yylex();
    printf("No. of comm %d \n",cc);
    fclose(out);
    return 0;
}
