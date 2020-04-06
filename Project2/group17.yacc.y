%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char* s);
extern int yylineno;
%}

// ---Do the Token assignments below----
%token MAIN
%token RETURN
%token LOOP_ASSIGN_OP
%token SEMI_COL
%token NL
%token LP
%token RP
%token LB
%token RB
%token LSB
%token RSB 
%token COMMA
%token DOT
%token BOOLEAN
%token NEW
%token SET
%token IDENTIFIER
%token INT
%token DIGIT
%token OR
%token AND
%token EQUAL
%token NOT_EQUAL
%token SMALLER
%token BIGGER
%token SMALLER_EQUALS
%token BIGGER_EQUALS
%token SET_IN
%token CONSOLE_IN
%token FUNCTION
%token WHILE
%token FOR
%token IF
%token ELSE
%token PASS
%token PRINT
%token RETURN
%token DELETE
%token UNION
%token INTERSECTION
%token ADD
%token CARTESIAN
%token SUBSET
%token SUPERSET
%token CONTAIN


%start program
%right ASSIGN_OP

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

