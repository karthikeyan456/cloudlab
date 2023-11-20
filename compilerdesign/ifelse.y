%{

#include <stdio.h>

int f=1;

%}

%token IF relop number id s lp rp lb rb

%%

stmt: ifstmt;
ifstmt: IF c b;
c: lp cond rp;
b: lb rb;
cond : x relop x;
x: id
   |number
   ;

%%

int yyerror(){

printf("Invalid\n");
f=0;
return 1;
}
int main(){
     yyparse();
     if(f){
     puts("Valid \n");
     }
     return 1;
}
