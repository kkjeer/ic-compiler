package ic.error;

class ScopeError(override val line: Int, override val message: String) extends SemanticError(line, message) {

  /**
   * Return the line number of where the error occurred.
   */
  override def getLine(): Integer = line;

  override def getMessage(): String = message;

  override def toString(): String = {
    return "Scope error at line " + line + ": " + message + "\n";
  }

}