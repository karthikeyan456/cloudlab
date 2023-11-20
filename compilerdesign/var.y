%{

#include<stdio.h>
int f=1;
%}

%token letter digit

%%

S: letter X;
X: letter X
 | digit X
 | letter
 | digit
 ;

%%

int yyerror(){
  f=0;
  puts("Invalid");
  return 0;
}
int main(){
   yyparse();
   if (f){
      printf("Valid");
   }
}

 
