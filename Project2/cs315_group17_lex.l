%{
#include <stdio.h>
#include "y.tab.h"
void yyerror(char *);
%}

/*Fundementals */
MAIN main   
ASSIGN_OP <==
LOOP_ASSIGN_OP \= 
SEMI_COL \: 
NL \n
LP \(
RP \)
LB \{
RB \}
LSB \[
RSB \]
COMMA ,
DOT .
UNDERSCORE _ 
NON_ZERO_DIGIT [1-9]
UPPER [A-Z]
LOWER [a-z]
SIGN [+-]
DIGIT [0-9]
NUMBER {NON_ZERO_DIGIT}{DIGIT}*
LETTER ({UNDERSCORE}|{UPPER}|{LOWER})
ALPHANUMERIC ({LETTER}|{DIGIT})+
TRUE true
FALSE false
BOOLEAN {TRUE}|{FALSE} 
NEW New 
SET Set 
IDENTIFIER {LETTER}({ALPHANUMERIC}|_)*  
ELEMENT '{ALPHANUMERIC}'
INT {SIGN}?{NUMBER}
SPACE " "

/*Comments (exe: # comment to write #) */
COMMENT [#].*[#]

/*Relation Operators*/
OR |\|\|
AND \&\&
EQUAL \=\=
NOT_EQUAL \!\= 
SMALLER <
BIGGER >
SMALLER_EQUALS \<\= 
BIGGER_EQUALS \>\=

/*Set Ops*/
DELETE delete
UNION union 
INTERSECTION intersection 
ADD add 
CARTESIAN cart 
SUBSET isSubset 
SUPERSET isSuperset 
CONTAIN contain

/*Console Output (exe: set1.print())*/
PRINT print 

/*Empty statement*/
PASS pass 
RETURN return  

/*Loops */
IF if
FOR for
WHILE while 
ELSE else 

/*Function Def (exe: func <identifier>(<param>){return <identifier>})*/
FUNCTION func 

/*Console Input*/
CONSOLE_IN input

/*Set Input*/
SET_IN inputElements
 

%option yylineno
%%
{MAIN} return MAIN;
{ASSIGN_OP} return ASSIGN_OP;
{LOOP_ASSIGN} return LOOP_ASSIGN;
{SEMI_COL} return SEMI_COL;
{LP} return LP;
{RP} return RP;
{LB} return LB; 
{RB} return RB; 
{LSB} return LSB; 
{RSB} return RSB; 
{COMMA} return COMMA;
{DOT} return DOT; 
{BOOLEAN} return BOOLEAN; 
{NEW} return NEW; 
{SET} return SET; 
{IDENTIFIER} return IDENTIFIER;
{INT} return INT; 
{DIGIT} return DIGIT; 

{OR} return OR;
{AND} return AND;
{EQUAL} return EQUAL;
{NOT_EQUAL} return NOT_EQUAL;
{SMALLER} return SMALLER;
{BIGGER} return BIGGER;
{SMALLER_EQUALS} return SMALLER_EQUALS;
{BIGGER_EQUALS} return BIGGER_EQUALS;


{SET_IN} return SET_IN;
{CONSOLE_IN} return CONSOLE_IN;

{FUNCTION} return FUNCTION;

{WHILE} return WHILE;
{FOR} return FOR; 
{IF} return IF;
{ELSE} return ELSE;

{PASS} return  PASS; 
{PRINT} return PRINT;
{RETURN} return RETURN;

{DELETE} return DELETE;
{UNION} return UNION;
{INTERSECTION} return INTERSECTION;
{ADD} return ADD;
{CARTESIAN} return CARTESIAN;
{SUBSET} return SUBSET;
{SUPERSET} return SUPERSET;
{CONTAIN} return CONTAIN;
{NL} ;
[ \t] ;
%%

int yywrap(void){
	return 1;
}