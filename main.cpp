#include "parser.h"
#include <iostream>
using namespace std;

#include <set>
#include <string>

#include "../topological_sorting/src/directed_graph.hpp"

directed_graph<int> d;
 
std::string in ;
std::string out ;

int main(int argc, char ** argv)
{
       Parser parser;
       parser.yyparse();
       return 0;
}
