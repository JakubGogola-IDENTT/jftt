%{
#include <iostream>
#include <cstdlib>
#include "calc.tab.h"

#define YY_DECL extern int yylex()
%}

%x COMMENT

%%
^#                              BEGIN(COMMENT);
\\\n                            ;
[ \t]+                          ;
<COMMENT>{
    .|\\\n                      ;
    \n                          BEGIN(INITIAL);
}
\n                              return NEWLINE;
[0-9]+                          { yylval = atoi(yytext); return NUM; }
\+                              return PLUS;
\-                              return MINUS;
\*                              return MULT;
\/                              return DIV;
\%                              return MOD;
\^                              return PWR;
\(                              return LBRACKET;
\)                              return RBRACKET;
.                               ;
%%