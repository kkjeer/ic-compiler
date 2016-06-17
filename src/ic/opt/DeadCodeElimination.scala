package ic.opt;

import ic.ast._;
import ic.dfa._;
import ic.cfg.ControlFlowGraph;
import ic.tac._;

/**
 * Removes dead code using Live Variable Analysis
 */
class DeadCodeElimination extends Optimization {
  var printDFA = false;

  def setPrintDFA(flag: Boolean) = {
    printDFA = flag;
  }

  /**
   * Apply the optimization to the method md.
   */
  override def optimize(md: MethodDecl): Int = {
    val cfg: ControlFlowGraph = md.tacList.toCFG();

    val live = new LiveVariableAnalysis(cfg);
    live.solve();
    if (printDFA) {
      println("***LIVE VARIABLE ANALYSIS (DEAD CODE ELIMINATION)***");
      println(live);
    }

    // Map each instruction to either the original instruction 
    // or a comment if it defines a variable that is not live.
    val optimized = md.getTacList().tacInstructions map
      (instr =>
        instr match {
          case unInstr: TacUnInstr => {
            instrOrDead(unInstr, unInstr.dest, live, cfg);
          }
          case binInstr: TacBinInstr => {
            instrOrDead(binInstr, binInstr.dest, live, cfg);
          }
          case copy: TacCopy => {
            instrOrDead(copy, copy.dest, live, cfg);
          }
          case arrayLoad: TacArrayLoad => {
            instrOrDead(arrayLoad, arrayLoad.dest, live, cfg);
          }
          case arrayCreate: TacArrayCreation => {
            instrOrDead(arrayCreate, arrayCreate.dest, live, cfg);
          }
          case arrayLength: TacLengthLoad => {
            instrOrDead(arrayLength, arrayLength.dest, live, cfg);
          }
          case fieldLoad: TacFieldLoad => {
            instrOrDead(fieldLoad, fieldLoad.dest, live, cfg);
          }
          //for virtual method calls: don't eliminate due to possible side effects
          case virtualResult: TacVirtualCallResult => {
            instr;
          }
          //do library calls have side effects?
          case libResult: TacLibCallResult => {
            //instrOrDead(libResult, libResult.dest, live, cfg);
            instr;
          }
          case newObject: TacNewObject => {
            instrOrDead(newObject, newObject.dest, live, cfg);
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
   * Returns a comment instruction if the given instruction defines a dead variable,
   * or the original instruction otherwise.
   */
  def instrOrDead(instr: TacInstr, dest: TacOperand, live: LiveVariableAnalysis, cfg: ControlFlowGraph): TacInstr = {
    dest match {
      case defVar: TacVar => {
        if (!live.out(cfg.getBlock(instr)).contains(defVar)) {
          numChanges += 1;
          new TacComment("DCE: Removed dead code: " + instr);
        } else {
          instr;
        }
      }
      case _ => {
        instr;
      }
    }
  }

}