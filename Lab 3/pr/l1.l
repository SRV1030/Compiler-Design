%{
    #include<stdio.h>
    int vo=0,cns=0;
%}
%%
[aeiouAEIOU] {++vo;}
[a-zA-Z] {++cns;}
%%
int yywrap(){
    return 1;
}
int main(){
    printf("Enter you string\n");
    yylex();
    printf("Vowel Count %d : \n",vo);
    printf("Consonant Count %d : \n",cns);
    return 0;
}