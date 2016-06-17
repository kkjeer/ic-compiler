package ic.cg
import ic.Util
import ic.ast._

/**
  * Generate the data segment of the assembly file, including static
  * storage of string literals and the method vector (vtable) for
  * every class.
  */
object DataSegment {

  /*
   * For each type of runtime error, constants hold error message
   * string literal and its label.  (This is distinct from the labels
   * for the error handler code, in TestSegment.scala)
   */
  // Array index out of bounds.
  val BOUNDS_ERROR_LABEL = "__ic_error_string_bounds"
  val BOUNDS_ERROR_MESSAGE = "Array bounds violation."
  // Null pointer dereference.
  val NULL_ERROR_LABEL = "__ic_error_string_null"
  val NULL_ERROR_MESSAGE = "Null pointer violation."
  // Negative array allocation size.
  val SIZE_ERROR_LABEL = "__ic_error_string_size"
  val SIZE_ERROR_MESSAGE = "Array size violation."
  // Divide/mod by zero.
  val DIV_ERROR_LABEL = "__ic_error_string_div"
  val DIV_ERROR_MESSAGE = "Divide by 0 violation."


  /**
    *  Generate the data segment for the given Program, p, using the
    *  given assembly generator, asm.
    */
  def apply(p: Program, asm: Asm): Unit = {
    // Begin the section for read-only/literal data.
    asm.section(Literals)
    // String literals
    asm.comment("string literals")
    // For each string literal used in the program:
    // define a string literal in the assembly.
    for (ts <- p.tacStrings) {
      asm.stringDef(ts.value, ts.id)
    }
    
    // For each kind of runtime error, define a string literal for the
    // error message.
    for ((label,message) <- List(
      (BOUNDS_ERROR_LABEL,BOUNDS_ERROR_MESSAGE),
      (NULL_ERROR_LABEL,NULL_ERROR_MESSAGE),
      (SIZE_ERROR_LABEL,SIZE_ERROR_MESSAGE),
      (DIV_ERROR_LABEL,DIV_ERROR_MESSAGE))
    ) {
      asm.stringDef(message,label)
    }

    // For each class, emit the vtable representation.
    for (c <- p.classes) {
      asm.comment("vtable for class " + c.classId)
      // Ensure the table is properly aligned.
      asm.align(Asm.WORD_SIZE)
      // Label it so we can create pointers to this vtable.
      asm.label(CodeGen.vtableLabel(c))
      // Fill in the vtable representation, listing the label
      // (address) of each method in the relevant position.  Also
      // sanity check methods' assigned offsets against their actual
      // position in the vtable list.
      var off = 0
      for (m <- c.vTable) {
        Util.assertTrue(off == Asm.WORD_SIZE * m.index, "bad offset")
        asm.quad(CodeGen.methodLabel(m.qname))
        off += Asm.WORD_SIZE
      }
    }
  }
}
