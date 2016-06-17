package ic.opt;

import ic._;
import ic.ast._;
import ic.dfa._;
import ic.cfg.ControlFlowGraph;
import ic.tac._;
import scala.collection.mutable.MutableList;
import scala.collection.mutable.ListBuffer;
import scala.collection.mutable.Map;

/**
 * Performs common subexpression elimination using Available Expressions Analysis
 */
class ConstantFolding extends Optimization {
  var printDFA = false;

  def setPrintDFA(flag: Boolean) = {
    printDFA = flag;
  }

  override def optimize(md: MethodDecl): Int = {
    var cfg = md.tacList.toCFG();
    var constFold = new ConstantFoldingAnalysis(cfg);
    constFold.solve();
    if (printDFA) {
      println("***CONSTANT FOLDING ANALYSIS (CONSTANT FOLDING)***");
      println(constFold);
    }

    var optimized = md.tacList.tacInstructions map (
      instr =>
        instr match {
          case unInstr: TacUnInstr => {
            getCopyInstr(unInstr, unInstr.dest, constFold, cfg);
          }
          case binInstr: TacBinInstr => {
            getCopyInstr(binInstr, binInstr.dest, constFold, cfg);
          }
          case _ => {
            instr;
          }
        });

    var tacList = new TACList();
    tacList.setInstrs(optimized);
    md.setTacList(tacList);

    return numChanges;
  }

  /**
   * Returns a instruction copying a constant into the given destination
   * 	if the value of the destination is a constant,
   * or the original instruction otherwise.
   */
  def getCopyInstr(instr: TacInstr, dest: TacVar, constFold: ConstantFoldingAnalysis, cfg: ControlFlowGraph): TacInstr = {
    var map = constFold.out(cfg.getBlock(instr));
    if (map contains dest) {
      var const = map(dest);
      const match {
        case nac: TacNac => {
          return instr;
        }
        case _ => {
          var copy = new TacCopy(dest, const);
          copy.setComment("CFO: Replaced " + instr);
          numChanges += 1;
          copy;
        }
      }
    } else {
      return instr;
    }
  }

}