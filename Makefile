#
# Makefile for building the IC Compiler.  
#
# Requires SCALA_HOME to be set correctly.
#
# To build the source files, simply type "make" on the command line.
#
# It supports the following modes:
#
#   - source:    run JFlex on ic.flex and then build java files
#   - dump:    same as "source" but dump out JavaCup info
#   - clean:     removes all class files and ~ files
#   - all:       all of the above.
#

WX_SCALA_LIB = /usr/share/wx/scala/lib/scala-library.jar
BREW_SCALA_LIB = /usr/local/Cellar/scala/2.11.7/libexec/lib/scala-library.jar
SC = scalac

source: flexcup
	mkdir -p bin
	$(SC) -d bin -classpath .:tools/java-cup-11a.jar `find src -name "*.java"` `find src -name "*.scala"`
	@echo "If this fails, you need to define SCALA_HOME."
	javac -d bin -classpath .:bin:tools/java-cup-11a.jar:${SCALA_HOME}/lib/scala-library.jar:$(WX_SCALA_LIB):$(BREW_SCALA_LIB) `find src -name "*.java"`

flexcup:
	java -jar tools/java-cup-11a.jar -destdir src/ic/parser src/ic/parser/ic.cup
	java -jar tools/JFlex.jar src/ic/lex/ic.flex

dump:
	mkdir -p bin
	java -jar tools/java-cup-11a.jar -dump -destdir src/ic/parser src/ic/parser/ic.cup
	java -jar tools/JFlex.jar src/ic/lex/ic.flex
	$(SC) -d bin -classpath .:tools/java-cup-11a.jar `find src -name "*.java"` `find src -name "*.scala"`
	javac -d bin -classpath .:bin:tools/java-cup-11a.jar:${SCALA_HOME}/lib/scala-library.jar:$(WX_SCALA_LIB):$(BREW_SCALA_LIB) `find src -name "*.java"` 


clean:
	$(SC) -shutdown
	rm -f src/ic/lex/Lexer.java
	rm -f src/ic/parser/parser.java
	rm -f src/ic/parser/sym.java
	rm -rf bin/*

all:	clean source 

# For some reason, sbt does not pass correct classpath to javac.
# cannot find jars.  So we will do that explicitly.
bootstrap-sbt:
	mkdir -p target/scala-2.11/classes
	cd target/scala-2.11/classes && jar xf ../../../lib/java-cup-11a.jar && rm -r META-INF
