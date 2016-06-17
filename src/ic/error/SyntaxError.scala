package ic.error;

class SyntaxError(val line: Int, val message: String) extends Error(message) {

  /**
   * Return the line number of where the error occurred.
   */
  def getLine(): Integer = line;

  override def getMessage(): String = message;

  override def toString(): String = {
    return "Syntax error at line " + line + ": unexpected token " + message + "\n";
  }

}