%{
#include<stdio.h>
#include<string.h>
struct node{
char id[8],type[8];
struct node * next;
};
struct node *h=NULL, *p=NULL, *t=NULL;
char a[5][8];
int c=0;
%}

%%

int|float|double {
     strcpy(a[c],yytext);
     c++;
}

[a-zA-Z][a-zA-Z0-9]* {
       t=(struct node *)malloc(sizeof(struct node));
       strcpy(t->type,a[c-1]);
       strcpy(t->id, yytext);
       if(h==NULL){
        t->next=NULL;
        h=t;
        p=t;
       }
       else{
         t->next=NULL;
         p->next=t;
         p=t;
       }

}

; {
    struct node * temp=NULL;
    temp=h;
    while(temp!=NULL){
      printf("ID-->%s\n",temp->id);
      printf("TYPE-->%s\n",temp->type);
      printf("ADDRESS-->%p\n",temp);
      temp=temp->next;
      printf("\n\n");
    }
    
    
}

%% 
void main(){
 yylex();
}
int yywrap(){
 return 1;
}
