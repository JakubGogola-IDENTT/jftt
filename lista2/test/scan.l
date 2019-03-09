%{
    int yylex();
    int yywrap();
%}

%x COMMENT
%x TAG

%%

\<!-- 	BEGIN(COMMENT);
<COMMENT>{
	\n		;
	--\>	BEGIN(INITIAL);
}
\<		{BEGIN(TAG);ECHO;}
<TAG>{
	.+	{ECHO;BEGIN(INITIAL);}
}

%%

int yywrap() {
    return 1;
}

int main() {
	yylex();
}