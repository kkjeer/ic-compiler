package ic

import ic.lex.Lexer;
import ic.lex.Token;
import ic.error._;
import ic.dot._;

import java.io.BufferedReader
import java.io.FileReader
import java.io.IOException
import ic.parser._

import ic.parser.sym;
import ic.symtab._;
import ic.computeOffsets._;
import ic.ast._;
import ic.tc._;
import ic.tac._;
import ic.dfa._;
import ic.opt._;
import ic.cg._;
import ic.closures._;

//import ic.ast

/**
 * The main class for the IC Compiler.  The Compiler
 * expects the name of the file to process on the command line,
 * as in:
 * <pre>
 *   scala -classpath bin ic.Compiler test.ic
 * </pre>
 * An optional flag <tt>-d<tt> can be provided, as in:
 * <pre>
 *   scala -classpath bin ic.Compiler -d test.ic
 * </pre>
 * In this case, messages created by calling {@link ic.Util#debug(String)}
 * or {@link ic.Util#debug(String, Object...)} will be printed to the
 * terminal.  If <tt>-d</tt> is not provided, these messages will
 * be silently ignored.
 */

/* 
 * 				resultValue match {
  			  case p:ic.ast.Program => {
  			    println("Matched2!!!!!!!"); 
  			    pprint.printProgram(0, p);
		      }
			  }
			  */

object Compiler {

  var indentLevel = 0;

  def main(args: Array[String]) = {

    var n = 0;

    // If first command line argument is -d, turn on debugging
    if (args.length > 0 && args(n).equals("-d")) {
      Util.debug = true;
      n = n + 1;
    }

    // Get name of file
    if (args.length == n) {
      System.out.println("No file given.");
    } else {
      val file = args(n);
      Util.debug = args contains "-d";

      // example of debug message: This message will only be printed if
      // you provide "-d" on the command line.
      Util.debug("Processing %s...", file);

      try {
        val programParser = new parser(new Lexer(new FileReader(file)));
        val resultValue = programParser.parse().value;
        resultValue match {
          case p: ic.ast.Program => {
            println();
            if (args contains "pprint") {
              pprint.printProgram(0, p);
            }
            if (args contains "cats") {
              pprint.threeCats();
            }
            
            if (args contains "-printOriginal") {
              println("---Original Program---");
              println(p);
            }

            //build symbol tables and resolve variables
            ic.symtab.SymTabBuilder.buildSymbols(new SymbolTable("global", None, None), p);
            ic.symtab.isSymTabDefined.checkSymtabsAreDefinedStart(p);
            ic.symtab.useResolve.resolveStart(p);
            ic.symtab.isSymTabDefined.checkSymtabsAreDefinedStart(p);

            if (args contains "-printSymTab") {
              ic.symtab.printSymTabs.startPrintSymTabs(p)
            }

            //type check
            val typeCheckResult = TypeChecker.checkProgram(p);

            //pretty graphs
            //ic.dot.generateDot.startGenerateDot(p)
            
            //closure conversion
            val closureProgram = ClosureConversion.convertProgram(p);
            if (args contains "-printClosure") {
              println("---Closure Program---");
              println(closureProgram);
            }
            
            //symbol tables for converted program
            ic.symtab.SymTabBuilder.buildSymbols(new SymbolTable("global", None, None), closureProgram);
            ic.symtab.isSymTabDefined.checkSymtabsAreDefinedStart(closureProgram);
            ic.symtab.useResolve.resolveStart(closureProgram);
            
            //type check converted program
            TypeChecker.checkProgram(closureProgram);
            
            //generate TAC for converted program
            TACGenerator.generateTAC(closureProgram);
            
            //calculate offsets for converted program
            calcOffsets.computeOffsets(closureProgram);
            calcOffsets.setTempVarOffsets(closureProgram);
            
            //optimize converted program
            Optimizer.optimizeProgram(closureProgram, args);
            
            //code generation for converted program
            var genFile = CodeGen.apply(closureProgram, file);
            Link(genFile, "a.out");
          }
        }
      } catch {
        case e: LexicalError => {
          println(e);
          println("Failed.");
          System.exit(1);
        }
        case e: SyntaxError => {
          println(e);
          println("Failed.");
          System.exit(1);
        }
        case e: SemanticError => {
          println(e);
          println("Failed.");
          System.exit(1);
        }
        case e: TacError => {
          println(e);
          println("Failed.");
          System.exit(1);
        }
        case e: Error => {
          println("Error: " + e);
          println("Failed.");
          System.exit(1);
        }
      }
      println("Success.");
      System.exit(0);

    }

  }

}
