LEX		= flex++
LFLAGS		= -d 
YACC		= bison++
YFLAGS		= -d
CXX		= g++
LINK		= g++
STD		= -std=c++11
INC		= -I/usr/include/qt4 -I/usr/include/qt4/QtGui -I/usr/include/qt4/QtCore
LIB		= -lQtGui -lQtCore
#### Files
SOURCES		= 	parser.cpp \
			scanner.cpp \
			main.cpp
				
OBJECTS		= objects/parser.o \
			  objects/scanner.o \
			  objects/main.o
			  
TARGET		= parser

EXT			= 	topological_sorting/objects/strfun.o \
				topological_sorting/objects/vertex.o \
				topological_sorting/objects/arc.o \
				topological_sorting/objects/directed_graph.o 
#### Building rules
all: $(TARGET) clean
	@echo "Building complete"

#### Linking
$(TARGET): $(OBJECTS) $(EXT)
	$(LINK) -o $(TARGET) $(OBJECTS) $(EXT) $(LIB)

#### G++ Compiling
objects/parser.o: parser.cpp
	$(CXX) -c  $(STD) parser.cpp -o objects/parser.o

objects/scanner.o: scanner.cpp
	$(CXX) -c $(STD) scanner.cpp -o objects/scanner.o

objects/main.o: main.cpp
	$(CXX) -c $(INC) $(STD) main.cpp -o objects/main.o

#### YACC routine
parser.cpp: parser.y
	$(YACC) $(YFLAGS)  -hparser.h -o parser.cpp parser.y

#### LEX routine
scanner.cpp: scanner.l
	$(LEX) $(LFLAGS) -oscanner.cpp scanner.l

#### Cleaning routine
clean: $(OBJECTS) 
	rm $(OBJECTS)
