%x COMMENT
%x TAG

%%

"\<!--" 	BEGIN(COMMENT);
<COMMENT> {
	\n		;
	--\>	BEGIN(INITIAL);
}
"\<"		BEGIN(TAG);ECHO;
<TAG> {
	.+	ECHO;BEGIN(INITIAL);
}

%%

int main() {
	yylex();
}