package ic;

import java.io.PrintStream;

/**
 * A class to print with tabbing.  See the example main() at the
 * end of the file.
 *
 * To use:
 *
 * <ul>
 * <li> Create a new IndentingPrintStream "out" using System.out as
 * the constructor parameter.
 * 
 * <li> Whenever you enter a scope and wish to indent output more, 
 * call out.indentMore().
 * 
 * <li> Whenever you exit a scope and wish to indent output less, 
 * call out.indentLess().
 * 
 * <li> Don't print to the underlying print stream directly. 
 * </ul>
 *
 */
class IndentingPrintStream(out: PrintStream) extends PrintStream(out) {

	/** The number levels we wish to indent the next line */
	var indentLevel = 0;

	/** Was the last thing printed a new line? */
	var atStartOfLine = true;

	/**
	 * Indicate that you would like to indent all subsequent lines
	 * one more tab level than the current line.
	 */
	def indentMore(): Unit = {
		indentLevel += 1
	}

	/**
	 * Indicate that you would like to indent all subsequent lines
	 * one less tab level than the current line.
	 */
	def indentLess(): Unit = {
		indentLevel -= 1
	}

	/**
	 * Split a String into pieces with not internal \n characters, and print
	 * each one, separating them with the right amount of padding.
	 */
	private def printWithTabbing(s: String): Unit = {
		val lines = s.split("\n", -1);
		if (atStartOfLine) pad();
		for (x <- lines.slice(0, lines.size - 1)) {
			out.println();
			pad();
		}
		out.print(lines.last);
	}

	/**
	 * Insert spaces proportional to the current depth of
	 * tabbing.  This is called in the above methods whenever
	 * we start printing after a new line.
	 */
	private def pad(): Unit = {
		for (i <- Range(0, indentLevel)) {
			out.print("  ");
		}
		atStartOfLine = false;
	}


	/**
	 * A variant of printf that is aware of line starts and 
	 * indentation.
	 */
	override def printf(s: String, args: Object*): IndentingPrintStream = {
		val toPrint = String.format(s, args);
		printWithTabbing(toPrint);
		this
	}

	/**
	 * A variant of print that is aware of line starts and 
	 * indentation.
	 */
	override def print(s: String): Unit = {
		printWithTabbing(s);
	}


	/**
	 * A variant of println that is aware of line starts and 
	 * indentation.
	 */
	override def println(s: String): Unit = {
		printWithTabbing(s);
		println();
	}

	/**
	 * A variant of println that is aware of line starts and 
	 * indentation.
	 */
	override def println(): Unit = {
		out.println();
		atStartOfLine = true;
	}

	// All the other expected methods to print common built-in types
    override def print(x: Boolean): Unit = { print(x.toString); }
	override def print(x: Char)   : Unit = { print(x.toString); }
	override def print(x: Int)    : Unit = { print(x.toString); }
	override def print(x: Long)   : Unit = { print(x.toString); }
	override def print(x: Double) : Unit = { print(x.toString); }
	override def print(x: Float)  : Unit = { print(x.toString); }
	override def print(x: Object) : Unit = { printWithTabbing(x.toString); }

	override def println(x: Boolean): Unit = { println(x.toString); }
	override def println(x: Char)   : Unit = { println(x.toString); }
	override def println(x: Int)    : Unit = { println(x.toString); }
	override def println(x: Long)   : Unit = { println(x.toString); }
	override def println(x: Double) : Unit = { println(x.toString); }
	override def println(x: Float)  : Unit = { println(x.toString); }
	override def println(x: Object) : Unit = { printWithTabbing(x.toString); println(); }


	/*
	 * The following example prints out:

     class Moo {
       void cow() {
         This
         is
         { a }
         test.
       3

       true
       }
     }

	 */
	def main(args: Array[String]): Unit = {
		val out = new IndentingPrintStream(System.out);
		out.println("class Moo {");
		out.indentMore();
		out.print("void cow()");
		out.print(" {");
		out.println();
		out.indentMore();
		out.println("This\nis\n{ a }\ntest.");
		out.indentLess();
		out.print(3);
		out.print("\n\n");
		out.println(true);
		out.println("}");
		out.indentLess();
		out.println("}");
	}
}
