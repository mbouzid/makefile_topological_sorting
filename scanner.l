%option c++
%option noyywrap

%{
#include<sstream>
#include "parser.h"
#include <cstdlib>
//YY_CalcParser_STYPE val;
%}

TEXT [^ \\\t\n:;]|\\[^\n]

%%
{TEXT}+ { return Parser::TEXT ;}
{TEXT}+: { return Parser::TARGET; }
\n { return Parser::BREAK_RULE ; }
\t { return Parser::START_CMD ; }
.                 {;}
<<EOF>>           {
                   yyterminate();
                 }

%%
