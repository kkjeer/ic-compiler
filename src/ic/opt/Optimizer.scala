package ic.opt;

import ic.ast._;
import ic.dfa._;
import ic.cfg.ControlFlowGraph;
import ic.tac._;

object Optimizer {
  var maxIterations = 5;

  def optimizeProgram(p: Program, args: Array[String]) = {
    var dce = 0;
    var cfo = 0;
    var cse = 0;
    var cpp = 0;
    var opt = 0;
    var numPrints = 0;

    for (i <- 0 to args.length - 1) {
      var arg = args(i);
      arg match {
        case "-printIR" => {
          if (numPrints == 0) {
            println("***Unoptimized TAC***");
          }
          TACGenerator.printTAC(p);
          numPrints += 1;
        }
        case "-dce" => {
          var dceChanges = dceOpt(p, args);
          dce += 1;
          println("***After Dead Code Elimination (DCE) " + dce + ": " + dceChanges + " Changes***");
        }
        case "-cfo" => {
          var cfoChanges = cfoOpt(p, args);
          cfo += 1;
          println("***After Constant Folding (CFO) " + cfo + ": " + cfoChanges + " Changes***");
        }
        case "-cse" => {
          var cseChanges = cseOpt(p, args);
          cse += 1;
          println("***After Common Subexpression Elimination (CSE) " + cse + ": " + cseChanges + " Changes***");
        }
        case "-cpp" => {
          var cppChanges = cppOpt(p, args);
          cpp += 1;
          println("***After Copy Propogation (CPP) " + cpp + ": " + cppChanges + " Changes***");
        }
        case "-opt" => {
          var optChanges = allOpt(p, args);
          opt += 1;
          println("***After All Optimizations " + opt + ": " + optChanges + " Changes***");
        }
        case "-iter" => {
          totalOpt(p, args);
        }
        case _ => {}
      }
    }
  }

  //dead code elimination
  def dceOpt(p: Program, args: Array[String]): Int = {
    var deadCodeElim = new DeadCodeElimination();
    deadCodeElim.setPrintDFA(args contains "-printDFA");
    deadCodeElim.optimize(p);
  }

  //constant folding
  def cfoOpt(p: Program, args: Array[String]): Int = {
    var constFold = new ConstantFolding();
    constFold.setPrintDFA(args contains "-printDFA");
    constFold.optimize(p);
  }

  //common subexpression elimination
  def cseOpt(p: Program, args: Array[String]): Int = {
    var commonSubElim = new CommonSubexpressionElimination();
    commonSubElim.setPrintDFA(args contains "-printDFA");
    commonSubElim.optimize(p);
  }

  //copy propogation
  def cppOpt(p: Program, args: Array[String]): Int = {
    var copyPropogation = new CopyPropogation();
    copyPropogation.setPrintDFA(args contains "-printDFA");
    copyPropogation.optimize(p);
  }

  //all optimizations
  def allOpt(p: Program, args: Array[String]): Int = {
    var changes = 0;
    changes += dceOpt(p, args);
    changes += cfoOpt(p, args);
    changes += cseOpt(p, args);
    changes += cppOpt(p, args);
    return changes;
  }

  def totalOpt(p: Program, args: Array[String]): Int = {
    var changes = allOpt(p, args);
    var iterations = 0;
    var totalChanges = 0;

    while (changes > 0 && iterations < maxIterations) {
      changes = allOpt(p, args);
      iterations += 1;
      totalChanges += changes;
    }

    println("***After optimizing for " + iterations + " iterations: " + totalChanges + " Changes:***");
    return changes;
  }

}