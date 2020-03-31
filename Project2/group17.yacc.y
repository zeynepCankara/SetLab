%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char* s);
extern int yylineno;
%}

// ---Do the Token assignments below----
// Exe: %token ASSIGNMENTOP


// Exe: %start program
// Exe: %right ASSIGNMENTOP

%%

//Start Rule

//Program
// program:
//	predicateDeclarations main

// main:
//	MAIN LP RP LB stmts RB


// ***** DECLERATIONS *****


// ***** INITIALIZE *****

// ***** SETS *****

// ******* LOOPS *********
// ******* INPUTS ********
// ******* OUTPUTS ********

%%



void yyerror(char *s) {
	fprintf(stdout, "line %d: %s\n", yylineno,s);
}
int main(void){
 yyparse();
if(yynerrs < 1){
		printf("Parsing: SUCCESSFUL!\n");
	}
 return 0;
}

