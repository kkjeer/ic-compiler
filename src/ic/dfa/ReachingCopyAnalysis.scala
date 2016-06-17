package ic.dfa;

import ic.cfg.ControlFlowGraph;
import ic.tac._;

class ReachingCopyAnalysis(override val cfg: ControlFlowGraph) extends DataFlowAnalysis[List[TacCopy]](cfg) {
  //Out[Enter] = all copies
  def top() = cfg.getCopies();
  def boundary() = List[TacCopy]();

  def equals(t1: List[TacCopy], t2: List[TacCopy]): Boolean = {
    return t1 == t2;
  }

  //reaching copy analysis goes forward
  def isForward() = true;

  //meet operator: intersection
  def meet(t1: List[TacCopy], t2: List[TacCopy]): List[TacCopy] = {
    return intersection(t1, t2);
  }

  //transfer: Out[B] = genB Union (In[B] - killB), where t == In[B]
  def transfer(instr: TacInstr, t: List[TacCopy]): List[TacCopy] = {
    var genB = List[TacCopy]();
    var killB = List[TacVar]();

    instr match {
      case copy: TacCopy => {
        killB :+= copy.dest;
        genB :+= copy;
      }
      case unInstr: TacUnInstr => {
        killB :+= unInstr.dest;
      }
      case binInstr: TacBinInstr => {
        killB :+= binInstr.dest;
      }
      case arrayLoad: TacArrayLoad => {
        killB :+= arrayLoad.dest;
      }
      case arrayCreate: TacArrayCreation => {
        killB :+= arrayCreate.dest;
      }
      case arrayLength: TacLengthLoad => {
        killB :+= arrayLength.dest;
      }
      case fieldLoad: TacFieldLoad => {
        killB :+= fieldLoad.dest;
      }
      case virtualResult: TacVirtualCallResult => {
        killB :+= virtualResult.dest;
      }
      case libResult: TacLibCallResult => {
        killB :+= libResult.dest;
      }
      case newObject: TacNewObject => {
        killB :+= newObject.dest;
      }
      case _ => {}
    }

    var inMinusKill = subtract(t, killB);
    var outB = union(genB, inMinusKill);
    return outB;
  }

  def intersection(t1: List[TacCopy], t2: List[TacCopy]): List[TacCopy] = {
    var result = Set[TacCopy]();

    for (copy1 <- t1) {
      if (t2 contains copy1) {
        result += copy1;
      }
    }

    return result.toList;
  }

  def union(t1: List[TacCopy], t2: List[TacCopy]): List[TacCopy] = {
    var result = Set[TacCopy]();

    for (copy1 <- t1) {
      result += copy1;
    }
    for (copy2 <- t2) {
      result += copy2;
    }

    return result.toList;
  }

  def subtract(t1: List[TacCopy], t2: List[TacVar]): List[TacCopy] = {
    var result = Set[TacCopy]();

    for (copy1 <- t1) {
      copy1.dest match {
        case tacVar: TacVar => {
          if (!(t2 contains tacVar)) {
            result += copy1;
          }
        }
      }
    }

    return result.toList;
  }

}