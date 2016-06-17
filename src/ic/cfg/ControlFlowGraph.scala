package ic.cfg;

import ic.tac._
import ic.ast._
import java.io.File
import java.io.PrintWriter
import java.util.Iterator
import java.util.Vector;
import scala.collection.mutable.MutableList
import scala.collection.mutable.Map

/**
 * A ControlFlowGraph manages a collection of Basic Blocks and provides
 * some basic operations on them.
 * <p>
 * Be sure to inialize the enter and exit
 * blocks with the blocks you are using for those nodes.
 * Those blocks should not contain real instructions from the method
 * being analyzed.  Instead, create two extra blocks with some special
 * instruction values to indicate that they are the enter and exit blocks.
 * See the DataFlowAnalysis documentation for more details.
 * <p>
 * This class implements the Iterable interface, so you can iterate
 * over the blocks in a graph as follows:
 * <pre>
 *   ControlFlowGraph cfg = ...;
 *   for (BasicBlock b :  cfg) {
 *     ...
 *   }
 * </pre>
 */
class ControlFlowGraph extends Iterable[BasicBlock] {

  private val blocks = new MutableList[BasicBlock]();
  private var enter: BasicBlock = null;
  private var exit: BasicBlock = null;

  /**
   * Allocate a new block that holds the given instruction.
   * A unique number will be assigned to that block.
   * Returns the block.
   */
  def newBlock(instr: TacInstr): BasicBlock = {
    val bb = new BasicBlock(blocks.size, instr);
    blocks += bb;
    bb;
  }

  /**
   * Return the block representing enter.
   */
  def getEnter() = enter;

  /**
   * Return the block representing exit.
   */
  def getExit() = exit;

  /**
   * Set the block representing enter.
   */
  def setEnter(enter: BasicBlock) = {
    this.enter = enter;
  }

  /**
   * Set the block representing exit.
   */
  def setExit(exit: BasicBlock) = {
    this.exit = exit;
  }

  /**
   * Returns an iterator for the blocks.  The iteration
   * order is the order in which blocks were allocated.
   */
  def iterator() = blocks.iterator;

  /**
   * Returns the block for an instruction. Throws
   * an exception if not such block exists.
   *
   * NOTE: This uses eq to compare TAC instructions by pointer
   * quality because you are likely to have used case classes
   * for TAC instructions and case classes representing the same
   * instruction cannot be distinguished from each other.  That is,
   * two separate occurrences of an instruction like
   * TACAdd(t1,t2,t3) will be equal to each other if you
   * use == as the comparison here.
   */
  def getBlock(i: TacInstr): BasicBlock = {
    blocks.find(_.instr eq i).get
  }

  /**
   * getCopies()
   * Returns a list of all the copy instructions in the CFG.
   */
  def getCopies(): List[TacCopy] = {
    var copies = List[TacCopy]();

    for (block <- blocks) {
      block.instr match {
        case copy: TacCopy => {
          copies :+= copy;
        }
        case _ => {}
      }
    }

    return copies;
  }

  /**
   * getExprs()
   * Returns a map of all expressions in the CFG to their defining instructions.
   */
  def getExprs(): Map[TacExpr, List[TacInstr]] = {
    var exprs = Map[TacExpr, List[TacInstr]]();

    for (block <- blocks) {
      block.instr match {
        case binInstr: TacBinInstr => {
          var e = new TacBinExpr(binInstr.left, binInstr.op, binInstr.right);
          if (!(exprs contains e)) {
            exprs(e) = List[TacInstr]();
          }
        }
        case unInstr: TacUnInstr => {
          var e = new TacUnExpr(unInstr.op, unInstr.src);
          if (!(exprs contains e)) {
            exprs(e) = List[TacInstr]();
          }
        }
        case arrayLoad: TacArrayLoad => {
          var e = new TacArrayExpr(arrayLoad.array, arrayLoad.index);
          if (!(exprs contains e)) {
            exprs(e) = List[TacInstr]();
          }
        }
        case arrayStore: TacArrayStore => {
          var e = new TacArrayExpr(arrayStore.array, arrayStore.index);
          if (!(exprs contains e)) {
            exprs(e) = List[TacInstr]();
          }
        }
        case arrayLength: TacLengthLoad => {
          var e = new TacLengthExpr(arrayLength.array);
          if (!(exprs contains e)) {
            exprs(e) = List[TacInstr]();
          }
        }
        case fieldLoad: TacFieldLoad => {
          var e = new TacFieldExpr(fieldLoad.fieldObj, fieldLoad.fieldDecl);
          if (!(exprs contains e)) {
            exprs(e) = List[TacInstr]();
          }
        }
        case fieldStore: TacFieldStore => {
          var e = new TacFieldExpr(fieldStore.fieldObj, fieldStore.fieldDecl);
          if (!(exprs contains e)) {
            exprs(e) = List[TacInstr]();
          }
        }
        case nullCheck: TacNullCheck => {
          var e = new TacNullCheckExpr(nullCheck.src);
          if (!(exprs contains e)) {
            exprs(e) = List[TacInstr]();
          }
        }
        case boundsCheck: TacBoundsCheck => {
          var e = new TacBoundsCheckExpr(boundsCheck.src, boundsCheck.array);
          if (!(exprs contains e)) {
            exprs(e) = List[TacInstr]();
          }
        }
        case sizeCheck: TacSizeCheck => {
          var e = new TacSizeCheckExpr(sizeCheck.src);
          if (!(exprs contains e)) {
            exprs(e) = List[TacInstr]();
          }
        }
        case zeroCheck: TacZeroCheck => {
          var e = new TacZeroCheckExpr(zeroCheck.src);
          if (!(exprs contains e)) {
            exprs(e) = List[TacInstr]();
          }
        }
        case _ => {}
      }
    }

    return exprs;
  }

  /**
   * Return a string rep for a CFG.
   */
  override def toString() = {
    blocks.mkString("\n");
  }

  /**
   * Writes a dot graph description to the file named fileName.
   * You can visually examine the graph as follows.  After generating
   * graph.dot, execute the following on the command line:
   * <pre>
   *   dot -Tpdf < graph.dot > graph.pdf
   * </pre>
   * Some escape characters and punctuation may confuse dot, in which
   * case you will need to add additional escaping commands, as I have done
   * for the few obvious special cases (", \n, etc).
   */
  def dotToFile(fileName: String) = {
    try {
      val out = new PrintWriter(new File(fileName));
      out.println("digraph G {");
      out.println("   node [shape=record];");
      for (b <- blocks) {
        out.print("B" + b.id + "[");
        out.print("label=\"{Block " + b.id + "|");
        val i = b.instr;
        out.print(i.toString().replace("<", "\\<").replace(">", "\\>").replace("\n", "\\n").replace("\"", "\\\"") + "\\n");
        out.print("}");
        out.println("\"];");
      }
      for (b <- blocks) {
        for (bb <- b.getSuccessors()) {
          out.println("B" + b.id + " -> " + "B" + bb.id + ";");
        }
      }
      out.println("}");
      out.close();
    } catch {
      case e: Throwable => throw new RuntimeException(e);
    }
  }

}
