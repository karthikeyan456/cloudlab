%{

#include "y.tab.h"

%}
%%
[a-z] {return letter;}
[0-9] {return digit;}

\n {return 0;}

%% 

int yywrap(){
return 1;
}
