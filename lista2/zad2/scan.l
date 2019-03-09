%{
#include <stdio.h>

int yylex();
int yywrap();
%}  

%x COMMENT
%x TAG

%%
\<                  {ECHO; BEGIN(TAG);}
<TAG>{
  \"([::blank::].*\"		ECHO; 		
    .               ECHO;
    \n              ECHO;
    .>             {ECHO; BEGIN(INITIAL);}
}

\<!--               BEGIN(COMMENT);
<COMMENT>{
    .|\n            ;
    --\>            BEGIN(INITIAL);
}

%%

int yywrap() {
    return 1;
}

int main() {
    return yylex();
}
