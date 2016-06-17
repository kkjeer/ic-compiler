package ic.opt;

import ic.ast._;
import ic.dfa._;
import ic.cfg.ControlFlowGraph;
import ic.tac._;

/**
 * Illustrates an Optimization that removes unreachable code.
 * This shows how to stage creating a CFG, performing analysis,
 * and then transforming the code based on the results.
 */
class UnReachableCodeElimination extends Optimization {

  /**
   * Apply the optimization to the method md.
   */
  def optimize(md: MethodDecl): Int = {
    val cfg: ControlFlowGraph = md.tacList.toCFG(); // TODO: fill me in.

    val reaches = new ReachableAnalysis(cfg);
    reaches.solve();

    // Map each instruction to either the original instruction 
    // or a comment if not reachable.  I could have filtered out the
    // dead code too, but it is easier to read and debug the
    // optimization if you leave comments in where you changed the code
    val optimized = md.getTacList().tacInstructions map
      (instr =>
        if (reaches.in(cfg.getBlock(instr))) {
          instr;
        } else {
          numChanges += 1;
          new TacComment("Removed dead code: " + instr);
        });

    var tacList = new TACList();
    tacList.setInstrs(optimized);
    md.setTacList(tacList);

    return numChanges;
  }

}