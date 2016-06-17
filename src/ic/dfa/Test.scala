package ic.dfa;

import ic.cfg.ControlFlowGraph
import ic.tac._;

object Test {
  def main(s: Array[String]) = {
    ic.Util.debug = true;
    val cfg = new ControlFlowGraph();
    val enter = new TacComment("enter")
    val enterBlock = cfg.newBlock(enter);
    cfg.setEnter(enterBlock);
    val exit = new TacComment("exit")
    val exitBlock = cfg.newBlock(exit);
    cfg.setExit(exitBlock);
    val t1 = cfg.newBlock(new TacComment("t1"));
    val t2 = cfg.newBlock(new TacComment("t2"));
    val t4 = cfg.newBlock(new TacComment("t4"));
    val t3 = cfg.newBlock(new TacComment("t3"));
    enterBlock.addEdge(t3);
    t3.addEdge(t2);
    // t3.addEdge(t4);
    t2.addEdge(t1);
    t4.addEdge(t1);
    t1.addEdge(exitBlock);
    cfg.dotToFile("a.dot");
    val d = new ReachableAnalysis(cfg);
    d.solve();
    println(d);
  }
}

