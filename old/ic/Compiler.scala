package ic

import ic.lex.Lexer;
import ic.lex.Token;
import ic.error.LexicalError;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import ic.lex.sym;

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
object Compiler {

	def main(args : Array[String]) = {

		var n = 0;

		// If first command line argument is -d, turn on debugging
		if (args.length > 0 && args(n).equals("-d")) {
			Util.debug = true;
			n = 1;
		}

		// Get name of file
		if (args.length == n) {
			System.out.println("No file given.");			
		} else {
			val file = args(n);

			// example of debug message: This message will only be printed if
			// you provide "-d" on the command line.
			Util.debug("Processing %s...", file);

			// TODO: finish me.  You'll want to catch LexicalErrors here
			val lex : Lexer = new Lexer(new BufferedReader(new FileReader(file)));
			
			//for breaking out of while loop
			var failed = false;
			
			//initialize t to a dummy token
			//don't try to read the first token without a try-catch
			//since the first token might throw an exception
			var t : Token = new Token(sym.TRUE, 0);
			
			//keep reading tokens
			while (t.getId != sym.ENDOFINPUT && !failed) {
			  try {
			    t = lex.next_token();
			    print(t);
			  } catch {
			    case e: LexicalError => {
			      print(e);
			      print("Failed.\n");
			      System.exit(1)
			      failed = true;
			    }
			  }
			}
			
			//the program was read successfully
			if (!failed) {
		     print("Success.\n");
		     System.exit(0)
		  }
			
		}
		

	}

}
