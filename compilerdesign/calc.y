%{

#include <stdio.h>
int flag=1;
%}

%token number

%left '+' '-'

%left '*' '/'

%%

A: E {
   printf("Result %d\n",$$);
   return 0;
};
E: E'+'E {$$=$1+$3;}
 | E'-'E {$$=$1-$3;}
 | E'*'E {$$=$1*$3;}
 | E'/'E {$$=$1/$3;}
 |number {$$=$1;}
 ;
 
 %%
 
 int yyerror(){
    flag=0;
    puts("Invalid");
    return 1;
 }
 int main(){
   yyparse();
   if(flag){
    printf("Valid");
   }
   
 }


