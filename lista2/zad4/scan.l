%{
#include <stdio.h>
#include <math.h>
#include <stdbool.h>

#define STACK_SIZE 1000

int yylex();
int yywrap();

int ptr = -1;
int stack[STACK_SIZE];
int err = false;
int a, b;

void push(int num) {
    ptr++;
    if (ptr < STACK_SIZE) {
        stack[ptr] = num;
    } else {
        fprintf(stderr, "\x1b[31mError: stack overflow - the best forum for programmers in the universe\n\x1b[0m");
        err = true;
    } 
}


int pop()  {
    if (ptr >= 0) {
        ptr--;
        return stack[ptr + 1];
    } else {

        err = true;
        return 0;
    }
}

%}

%x ERROR

%%
-?[0-9]+                    push(atoi(yytext));

\+                          {
                                a = pop();
                                b = pop();
                                push(a + b);
                            }

\-                          {
                                a = pop();
                                b = pop();
                                push(b - a);
                            }

\*                          {
                                a = pop();
                                b = pop();
                                push(a * b);
                            }

\/                          {
                                a = pop();
                                if (a == 0) {
                                    fprintf(stderr, "\x1b[31mError: division by 0 is not permitted\n\x1b[0m");
                                    BEGIN(ERROR);
                                } else {
                                    b = pop();
                                    push(b / a);
                                }
                            }     

\%                          {
                                a = pop();
                                if (a == 0) {
                                    fprintf(stderr, "\x1b[31mError: division by 0 is not permitted\n\x1b[0m");
                                    BEGIN(ERROR);
                                } else {
                                    b = pop();
                                    push(b % a);
                                }
                            }  
\^                          {
                                a = pop();
                                b = pop();
                                push( (int) pow((double) b, (double) a));
                            }

[ \t]                       ;

[\n]                        {
                                if(ptr != 0) {
                                    fprintf(stderr, "\x1b[31mError: to few operators\n\x1b[0m");
                                    ptr = -1;
                                    err = false;
                                    BEGIN(INITIAL);
                                } else {
                                    int res = pop();
                                    if(!err) {
                                        printf("= %d\n", res);
                                    } else {

                                        fprintf(stderr, "\x1b[31mError: to few arguments\n\x1b[0m");
                                    }
                                    err = false;
                                    ptr = -1;
                                    BEGIN(INITIAL);   
                                }
                            }  

.                           {
                                fprintf(stderr, "\x1b[31mError: unknown character: \"%s\"\n\x1b[0m", yytext); 
                                ptr = -1;
                                BEGIN(ERROR);
                            }

<ERROR>{
    .                       ;
    \n                      {ptr = -1; BEGIN(INITIAL);}
}

%%

int yywrap() {
    return 1;
}

int main() {
    return yylex();
}