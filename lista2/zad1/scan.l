%{
#include <stdio.h>

int yylex();
int yywrap();
int lines = 0;
int words = 0;
%}

%%
^[ \t]*\n*  ;
[ \t]+$     ;
[ \t]+ {printf(" "); words++;}
\n  {printf("\n"); lines++; words++;}
%%

int yywrap() {
    printf("\n#lines: %d\n", lines);
    printf("#words: %d\n", words);
    return 1;
}

int main() {
    return yylex();
}