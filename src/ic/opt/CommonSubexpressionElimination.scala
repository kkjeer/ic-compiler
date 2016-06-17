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
class CommonSubexpressionElimination extends Optimization {
  var printDFA = false;

  def setPrintDFA(flag: Boolean) = {
    printDFA = flag;
  }

  override def optimize(md: MethodDecl): Int = {
    var cfg = md.tacList.toCFG();
    var avail = new AvailableExpressionsAnalysis(cfg);
    avail.solve();
    if (printDFA) {
      println("***AVAILABLE EXPRESSIONS ANALYSIS (COMMOM SUBEXPRESSION ELIMINATION)***");
      println(avail);
    }

    var optimized = ListBuffer[TacInstr]();

    for (instr <- md.tacList.tacInstructions) {
      instr match {
        case unInstr: TacUnInstr => {
          var e = new TacUnExpr(unInstr.op, unInstr.src);
          handleExpr(unInstr, e, optimized, avail, cfg, md.tacList);
        }
        case binInstr: TacBinInstr => {
          var e = new TacBinExpr(binInstr.left, binInstr.op, binInstr.right);
          handleExpr(binInstr, e, optimized, avail, cfg, md.tacList);
        }
        case arrayLoad: TacArrayLoad => {
          var e = new TacArrayExpr(arrayLoad.array, arrayLoad.index);
          handleExpr(arrayLoad, e, optimized, avail, cfg, md.tacList);
        }
        case arrayStore: TacArrayStore => {
          var e = new TacArrayExpr(arrayStore.array, arrayStore.index);
          handleExpr(arrayStore, e, optimized, avail, cfg, md.tacList);
        }
        case arrayLength: TacLengthLoad => {
          var e = new TacLengthExpr(arrayLength.array);
          handleExpr(arrayLength, e, optimized, avail, cfg, md.tacList);
        }
        case fieldLoad: TacFieldLoad => {
          var e = new TacFieldExpr(fieldLoad.fieldObj, fieldLoad.fieldDecl);
          handleExpr(fieldLoad, e, optimized, avail, cfg, md.tacList);
        }
        case fieldStore: TacFieldStore => {
          var e = new TacFieldExpr(fieldStore.fieldObj, fieldStore.fieldDecl);
          handleExpr(fieldStore, e, optimized, avail, cfg, md.tacList);
        }
        case nullCheck: TacNullCheck => {
          var e = new TacNullCheckExpr(nullCheck.src);
          handleRuntimeCheck(nullCheck, e, optimized, avail, cfg);
        }
        case boundsCheck: TacBoundsCheck => {
          var e = new TacBoundsCheckExpr(boundsCheck.src, boundsCheck.array);
          handleRuntimeCheck(boundsCheck, e, optimized, avail, cfg);
        }
        case sizeCheck: TacSizeCheck => {
          var e = new TacSizeCheckExpr(sizeCheck.src);
          handleRuntimeCheck(sizeCheck, e, optimized, avail, cfg);
        }
        case zeroCheck: TacZeroCheck => {
          var e = new TacZeroCheckExpr(zeroCheck.src);
          handleRuntimeCheck(zeroCheck, e, optimized, avail, cfg);
        }
        case _ => {
          optimized += instr;
        }
      }
    }

    var tacList = new TACList();
    tacList.setInstrs(optimized.toList);
    md.setTacList(tacList);

    return numChanges;
  }

  /**
   * Top-level method for updating the given list of optimized instructions.
   * If the given instruction computes an available expression,
   *  the list is handled based on whether the expression is made available from
   *  a single instruction or multiple instructions.
   */
  def handleExpr(instr: TacInstr, expr: TacExpr, optimized: ListBuffer[TacInstr], avail: AvailableExpressionsAnalysis, cfg: ControlFlowGraph, tacList: TACList) = {
    var map = avail.in(cfg.getBlock(instr));
    if (map contains expr) {
      var instrs = map(expr);
      Util.debug("instr: " + instr + " instrs: " + instrs);
      if (instrs.length == 0) {
        optimized += instr;
      } else if (instrs.length == 1) {
        handleSingleInstr(instr, instrs(0), optimized);
      } else {
        handleMultipleInstrs(instr, instrs, optimized, tacList);
      }
    } else {
      optimized += instr;
    }
  }

  /**
   * Updates the given list of optimized instructions,
   *  assuming the given instruction originalInstr computes an expression that is already available
   *  by the single instruction altInstr
   */
  def handleSingleInstr(originalInstr: TacInstr, altInstr: TacInstr, optimized: ListBuffer[TacInstr]) = {
    var originalDest = getInstrDest(originalInstr);
    var altDest = getInstrDest(altInstr);
    (originalDest, altDest) match {
      case (Some(oDest), Some(aDest)) => {
        var copy = new TacCopy(oDest, aDest);
        copy.setComment("CSE: Replaced " + originalInstr);
        optimized += copy;
        numChanges += 1;
      }
      case _ => {
        optimized += originalInstr;
      }
    }
  }

  /**
   * Updates the given list of optimized instructions,
   *  assuming the given originalInstr computes an expression that is already available
   *  by the each of the instructions in the list of altInstrs
   * Introduces a temporary variable and copies the available expression into it at each instruction in altInstrs
   */
  def handleMultipleInstrs(originalInstr: TacInstr, altInstrs: List[TacInstr], optimized: ListBuffer[TacInstr], tacList: TACList) = {
    //new copy instructions to add
    var copiesToAdd = Map[Int, TacInstr]();

    //generate a new temp var for the new copy instructions
    var temp = tacList.genTemp();

    //for each instruction that makes an expression available...
    for (alt <- altInstrs) {
      //find where the instruction occurs in the current optimized list
      for (i <- 0 to optimized.length - 1) {
        var instr = optimized(i);
        if (alt == instr) {
          //copy the destination of the instruction into the new temp var and save it to be added later
          //(don't add it to optimized right now, since we're iterating over optimized!)
          var instrDest = getInstrDest(instr).get;
          var copyTemp = new TacCopy(temp, instrDest);
          copyTemp.setComment("CSE: Added temp copy for " + instr);
          copiesToAdd(i + 1) = copyTemp;
          numChanges += 1;
        }
      }
    }

    //add all the new copy instructions to optimized
    for (key <- copiesToAdd.keys) {
      optimized.insertAll(key, List[TacInstr](copiesToAdd(key)));
    }

    //copy the temp var into the original destination and add that to optimized
    var originalDest = getInstrDest(originalInstr).get;
    var copy = new TacCopy(originalDest, temp);
    copy.setComment("CSE: Replaced " + originalInstr);
    optimized += copy;
    numChanges += 1;
  }

  /**
   * Updates the given list of optimized instructions
   *  by adding either a comment if the given runtime check instruction is already available,
   *  or the original instruction otherwise
   */
  def handleRuntimeCheck(instr: TacInstr, expr: TacExpr, optimized: ListBuffer[TacInstr], avail: AvailableExpressionsAnalysis, cfg: ControlFlowGraph) = {
    var map = avail.in(cfg.getBlock(instr));
    if (map contains expr) {
      var instrs = map(expr);
      if (instrs.length == 0) {
        optimized += instr;
      } else {
        optimized += new TacComment("CSE: Eliminated " + instr);
        numChanges += 1;
      }
    } else {
      optimized += instr;
    }
  }

  /**
   * Helper method: returns Some of the destination of the instruction, or None if no destination exists.
   * Note that, for the purposes of CSE, the source of array stores and field stores is effectively the destination.
   */
  def getInstrDest(instr: TacInstr): Option[TacVar] = {
    instr match {
      case unInstr: TacUnInstr => {
        return Some(unInstr.dest);
      }
      case binInstr: TacBinInstr => {
        return Some(binInstr.dest);
      }
      case copy: TacCopy => {
        return Some(copy.dest);
      }
      case arrayLoad: TacArrayLoad => {
        return Some(arrayLoad.dest);
      }
      case arrayStore: TacArrayStore => {
        arrayStore.src match {
          case tacVar: TacVar => {
            return Some(tacVar);
          }
          case _ => {
            return None;
          }
        }
      }
      case arrayLength: TacLengthLoad => {
        return Some(arrayLength.dest);
      }
      case arrayCreate: TacArrayCreation => {
        return Some(arrayCreate.dest);
      }
      case fieldLoad: TacFieldLoad => {
        return Some(fieldLoad.dest);
      }
      case fieldStore: TacFieldStore => {
        fieldStore.src match {
          case tacVar: TacVar => {
            return Some(tacVar);
          }
          case _ => {
            return None;
          }
        }
      }
      case virtualResult: TacVirtualCallResult => {
        return Some(virtualResult.dest);
      }
      case libResult: TacLibCallResult => {
        return Some(libResult.dest);
      }
      case newObject: TacNewObject => {
        return Some(newObject.dest);
      }
      case _ => {
        return None;
      }
    }
  }
}

