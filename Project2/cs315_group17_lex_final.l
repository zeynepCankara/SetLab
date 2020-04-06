%{
#include <stdio.h>
#include "y.tab.h"
void yyerror(char *);
%}
main main
print print 
return return
if if
else else
new_line "\n"
space " "
open_par "("
close_par ")"
open_bracket "{"
close_bracket "}"
underscore  "_"
single_quote "'"
coma ","
dot "."
colon ":"
comment_sign "#"
upper [A-Z]
lower [a-z]
digit [0-9]
non_zero_digit [1-9]
sign [+-]
number {non_zero_digit}{digit}*
letter ({underscore}|{upper}|{lower})
alphanumeric ({letter}|{digit})+
assign_op "<=="
identifier {letter}({alphanumeric}|_)*
new "new"
set_keyword "Set"
delete "delete"
true "true"
false "false"
cartesian "cart"
add "add"
union "union"
is_subset "isSubset"
console_in "inputElements"
is_superset "isSuperset"
intersection "intersection"
element_in "input"
console_out "print"
contain_key "contain"
while "while"
for "for"
function "func"
equal_op "=="
not_equal_op "!="
greater_or_equal_op ">="
lower_or_equal_op "<="
greater_op ">"
lower_op "<"
or_op "||"
and_op "&&"

%option yylineno
%%
 /*Print the tokens*/
{main} return main;
{return} return RETURN;
{if} return IF;
{else} return ELSE;
{new_line}              printf("NEW_LINE-");
{space}                 printf("SPACE-");
{open_par}              printf("OPEN_PAR-");
{close_par}             printf("CLOSE_PAR-");
{open_bracket}          printf("OPEN_BRACKET-");
{close_bracket}         printf("CLOSE_BRACKET-");
{underscore}            printf("UNDERSCORE-");
{single_quote}          printf("SINGLE_QUOTE-");
{coma}                  printf("COMA-");
{dot}                   printf("DOT-");
{number}                printf("NUMBER-");
{colon}                 printf("COLON-");
{comment_sign}          printf("COMMENT_SIGN-");
{sign}                  printf("SIGN-");
{letter}                printf("LETTER-");
{assign_op}             printf("ASSING_OP-");
{new}                   printf("NEW_KEYWORD-");
{set_keyword}           printf("SET-");
{delete}                printf("DELETE-");
{true}                  printf("TRUE-");
{false}                 printf("FALSE-");
{cartesian}             printf("CARTESIAN-");
{add}                   printf("ADD-");
{union}                 printf("UNION-");
{is_subset}             printf("IS_SUBSET-");
{console_in}            printf("CONSOLE_IN-");
{is_superset}           printf("IS_SUPERSET-");
{intersection}          printf("INTERSECTION-");
{element_in}            printf("ELEMENT_IN-");
{console_out}           printf("CONSOLE_OUT-");
{contain_key}           printf("CONTAIN_KEY-");
{while}                 printf("WHILE-");
{for}                   printf("FOR-");
{function}              printf("FUNCTION-");
{equal_op}              printf("EQUAL-");
{not_equal_op}          printf("NOT_EQUAL-");
{greater_or_equal_op}   printf("GREATER_OR_EQUAL-");
{lower_or_equal_op}     printf("LOWER_OR_EQUAL-");
{greater_op}            printf("GREATER-");
{lower_op}              printf("LOWER-");
{or_op}                 printf("OR-");
{and_op}                printf("AND-");
{identifier}            printf("IDENTIFIER-");
%%

int yywrap(void){
	return 1;
}