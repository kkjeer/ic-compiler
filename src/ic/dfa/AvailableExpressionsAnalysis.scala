package ic.dfa;

import ic.cfg.ControlFlowGraph;
import ic.tac._;
import ic.ast._;
import scala.collection.mutable.Map;

class AvailableExpressionsAnalysis(override val cfg: ControlFlowGraph) extends DataFlowAnalysis[Map[TacExpr, List[TacInstr]]](cfg) {

  //Out[B] = all expressions
  def top() = cfg.getExprs();

  //Out[Enter] = empty map
  def boundary() = Map[TacExpr, List[TacInstr]]();

  //available expression analysis goes forward
  def isForward() = true;

  def equals(t1: Map[TacExpr, List[TacInstr]], t2: Map[TacExpr, List[TacInstr]]): Boolean = {
    return t1 == t2;
  }

  //meet operator: intersection
  def meet(t1: Map[TacExpr, List[TacInstr]], t2: Map[TacExpr, List[TacInstr]]): Map[TacExpr, List[TacInstr]] = {
    return intersect(t1, t2);
  }

  //transfer: Out[B] = eGen Union (In[B] - eKill), where t == In[B]
  def transfer(instr: TacInstr, t: Map[TacExpr, List[TacInstr]]): Map[TacExpr, List[TacInstr]] = {
    var eGen = Map[TacExpr, List[TacInstr]]();
    var eKill = List[TacOperand]();
    var fieldsKill = List[FieldDecl]();

    instr match {
      case unInstr: TacUnInstr => {
        eKill :+= unInstr.dest;
        var e = TacUnExpr(unInstr.op, unInstr.src);
        if (!(eGen contains e)) {
          eGen(e) = List[TacInstr]();
        }
        eGen(e) :+= unInstr;
      }
      case binInstr: TacBinInstr => {
        eKill :+= binInstr.dest;
        var e = new TacBinExpr(binInstr.left, binInstr.op, binInstr.right);
        if (!(eGen contains e)) {
          eGen(e) = List[TacInstr]();
        }
        eGen(e) :+= binInstr;
      }
      case copy: TacCopy => {
        eKill :+= copy.dest;
      }
      case arrayLoad: TacArrayLoad => {
        eKill :+= arrayLoad.dest;
        var e = new TacArrayExpr(arrayLoad.array, arrayLoad.index);
        if (!(eGen contains e)) {
          eGen(e) = List[TacInstr]();
        }
        eGen(e) :+= arrayLoad;
      }
      case arrayStore: TacArrayStore => {
        eKill :+= arrayStore.array;
        var e = new TacArrayExpr(arrayStore.array, arrayStore.index);
        if (!(eGen contains e)) {
          eGen(e) = List[TacInstr]();
        }
        eGen(e) :+= arrayStore;
      }
      case arrayCreate: TacArrayCreation => {
        eKill :+= arrayCreate.dest;
      }
      case arrayLength: TacLengthLoad => {
        eKill :+= arrayLength.dest;
        var e = new TacLengthExpr(arrayLength.array);
        if (!(eGen contains e)) {
          eGen(e) = List[TacInstr]();
        }
        eGen(e) :+= arrayLength;
      }
      case fieldLoad: TacFieldLoad => {
        fieldsKill :+= fieldLoad.fieldDecl;
        var e = new TacFieldExpr(fieldLoad.fieldObj, fieldLoad.fieldDecl);
        if (!(eGen contains e)) {
          eGen(e) = List[TacInstr]();
        }
        eGen(e) :+= fieldLoad;
      }
      case fieldStore: TacFieldStore => {
        fieldsKill :+= fieldStore.fieldDecl;
        var e = new TacFieldExpr(fieldStore.fieldObj, fieldStore.fieldDecl);
        if (!(eGen contains e)) {
          eGen(e) = List[TacInstr]();
        }
        eGen(e) :+= fieldStore;
      }
      case virtualCall: TacVirtualCall => {
        eKill :+= virtualCall.receiver;
        for (param <- virtualCall.params) {
          eKill :+= param;
        }
      }
      case libCall: TacLibCall => {
        for (param <- libCall.params) {
          eKill :+= param;
        }
      }
      case virtualResult: TacVirtualCallResult => {
        eKill :+= virtualResult.dest;
        eKill :+= virtualResult.receiver;
        for (param <- virtualResult.params) {
          eKill :+= param;
        }
      }
      case libResult: TacLibCallResult => {
        eKill :+= libResult.dest;
        for (param <- libResult.params) {
          eKill :+= param;
        }
      }
      case newObject: TacNewObject => {
        eKill :+= newObject.dest;
      }
      case nullCheck: TacNullCheck => {
        var e = new TacNullCheckExpr(nullCheck.src);
        if (!(eGen contains e)) {
          eGen(e) = List[TacInstr]();
        }
        eGen(e) :+= nullCheck;
      }
      case boundsCheck: TacBoundsCheck => {
        var e = new TacBoundsCheckExpr(boundsCheck.src, boundsCheck.array);
        if (!(eGen contains e)) {
          eGen(e) = List[TacInstr]();
        }
        eGen(e) :+= boundsCheck;
      }
      case sizeCheck: TacSizeCheck => {
        var e = new TacSizeCheckExpr(sizeCheck.src);
        if (!(eGen contains e)) {
          eGen(e) = List[TacInstr]();
        }
        eGen(e) :+= sizeCheck;
      }
      case zeroCheck: TacZeroCheck => {
        var e = new TacZeroCheckExpr(zeroCheck.src);
        if (!(eGen contains e)) {
          eGen(e) = List[TacInstr]();
        }
        eGen(e) :+= zeroCheck;
      }
      case _ => {}
    }

    var inMinusKill = subtractKill(t, eKill, fieldsKill);
    var outB = union(eGen, inMinusKill);

    return outB;
  }

  def intersect(t1: Map[TacExpr, List[TacInstr]], t2: Map[TacExpr, List[TacInstr]]): Map[TacExpr, List[TacInstr]] = {
    var result = Map[TacExpr, List[TacInstr]]();

    for (expr <- t1.keys) {
      if (t2 contains expr) {
        var instrs1 = t1(expr);
        var instrs2 = t2(expr);
        result(expr) = unionLists(instrs1, instrs2);
      }
    }

    return result;
  }

  def union(t1: Map[TacExpr, List[TacInstr]], t2: Map[TacExpr, List[TacInstr]]): Map[TacExpr, List[TacInstr]] = {
    var result = Map[TacExpr, List[TacInstr]]();

    for (expr1 <- t1.keys) {
      result(expr1) = t1(expr1);
    }

    for (expr2 <- t2.keys) {
      if (result contains expr2) {
        result(expr2) = unionLists(result(expr2), t2(expr2));
      } else {
        result(expr2) = t2(expr2);
      }
    }

    return result;
  }

  def unionLists(t1: List[TacInstr], t2: List[TacInstr]): List[TacInstr] = {
    var result = Set[TacInstr]();

    for (instr1 <- t1) {
      result += instr1;
    }
    for (instr2 <- t2) {
      result += instr2;
    }

    return result.toList;
  }

  def subtractKill(m: Map[TacExpr, List[TacInstr]], kill: List[TacOperand], fieldsKill: List[FieldDecl]): Map[TacExpr, List[TacInstr]] = {
    var exprsToKill = List[TacExpr]();

    for (expr <- m.keys) {
      for (operand <- kill) {
        expr match {
          case unExpr: TacUnExpr => {
            if (unExpr.src == operand) {
              exprsToKill :+= unExpr;
            }
          }
          case binExpr: TacBinExpr => {
            if (binExpr.left == operand || binExpr.right == operand) {
              exprsToKill :+= binExpr;
            }
          }
          case arrayExpr: TacArrayExpr => {
            if (arrayExpr.array == operand || arrayExpr.index == operand) {
              exprsToKill :+= arrayExpr;
            }
          }
          case lengthExpr: TacLengthExpr => {
            if (lengthExpr.array == operand) {
              exprsToKill :+= lengthExpr;
            }
          }
          case fieldExpr: TacFieldExpr => {
            if (fieldExpr.fieldObj == operand) {
              exprsToKill :+= fieldExpr;
            }
          }
          case nullExpr: TacNullCheckExpr => {
            if (nullExpr.src == operand) {
              exprsToKill :+= nullExpr;
            }
          }
          case boundsExpr: TacBoundsCheckExpr => {
            if (boundsExpr.src == operand || boundsExpr.array == operand) {
              exprsToKill :+= boundsExpr;
            }
          }
          case sizeExpr: TacSizeCheckExpr => {
            if (sizeExpr.src == operand) {
              exprsToKill :+= sizeExpr;
            }
          }
          case zeroExpr: TacZeroCheckExpr => {
            if (zeroExpr.src == operand) {
              exprsToKill :+= zeroExpr;
            }
          }
          case _ => {}
        }
      }
      for (field <- fieldsKill) {
        expr match {
          case fieldExpr: TacFieldExpr => {
            if (fieldExpr.fieldDecl.id == field.id) {
              exprsToKill :+= fieldExpr;
            }
          }
          case _ => {}
        }
      }
    }

    return m -- exprsToKill;
  }

}