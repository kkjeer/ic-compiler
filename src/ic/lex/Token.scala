package ic.lex;

/*
// TODO: Write me.
class Token (id: sym, value: Object, line: Int) {
  def this (id: sym, line: Int) = this(id, Option(null), line);
  def getId:sym = id;
  def getValue:Any = value;
  def getLine:Int = line;
  override def toString():String = {
    return String.format("%-20s %-40s %8s\n", "ID: " + id, "VALUE: " + value, "LINE: " + line);
  }
}
*/

import java_cup.runtime.Symbol;

/**
 * Just a simple extension to the Symbol class from
 * CUP.  
 */
class Token(id : Int, value : Object, line : Int) extends Symbol(id,line,line,value) {
	
	override def toString() = {
		"[" + this.sym + "," + this.value + "," + this.left + "]";
	}
}
