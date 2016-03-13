%name Parser
%define LSP_NEEDED
%define MEMBERS                 \
    virtual ~Parser()   {} \
    private:                   \
       yyFlexLexer lexer;
%define LEX_BODY {return lexer.yylex();}

%define ERROR_BODY {cerr << "error encountered at line: "<<lexer.lineno()<<" last word parsed:"<<lexer.YYText()<<"\n";}


%header{
#include <iostream>
#include <fstream>
#include <FlexLexer.h>
#include <stdlib.h>
#include <set>
#include <string>


#include "../topological_sorting/src/directed_graph.hpp"
using namespace std;

extern directed_graph<int> d ; 
extern std::string in ;
extern std::string out ;

%}

%union 
{
       const char * s_type ;
}
%type <s_type> dependence
%token <s_type> TARGET
%type <s_type> target
%type <s_type> rule
%token <s_type> TEXT
%type <s_type> text
%token <s_type> BREAK_RULE
%token <s_type> START_CMD
%type <s_type> every
%type <s_type> dependences
%type <s_type> cmds
%start every

%%
every: all every {;}
	| {;}
	;
all: rule BREAK_RULE cmds { 
							d.display();
						}
	| BREAK_RULE { directed_graph<int>::topological_sorting(d) ; }
   ; 
cmds: cmd cmds  {;}
	| BREAK_RULE {;}
	;
dependences: dependence dependences {;}
	| {;}
	;
target: TARGET { $$ = lexer.YYText() ; 
				 in = std::string($$) ; d.add_vertex(in.erase(in.length()-1,1)) ;}

    ;
dependence: TEXT { $$ = lexer.YYText() ;  out =std::string($$)  ; d.add_vertex(out) ;  d.add_arc(arc<int>(out,in,1)); }
	;
rule: target dependences {  }
	;
cmd: START_CMD text BREAK_RULE {;}
	;
text: TEXT text {;}
	| TEXT {;}
	;
%%
