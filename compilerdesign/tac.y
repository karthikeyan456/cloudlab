%{

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

char temp='1';
int ind=0;
char AddToTable(char opd1,char opd2, char opr);
void ThreeAddressCode();
struct incod{
   char opd1;
   char opd2;
   char opr;
   

};
int f=1;


%}

%union
{
char sym;
}
%token <sym> letter number;
%type <sym> expr;
%left '+' '-'
%left '*' '/'

%%

stmt: letter '=' expr {AddToTable((char)$1,(char)$3, '=');}
    | expr ';'
    ;
expr: expr '+' expr {$$=AddToTable((char)$1,(char)$3, '+');}
    | expr '-' expr {$$=AddToTable((char)$1,(char)$3, '-');}
    |expr '*' expr {$$=AddToTable((char)$1,(char)$3, '*');}
    | expr '/' expr {$$=AddToTable((char)$1,(char)$3, '/');}
    | number {$$=$1;}
    |letter {$$=$1;}
    ;
%%
struct incod code[20];
int yyerror(){
   //puts("Invalid");
   f=0;
   
}
char AddToTable(char opd1,char opd2, char opr){
     code[ind].opd1=opd1;
     code[ind].opd2=opd2;
     code[ind].opr=opr;
     ind ++;
     return temp++;
     
}
void ThreeAddressCode(){
  int cnt=0;
  char temp='1';
  while(cnt<ind){
       if(code[cnt].opr!='='){
          printf("t%c=\t",temp++);
       }
       if(isalpha(code[cnt].opd1)){
         printf("%c\t",code[cnt].opd1);
         
       }
       
       else if(code[cnt].opd1>='1' && code[cnt].opd1<='9'){
         printf("t%c\t",code[cnt].opd1);
         
       
       }
       printf("%c\t",code[cnt].opr);
       if(isalpha(code[cnt].opd2)){
         printf("%c\t",code[cnt].opd2);
         
       }
       
       else if(code[cnt].opd2>='1' && code[cnt].opd2<='9'){
         printf("t%c\t\n",code[cnt].opd2);
         
       
       }
       cnt++;
       
       
  }
}
int main(){
    yyparse();
    ThreeAddressCode();
    
    
}
