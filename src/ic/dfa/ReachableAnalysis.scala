package ic.dfa;

import ic.cfg.ControlFlowGraph;
import ic.tac._;

/**
 * A simple analysis to determine whether there are
 * unreachable statements in a program.  That is it,
 * determines whether there is a path from the entry to
 * each program point.  For example:
 * <pre>
 * void main(string[] a) {
 *   boolean b;
 *   int y,z;
 *   if (b) {
 *      return;
 *      z = z + 1;  // NOT REACHABLE
 *   }
 *   y = y + 1;
 * }
 * </pre>
 * In this code, the assignment following the return is not reachable.
 * The analysis is defined as follows:
 * <pre>
 *   D  : forward
 *   V  : { true, false }  where true < false.
 *   Top: false.
 *   /\ : boolean ||
 *   f  : f_I(s) = s for all instructions I
 *   boundary:  OUT[in] = true
 * </pre>
 * After dataflow analysis, unreachable blocks will have IN[b] == false.
 */
class ReachableAnalysis(override val cfg: ControlFlowGraph) extends DataFlowAnalysis[Boolean](cfg) {

  def boundary() = true;
  def top() = false;
  def equals(t1: Boolean, t2: Boolean): Boolean = (t1 == t2);
  def isForward() = true;
  def meet(t1: Boolean, t2: Boolean): Boolean = t1 || t2;
  def transfer(instr: TacInstr, t: Boolean) = t;

}

/*
 * A very simple test of the cfg and dfa packages.
 * This program builds a small graph, generates the dot
 * file for it, and then runs the reachability analysis.
 * Block t4 should be unreachable.
 */
object ReachableAnalysis {
  def main(s: Array[String]) = {

    ic.Util.debug = true; // equivalent to -d on the command line for ic

    val cfg = new ControlFlowGraph();

    val enterBlock = cfg.newBlock(TacComment("enter"));
    val exitBlock = cfg.newBlock(TacComment("exit"));
    val t1 = cfg.newBlock(TacComment("t1"));
    val t2 = cfg.newBlock(TacComment("t2"));
    val t3 = cfg.newBlock(TacComment("t3"));
    val t4 = cfg.newBlock(TacComment("t4"));

    cfg.setEnter(enterBlock);
    cfg.setExit(exitBlock);

    enterBlock.addEdge(t3);
    t3.addEdge(t2);
    t2.addEdge(t1);
    t4.addEdge(t1);
    t1.addEdge(exitBlock);

    cfg.dotToFile("orig.dot");

    val d = new ReachableAnalysis(cfg);
    d.solve();
    println(d);
  }
}
