%{
#include <stdio.h>
void yyerror(char *);
%}
%token INTEGER
%left '+' '-'
%left '*' '/'
%right UnaryMinus
%%
line:
      line expr '\n' { printf("%d\n", $2); }
      | line '\n'
     |
     |error '\n' {yyerror("Reenter prev line"); yyerrok;}
     ;
expr:
	INTEGER { $$ = $1; }
	| expr '+' expr { $$ = $1 + $3; }
	| expr '-' expr { $$ = $1 - $3; } 
	| expr '*' expr { $$ = $1 * $3; }
	| expr '/' expr { $$ = $1 / $3; } 
        | '-' expr %prec UnaryMinus {$$ = -$2;}
	;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}