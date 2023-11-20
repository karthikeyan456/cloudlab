%{

#include<stdio.h>
int yylex();
int f=1;
int yyerror();

%}



%token identifier plus minus star slash numbers

%%

E: E plus T
 | E minus T
 | T
 ;
T: T star F
 | T slash F
 | F
 ;
F: identifier
 | numbers
 ;

%% 

int yyerror(){
   f=0;
   puts("Invalid");
   return 0;
}
int main(){
  yyparse();
  if(f){
     printf("Valid");
  }
}

