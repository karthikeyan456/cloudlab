%{

#include "y.tab.h"

%}

%%

if {return IF;}

\<|\> {return relop;}
[0-9]+ {return number;}
[A-Za-z][A-Za-z0-9]* {return id;}

[A-Za-z0-9]* {return s;}
\( {return lp;}
\) {return rp;}
\{ {return lb;}
\} {return rb;}

[\n] {return 0;}




%%

int yywrap(){

return 1;

}
