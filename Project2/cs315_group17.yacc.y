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
%token DELETE
%token BOOLEAN
%token CARTESIAN
%token ADD
%token UNION
%token IS_SUBSET
%token CONSOLE_IN
%token IS_SUPERSET
%token INTERSECTION
%token ELEMENT_IN
%token CONSOLE_OUT
%token CONTAIN_KEY
%token WHILE
%token FOR
%token FUNCTION
%token LOOP_ASSIGN_OP
%token EQUAL
%token NOT_EQUAL
%token GREATER_OR_EQUAL
%token LOWER_OR_EQUAL
%token GREATER
%token LOWER
%token OR
%token AND
%token IDENTIFIER
%token ALPHANUMERIC
%token SET_TYPE
%token END_STMT
%token SINGLE_QUOTE

//%start program
%start program
%right ASSIGN_OP

%%

//Start Rule

//Program
program:
	main

main:
	MAIN LP RP LB statements RB

statements: 
	statement
	|statements statement

statement:
	comment_line 
	|expr END_STMT
	|loops 
	|funct_dec
	|conditional_stmt




// ****** Comment Line *****
comment_line:
	COMMENT_SIGN sentence COMMENT_SIGN


sentence:
	IDENTIFIER sentence
	|IDENTIFIER	
	
// ***** DECLERATIONS *****
expr:
	element_expr
	|int_expr
	|bool_expr
	|set_expr_list
	| set_initilize
	|func_call_dec
	| identifier_dec
identifier_dec:
	IDENTIFIER ASSING_OP IDENTIFIER
set_initilize:
	SET_TYPE ASSING_OP set_expr
func_call_dec:
	IDENTIFIER ASSING_OP funct_call
	|funct_call

element:
	SINGLE_QUOTE ALPHANUMERIC SINGLE_QUOTE
element_expr:
	IDENTIFIER ASSING_OP element

int_expr:
	IDENTIFIER ASSING_OP INTEGER
bool_expr:
	IDENTIFIER ASSING_OP BOOLEAN
	|IDENTIFIER ASSING_OP set_logical_expr

set_expr_list:
	set_delete_op
	|set_add_op
	|input_element_expr
	|output_expr


set_expr:
	set_init
	|set_union_op
	|set_intersection_op
	|cartesian_expr
	|input_set_expr

set_logical_expr:
	set_contain_expr
	|superset_expr
	|subset_expr
	


// ***** INITIALIZE *****
set_initialize:
	 SET_TYPE ASSIGN_OP set_expr


// ***** SETS *****
set_add_op:
	// $set.add(identifier)
	SET_TYPE DOT ADD LP IDENTIFIER RP
	|SET_TYPE DOT ADD LP element RP
	|SET_TYPE DOT ADD LP INTEGER RP
	|SET_TYPE DOT ADD LP SET_TYPE RP

set_delete_op:
	// $set.delete();
	SET_TYPE DOT DELETE LP RP

set_union_op:
	//  
	SET_TYPE DOT UNION LP SET_TYPE RP
set_init: 
	// $set <== new Set
	NEW_KEYWORD SET
set_intersection_op:
	// $set1<==$set2.intersection($set3);
	SET_TYPE DOT INTERSECTION LP SET_TYPE RP
cartesian_expr:
	// $set1<==$set2.cartesian($set2,$set3);
	SET_TYPE DOT CARTESIAN LP SET_TYPE COMMA SET_TYPE RP
	

set_contain_expr: 
	SET_TYPE DOT CONTAIN_KEY LP IDENTIFIER RP
	|SET_TYPE DOT CONTAIN_KEY LP element RP
	|SET_TYPE DOT CONTAIN_KEY LP INTEGER RP

superset_expr:
	// false <== $set.isSuperset($set)
	SET_TYPE DOT IS_SUPERSET LP SET_TYPE RP
subset_expr:
	// true <== $set.isSubset($set)
	SET_TYPE DOT IS_SUBSET LP SET_TYPE RP

// ******* LOOPS *********
loops:
	while_stmt
	|for_stmt 

while_stmt: 
	// while(logical_expr){block_stmts}
	WHILE LP logical_expr RP LB block_stmts RB
	|WHILE LP set_logical_expr RP LB block_stmts RB

for_stmt: 
	// for(i=12:200){block_stmts}
	FOR LP for_expr RP LB block_stmts RB  

for_expr:
	IDENTIFIER LOOP_ASSIGN_OP INTEGER COLON INTEGER

block_stmts:
	// pass;
	// return;
	PASS END_STMT
	|RETURN END_STMT
	|statements

logical_expr: 
	// 4 < 89
	// true && false
	// a >= b
	INTEGER LOWER INTEGER
	|INTEGER GREATER INTEGER 
	|INTEGER LOWER_OR_EQUAL INTEGER 
	|INTEGER GREATER_OR_EQUAL INTEGER 
	|IDENTIFIER LOWER IDENTIFIER
	|IDENTIFIER GREATER IDENTIFIER
	|IDENTIFIER LOWER_OR_EQUAL IDENTIFIER
	|IDENTIFIER GREATER_OR_EQUAL IDENTIFIER
	|IDENTIFIER AND IDENTIFIER
	|IDENTIFIER OR IDENTIFIER
	|BOOLEAN AND BOOLEAN
	|BOOLEAN OR BOOLEAN
	|BOOLEAN EQUAL BOOLEAN
	|BOOLEAN NOT_EQUAL BOOLEAN
	|IDENTIFIER EQUAL IDENTIFIER
	|IDENTIFIER NOT_EQUAL IDENTIFIER

//********* Confitional Statement ******//
conditional_stmt: 
	if_stmt
	|else_stmt

if_stmt:
	IF LP logical_expr RP LB block_stmts RB

else_stmt:
	ELSE LB block_stmts RB

//******** FUnction ********//
funct_dec:
	FUNCTION IDENTIFIER LP args RP LB block_stmts RB
funct_call:
	IDENTIFIER LP funct_call_args RP  

args:
	IDENTIFIER
	|
	|composite_args
composite_args:
	IDENTIFIER COMMA composite_args
	|IDENTIFIER

funct_call_args:
	funct_call_arg_type
	|funct_call_args COMMA funct_call_arg_type 
	
funct_call_arg_type:
 	IDENTIFIER
	|BOOLEAN
	|INTEGER
	|element
	|SET_TYPE
	
// ******* INPUTS ********
input_set_expr:
	// $set1 <== inputElements();
	CONSOLE_IN LP RP
	
input_element_expr:
 	// $set1.input();
	SET_TYPE DOT ELEMENT_IN LP RP

// ******* OUTPUTS ********
output_expr:
 	// $set1.print();
	SET_TYPE DOT CONSOLE_OUT LP RP

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

