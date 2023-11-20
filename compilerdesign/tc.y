%{

#include<stdio.h>

%}

%token number
%left '+'
%left '-'

%type<ival>expr

%union
{
 int ival;
}

%% 

expr: number {$$=number;}
    | expr '+' expr{
    
    if($1==number && $3==number){
       $$=number;
       printf("\nValid");
       exit(0);
    }
    
    }
    | expr '-' expr{
      if($1==number || $3==number){
        $$=number;
        printf("\nValid");
       exit(0);
       
    }
    
    };
%%
int main(){
yyparse();
return 0;

}
int yyerror(){

return 1;

}
    
    
    

