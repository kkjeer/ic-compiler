package ic.cg

import ic.IndentingPrintStream
import ic.Util
import ic.tac._

/**
  * Assembler constants.
  */
object Asm {
  /** Prefix for all labels of string literals. */
  val STRING_LIT_PREFIX = "__ic_string_lit_"
  /** Size of word on this architecture. */
  val WORD_SIZE = 8
  /** Is the compiler running on Mac OS X? */
  val MACOSX = System.getProperty("os.name").equals("Mac OS X")
  /** Do stack accesses relative to this register */
  val STACK_ANCHOR = "%rbp"  // You may want to use %rbp
}

/** Assembly file sections. */
abstract class Section
case object Literals extends Section
case object Text extends Section


/**
  *  Assembly generator.
  */
class Asm(out: IndentingPrintStream) {
  /**
    * The currently active assembly section.
    */
  private var sec: Option[Section] = None

  /**
    * Assert that the given section is currently active.
    */
  def in(s: Section): Unit = {
    Util.assertTrue(sec == Some(s),
      "Expected assembly section " + s + " to be active, but found" + sec)
  }

  /**
    * Begin the given section.
    */
  def section(s: Section) = {
    out.println()
    s match {
      case Literals =>
        if (Asm.MACOSX) out.println(".data" )
        else out.println(".section .rodata" )
      case Text =>
        if (Asm.MACOSX) out.println(".text")
        else out.println(".section .text")
    }
    sec = Some(s)
  }

  /**
    * Given a number of words, return the corresponding number of
    * bytes.
    */
  def wordsAsBytes(n: Int): Int = {
    n * Asm.WORD_SIZE
  }

  /** Emit a newline. */
  def newline(): Unit = out.println()

  /**
    *  Emit a comment.
    */
  def comment(s: String): Unit = {
    out.print("  # ")
    out.println(s)
  }

  /** Mark the given label as a globally visible label. */
  def global(s: String): Unit = out.println(".globl " + s)

  /**
    * Align the next item to the given alignment.
    */
  def align(n: Int): Unit = {
    out.print("    .align ")
    out.println(n)
  }

  /**
    * Mark the next item with the given label.
    */
  def label(lab: String): Unit = {
    Util.assertTrue(!lab.contains("=>"), "found =>");
    out.print(lab)
    out.println(":")
  }

  /**
    * Mark the next item with the label formed by concatenating the
    * given prefix and label.
    */
  def label(prefix: String, lab: String): Unit = {
    out.print(prefix)
    label(lab)
  }

  /**
    * Mark the next item with the label formed by concatenating the
    * given prefix and number n.
    */
  def label(prefix: String, n: Int): Unit = {
    out.print(prefix)
    out.print(n)
    out.println(":")
  }

  /**
    * Emit a quad (8-byte) literal value.
    */
  def quad(s: String): Unit = {
    out.print("    .quad ")
    out.println(s)
  }

  /**
    * Return the label for the runtime address of the string literal
    * with given ID n.
    */
  def stringLabel(n: Int): String = {
    Asm.STRING_LIT_PREFIX + n
  }

  /**
    * Emit a string literal definition for the given string literal
    * with the given ID n.
    */
  def stringDef(s: String, n: Int): Unit = {
    stringDef(s, stringLabel(n))
  }

  /**
    * Emit a string literal definition for the given string literal,
    * strLit, assigning it assembly label lab.
    */
  def stringDef(strLit: String, lab: String): Unit = {
    in(Literals)
    align(Asm.WORD_SIZE)
    quad(strLit.length.toString)
    label(lab)
    out.print("    .ascii"); out.println(Util.escape(strLit))
    out.println()
  }

  /**
    * Emit an x86 instruction with opcode i, source operand src, and
    * destination operand dest.
    */
  def inst(i: String, src: String, dest: String): Unit = {
    in(Text)
    out.format("    %s %s, %s\n", i, src, dest)
  }

  /**
    * Emit an x86 instruction with opcode i, literal integer source
    * operand src, and destination operand dest.
    */
  def inst(i: String, src: Int, dest: String): Unit = {
    in(Text)
    out.format("    %s $%s, %s\n", i, src.toString, dest)
  }

  /**
    * Emit an x86 instruction with opcode i and single operand op.
    */
  def inst(i: String, op: String): Unit = {
    in(Text)
    out.format("    %s %s\n", i, op)
  }

  /**
    * Emit an x86 instruction with opcode i and single integer literal
    * operand x.
    */
  def inst(i: String, x: Int): Unit = {
    in(Text)
    out.format("    %s $%s\n", i, x.toString)
  }

  /**
    * Emit an x86 instruction with no operand.
    */
  def inst(i: String): Unit = {
    in(Text)
    out.format("    %s\n", i)
  }

  /**
    * Emit an instruction to load from memory at the address computed
    * from the given base register plus the given literal offset to
    * the given destination register.
    */
  def load(base: String, offset: Int, dest: String): Unit = {
    inst("movq", offset.toString + "(" + base + ")", dest)
  }
  
  /**
    * Emit an instruction to store from the given source operand
    * to memory at the address computed from the given base register
    * plus the given literal offset.
    */
  def store(src: String, base: String, offset: Int): Unit = {
    inst("movq", src, offset.toString + "(" + base + ")")
  }
  
  /**
    * Emit an instruction to load from the given stack offset
    * (relative to stack register given by Asm.STACK_ANCHOR) to the given
    * destination register.
    */
  def loadStack(offset: Int, dest: String): Unit = {
    load(Asm.STACK_ANCHOR, offset, dest)
  }

  /**
    * Emit an instruction to store from the given source operand to
    * the given stack offset (relative to stack register given by
    * Asm.STACK_ANCHOR).
    */
  def storeStack(src: String, offset: Int): Unit = {
    store(src, Asm.STACK_ANCHOR, offset)
  }
  
  /**
    * Emit an instruction to load an array element into a destination
    * register, where the array base address is held in the given base
    * register, the array index is held in the given index register,
    * and the element size (in bytes) is given by scale.
    */
  def loadIndex(base: String, index: String, scale: Int, dest: String): Unit = {
    inst("movq", "(" + base + "," + index + "," + scale + ")", dest)
  }

  /**
    * Emit an instruction to store the given source operand into an
    * array element, where the array base address is held in the given
    * base register, the array index is held in the given index
    * register, and the element size (in bytes) is given by scale.
    */
  def storeIndex(src: String, base: String, index: String, scale: Int): Unit = {
    inst("movq", src, "(" + base + "," + index + "," + scale + ")")
  }
  
}

