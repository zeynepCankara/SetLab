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
%token PASS
%token IF
%token ELSE 
%token LP
%token RP
%token LB
%token RB 
%token UNDERSCORE
%token COMMA
%token DOT
%token INTEGER
%token COLON
%token COMMENT_SIGN
%token ASSING_OP
%token NEW_KEYWORD
%token SET
%token DELETE;
%token BOOLEAN;
%token CARTESIAN;
%token ADD;
%token UNION;
%token IS_SUBSET;
%token CONSOLE_IN;
%token IS_SUPERSET;
%token INTERSECTION;
%token ELEMENT_IN;
%token CONSOLE_OUT;
%token CONTAIN_KEY;
%token WHILE;
%token FOR;
%token FUNCTION;
%token LOOP_ASSIGN_OP;
%token EQUAL;
%token NOT_EQUAL;
%token GREATER_OR_EQUAL;
%token LOWER_OR_EQUAL;
%token GREATER;
%token LOWER;
%token OR;
%token AND;
%token IDENTIFIER;
%token SET_TYPE;
%token END_STMT;

%start program
%right ASSIGN_OP

%%

//Start Rule

//Program
// program:
//	predicateDeclarations main

main:
	MAIN LP RP LB statements RB

statememts: 
	statement
	| statememts statememt

statememt:


// ***** DECLERATIONS *****
spaces:
	space

// ***** INITIALIZE *****
set_init: 
	// $set <== new Set
	SET_TYPE ASSIGN_OP NEW_KEYWORD SET END_STMT


// ***** SETS *****
set_add_op:
	// $set.add(identifier)
	SET_TYPE DOT ADD LP IDENTIFIER RP END_STMT

set_delete_op:
	// $set.delete()
	SET_TYPE DOT DELETE LP RP

set_union_op:
	// $set1<==$set2.union($set3)
	SET_TYPE ASSIGN_OP SET_TYPE DOT UNION LP SET_TYPE RP 

set_intersection_op:
	// $set1<==$set2.intersection($set3)
	SET_TYPE ASSIGN_OP SET_TYPE DOT INTERSECTION LP SET_TYPE RP 


// ******* LOOPS *********
loop:
	while_stmt
	| for_stmt 

while_stmt: 

for_stmt: 

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

