%{

#include "y.tab.h"

%}

%%

[a-zA-Z][a-zA-Z0-9]* {return identifier;}

\+ {return plus;}

\- {return minus;}

\* {return star;}

\/ {return slash;}

[0-9]+ {return numbers;}

\n {return 0;}

%%

int yywrap(){
  return 1;
}
