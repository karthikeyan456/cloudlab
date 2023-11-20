%{
#include "y.tab.h"

%}

%%

[0-9]+? {yylval.sym=(char)yytext[0]; return number;}

[a-zA-Z]+? {yylval.sym=(char)yytext[0]; return letter;}

\n {return 0;}

. {return yytext[0];}

%% 

int yywrap(){
 return 1;
}


