%{

#include<stdio.h>
int COMMENT=0;
%}
%%

#.* {printf("%s is a preprocessor Directive\n",yytext);}

int|float|double|char|switch {printf("%s is a keyword\n",yytext);}

"/*" {printf("%s is a comment\n",yytext);}

\{ {printf("%s is block begin\n",yytext);}

\} {printf("%s is block end \n",yytext);}

[a-zA-Z][a-zA-Z0-9]* {printf("%s is a valid identifier\n",yytext);}

[0-9]+ {printf("%s is a number\n",yytext);}

= {printf("%s is an assignment operator\n",yytext);}

\<=|\>=|\<|\>|== { printf("%s is a relational operator\n",yytext);}

\+|\-|\*|\/ { printf("%s is a arithmetic operator\n",yytext);}

\;|\!|\&|\, {printf("%s is a punctuation mark\n",yytext);}

\( {}
\) {}

%%
int main(){
 FILE *f;
 f=fopen("smaple.c","r");
 yyin=f;
 yylex();
 return 0;
}
int yywrap(){
 return 1;
}
