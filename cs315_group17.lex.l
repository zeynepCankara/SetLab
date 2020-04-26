%{
#include <stdio.h>
#include "y.tab.h"
void yyerror(char *);
%}
main main
print print 
return return
pass pass 
if if
else else
new_line "\n"
open_par "("
close_par ")"
open_bracket "{"
close_bracket "}"
single_quote "'" 
coma ","
dot "."
colon ":"
comment_sign \#
digit [0-9]
non_zero_digit [1-9]
sign [+-]
number {non_zero_digit}{digit}*

assign_op <==
identifier [A-Za-z][A-Za-z0-9]*
new "new"
set_keyword "Set"
delete "delete"
true "true"
false "false"
cartesian "cart"
add "add"
union union
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
loop_assign_op "="
equal_op "=="
not_equal_op "!="
greater_or_equal_op ">="
lower_or_equal_op "<="
greater_op ">"
lower_op "<"
or_op "||"
and_op "&&"
bool {true}|{false} 
int {sign}?{number}

/* set type */
set_token \$
set_type {set_token}{identifier}*
/* statement end */
end_stmt ";"

%option yylineno
%%
 /*Return the tokens*/
{main} return MAIN;
{return} return RETURN;
{pass} return PASS;
{if} return IF;
{else} return ELSE;
{open_par}  return LP;
{close_par}  return RP;
{open_bracket} return LB;
{close_bracket}  return RB; 
{coma}           return COMMA;
{dot}             return DOT;
{int}             return INTEGER; 
{colon}           return COLON;
{comment_sign}    return COMMENT_SIGN;
{assign_op}       return ASSING_OP;
{new}             return NEW_KEYWORD;
{set_keyword}     return SET;
{delete}          return DELETE;
{bool}            return BOOLEAN;
{cartesian}       return CARTESIAN;
{add}             return ADD;
{union}           return UNION;
{is_subset}       return IS_SUBSET;
{console_in}      return CONSOLE_IN;
{is_superset}     return IS_SUPERSET;
{intersection}    return INTERSECTION;
{element_in}      return ELEMENT_IN;
{console_out}     return CONSOLE_OUT;
{contain_key}     return CONTAIN_KEY;
{while}           return WHILE;
{for}              return FOR;
{function}          return FUNCTION;
{loop_assign_op}          return LOOP_ASSIGN_OP;
{equal_op}             return EQUAL;
{not_equal_op}         return NOT_EQUAL;
{greater_or_equal_op}   return GREATER_OR_EQUAL;
{lower_or_equal_op}     return LOWER_OR_EQUAL;
{greater_op}            return GREATER;
{lower_op}              return LOWER;
{or_op}                 return OR;
{and_op}                return AND;
{identifier}            return IDENTIFIER;
{set_type}				return SET_TYPE;
{end_stmt}				return END_STMT;
{new_line} ; 
[ \t] ;
{single_quote}		return SINGLE_QUOTE;
%%

int yywrap(void){
	return 1;
}