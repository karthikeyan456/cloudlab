%{

#include "y.tab.h"

%}

%%

[0-9]+ {yylval.ival=atoi(yytext); return number;}
[-+*/] {return yytext[0];}
[\t\n] {return 0;}
. {return yytext[0];}

%%

int yywrap(){
 return 1;
 
}
