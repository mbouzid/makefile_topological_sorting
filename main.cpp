//	std lib
#include <set>
#include <string>
#include <iostream>

//	own lib
#include "topological_sorting/src/directed_graph.hpp"
#include "parser.h"

//	qt lib
#include <QtGui/QApplication>
#include <QtGui/QLineEdit>

directed_graph<int> d;
std::string in ;
std::string out ;

int main(int argc, char ** argv)
{
	QApplication app(argc,argv);
	std::ifstream yyin(argv[1]);
	
	if (!yyin) exit(EXIT_FAILURE) ;

	Parser parser(&yyin);
	return app.exec();
}
