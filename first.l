
%{
	#include<iostream>
	using namespace std;

	int countID;
	int countKey;

%}

delim [ \t\n]
ws {delim}+
letter [A-Za-z]
digit [0-9]
id {letter}({letter}|{digit})*
number {digit}+(\.{digit}+)?
relop <|>=
arithOp [+|-|*|/]1
Lparen "("
Rparen ")"
Semicolon ";"

%%

{ws} ;
if {cout<< "Found keyword: " << yytext << endl; countKey++; }
then {cout<< "Found keyword: "<< yytext << endl; countKey++; }
return {cout<< "Found keyword: "<< yytext << endl; countKey++; }
{id} {cout<< "Found identifier: "<< yytext << endl; countID++; }
{number} {cout<< "Found number: "<< yytext << endl; }
{relop} {cout<< "Found Relational Operator: "<< yytext << endl; }
{Lparen} {cout<< "Found a Left parenthesis: "<< yytext << endl; }
{Rparen} {cout<< "Found a Right parenthesis: "<< yytext << endl; }
{Semicolon} {cout<< "Found a semicolon: "<< yytext << endl; }
{arithOp} {cout<< "Found a arithmatic operator: "<< yytext << endl; }
. ;
%%

int yywrap()
{
return 1;
}

int main()
{
FILE *myfile=fopen("C:\\Users\\CSE\\Desktop\\compilerLab\\value.txt","r");
if(!myfile)
{
cout<<"i cant open a.file!" << endl;
}
else
{
	
	
	
	yylex();
	

	fclose(myfile);
	cout<< "number of identifiers "<< countID << endl;
	cout<< "number of keywords "<< countKey << endl;
}
 
    
     getchar();
	return 0;
}