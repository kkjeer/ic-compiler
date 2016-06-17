package ic.error;

class SemanticError(val line: Int, val message: String) extends Error(message) {

  /**
   * Return the line number of where the error occurred.
   */
  def getLine(): Integer = line;

  override def getMessage(): String = message;

  override def toString(): String = {
    return "Semantic error at line " + line + ": " + message + "\n";
  }

}