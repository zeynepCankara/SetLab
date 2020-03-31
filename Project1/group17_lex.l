
 /*Basic Ops*/
upper [A-Z]
lower [a-z]
digit [0-9]
non_zero_digit [1-9]
sign [+-]
number {non_zero_digit}{digit}*
letter ({upper}|{lower})
alphanumeric ({letter}|{digit})+
 /*Assignment (exe: <==)*/
assign_op "<=="


/*Assignment of variables (exe: myVar <== 'hello')*/
identifier_expr {identifier}{space}*{assign_op}{space}*(bool_type}{set_type}{int_type}{element})

/*Statements*/
stmt_list {stmt}*
stmt {set_expr}


 /*types*/
bool_type  true|false
set_type {open_bracket}(({element}|{identifier})({space}?))*{close_bracket}
int_type {sign}?{number}
element '{alphanumeric}'

/*identifier and paranthesis*/
identifier {letter}({alphanumeric}|_)* 
paranthesis {"{" | "}" | open_par | close_par}
newline "\n"
space " "
open_par "("
close_par ")"
open_bracket "{"
close_bracket "}"

 /*Set Initialization (exe: set1 <== new Set)*/
set_init "new Set"
set_expr {set_type}{space}?{assign_op}{space}*{set_init}{set_type}?

/*Comments (exe: # comment to write #) */
comment_keyword "#"
comment_expr [#].*[#]

/*Deleting (exe: delete set1) */
delete_keyword "delete"
delete_expr  {delete_keyword}{space}{identifier}

/*Adding (exe: set1.add(set2))*/
add ".add"
add_op  {add}{open_par}({space}*({identifier}|{element}|{set_type}){space}*){close_par}
add_expr {identifier}{add_op}

/*Union (exe: set <== set.union(set))*/
union ".union"
union_op {union}{open_par}({space}*({identifier}|{set_type}){space}*){close_par}
union_expr {identifier}{space}?{assign_op}{space}?{identifier}{union_op}

/*Intersection (exe: set3 <== set1.intersection(set2))*/
intersection ".intersection"
intersection_op {intersection}{open_par}({space}*({identifier}|{set_type}){space}*){close_par}
intersection_expr {identifier}{space}?{assign_op}{space}?{identifier}{intersection_op}

/*Set Relations (exe: bool <== set1.isSubset(set2))*/
subset ".isSubset"
subset_op {subset}{open_par}({space}*({identifier}|{set_type}){space}*){close_par}
subset_expr {identifier}{space}?{assign_op}{space}?{identifier}{subset_op}

/*Set Relations (exe: bool <== set1.isSuperset(set2))*/
superset ".isSuperset"
superset_op {superset}{open_par}({space}*({identifier}|{set_type}){space}*){close_par}
superset_expr {identifier}{space}?{assign_op}{space}?{identifier}{superset_op}

/*Console Input (exe: set1 <== inputElements())*/
console_in "inputElements()"
input_expr {identifier}{space}?{assign_op}{space}?{console_in}

/*Console Output (exe: set1.print())*/
console_out ".print()"
output_expr {identifier}{console_out}

/*While Loop (exe: while(2<44){pass} or while(true){pass})*/
relation_op (==|!=|>=|<=|>|<)

condition ({space}?({identifier}|{bool_type}){space}?|{space}?({identifier}|{int_type}){relation_op}{int_type}{space}?)
empty_statement "pass"
while_op "while"

while_loop {while_op}{open_par}{condition}{close_par}{open_bracket}{empty_statement}{close_bracket}

/*For Loop (exe: for(i=4:99){pass})*/
for_op "for"
for_condition {space}?i=({identifier}|{int_type}):({identifier}|{int_type}){space}?
for_loop {for_op}{open_par}{for_condition}{close_par}{open_bracket}{empty_statement}{close_bracket}

/*Function Def (exe: func <identifier>(<param>){return <identifier>})*/
func_keyword "func" 
args {identifier}?(,{space}*{identifier})*
func_def {func_keyword}{space}+{identifier}{open_par}{args}{close_par}{open_bracket}{empty_statement}(return{space}+{identifier})?{close_bracket}

/*Function Call (exe: func_name(<params>) or set.func_name(<params>))*/
select "."
func_call ({identifier}{select}{identifier}{open_par}{args}{close_par}|{identifier}{open_par}{args}{close_par})
%%

 /*Print the tokens*/
{set_type}                     printf("SET ");
{set_init}                     printf("SET_INIT ");
{func_def}                     printf("FUNCTION_DEF ");
{func_keyword}                 printf("FUNC ");
{comment_expr}                 printf("COMMENT ");
{set_expr}                     printf("SET_CREATE ");
{delete_expr}                  printf("SET_DELETE ");
{add_expr}                     printf("ADD ");
{union_expr}                   printf("UNION ");
{intersection_expr}            printf("INTERSECTION ");
{subset_expr}                  printf("SUBSET_CHECK ");
{superset_expr}                printf("SUPERSET_CHECK ");
{input_expr}                   printf("READ_INPUT ");
{output_expr}                  printf("OUTPUT ");
{assign_op}                    printf("ASSIGN_OP ");
{relation_op}                  printf("RELATION_OP ");
{while_loop}                   printf("WHILE_LOOP ");
{for_loop}                     printf("FOR_LOOP ");
{func_call}                    printf("FUNCTION_CALL ");
{comment_keyword}              printf("COMMENT_KEY ");
{int_type}                     printf("INTEGER ");
{bool_type}                    printf("BOOLEAN ");
{open_bracket}                 printf("LB ");
{close_bracket}                printf("RB ");
{open_par}                     printf("LP ");
{close_par}                    printf("RP ");
{element}                      printf("ELEMENT ");
{identifier}                   printf("IDENTIFIER ");
{newline}                      printf("NL ");
%%
int yywrap(void) {
	return 1;
}

int main(void) {
    extern FILE *yyin, *yyout;
    yyin = fopen("input3.txt", "r");
    yyout = fopen("Output1.txt", "w");
    yylex();
    return 0; ;
}
