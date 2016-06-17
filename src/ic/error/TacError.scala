package ic.error;

class TacError(val message: String) extends Error(message) {

  override def getMessage(): String = message;

  override def toString(): String = {
    return "Tac error: " + message + "\n";
  }

}