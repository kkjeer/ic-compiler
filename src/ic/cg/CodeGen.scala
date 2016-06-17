package ic.cg

import ic.IndentingPrintStream
import ic.ast.{ ClassDecl, Program }
import java.io.{ BufferedOutputStream, File, FileOutputStream, PrintStream }

/**
 * Driver for the IC TAC-to-x86-64 code generator.  This file gives
 * the high-level logic for code generation and defines methods for
 * generating canonical labels that will be used throughout code
 * generation.
 *
 * Code generation has three parts:
 * 1. Compute object offsets of fields, vtable offsets of methods,
 *    and stack offsets of parameters, local variables, and
 *    temporaries.
 * 2. Generate assembly code for the data segment, including string
 *    literals, vtables, and error messages.
 * 3. Generate assembly code for the text segment, including the code
 *    for each method and a wrapper, __ic_main, which initiates
 *    execution at the program's entry point method.
 */
object CodeGen {

  /**
   * Generate all assembly code for Program p, as derived from
   * source-code file icfile.  The assembly code will be emitted in
   * file icfile + ".s".
   */
  def apply(p: Program, icfile: String): String = {
    // Compute offsets.
    //ComputeOffsets(p)
    // Ready the assembly file and an assembly generator.
    val asmfile = icfile + ".s"
    val out =
      new IndentingPrintStream(
        new PrintStream(
          new BufferedOutputStream(
            new FileOutputStream(
              new File(asmfile)))))
    val asm = new Asm(out)
    // Mark the assembly file so it is easy to tell when it was
    // generated.  (Helps avoid debugging the wrong version of code.)
    asm.comment("Compiled by icc from " + icfile)
    asm.comment("At " + new java.util.Date().toString)
    // Generate the data segment.
    DataSegment(p, asm)
    // Generate the text segment.
    TextSegment(p, asm)
    // Close the assembly file and return its name.
    out.close()
    asmfile
  }

  /**
   * Return the label for a class's vtable (method vector) from its
   * declaration.
   */
  def vtableLabel(c: ClassDecl): String = {
    "__" + c.classId + "_vtable"
  }

  /**
   * Return the label for a method's code from its qualified name
   * (e.g., "Cow.x")
   */
  def methodLabel(qname: String): String = {
    "__method_" + qname
  }

  /**
   * Return the label for a library method's code, given its name.
   */
  def libLabel(name: String): String = {
    "__LIB_" + name
  }

}
