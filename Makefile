LEX			= flex++
LFLAGS		= -d 
YACC		= bison++
YFLAGS		= -d
CXX			= g++
LINK		= g++
STD			= -std=c++11
#### Files
SOURCES		= parser.cpp scanner.cpp main.cpp
OBJECTS		= parser.o scanner.o main.o
TARGET		= parser
EXT			= strfun.o vertex.o arc.o directed_graph.o 
#### Building rules
all: $(TARGET) clean
	@echo "Building complete"

#### Linking
$(TARGET): $(OBJECTS) $(EXT)
	$(LINK)  -o $(TARGET) $(OBJECTS) $(EXT)

#### G++ Compiling
parser.o: parser.cpp
	$(CXX) -c  $(STD) parser.cpp -o parser.o

scanner.o: scanner.cpp
	$(CXX) -c $(STD) scanner.cpp -o scanner.o

main.o: main.cpp
	$(CXX) -c $(STD) main.cpp -o main.o

#### YACC routine
parser.cpp: parser.y
	$(YACC) $(YFLAGS)  -hparser.h -o parser.cpp parser.y

#### LEX routine
scanner.cpp: scanner.l
	$(LEX) $(LFLAGS) -oscanner.cpp scanner.l

#### Cleaning routine
clean: $(OBJECTS)
	rm $(OBJECTS)

