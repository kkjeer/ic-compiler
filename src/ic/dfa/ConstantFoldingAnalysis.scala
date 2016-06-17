package ic.dfa;

import ic.cfg.ControlFlowGraph;
import ic.tac._;
import ic.ast._;
import scala.collection.mutable.Map;

class ConstantFoldingAnalysis(override val cfg: ControlFlowGraph) extends DataFlowAnalysis[Map[TacVar, TacLiteral]](cfg) {
  def top() = Map[TacVar, TacLiteral]();
  def boundary = Map[TacVar, TacLiteral]();

  def isForward() = true;

  def equals(t1: Map[TacVar, TacLiteral], t2: Map[TacVar, TacLiteral]): Boolean = {
    return t1 == t2;
  }

  def meet(t1: Map[TacVar, TacLiteral], t2: Map[TacVar, TacLiteral]): Map[TacVar, TacLiteral] = {
    var result = Map[TacVar, TacLiteral]();

    for (key1 <- t1.keys) {
      var literal1 = t1(key1);
      if (t2 contains key1) {
        var literal2 = t2(key1);
        (literal1, literal2) match {
          case (TacNac(), TacNac()) => {
            result(key1) = new TacNac();
          }
          case (TacNac(), _) => {
            result(key1) = new TacNac();
          }
          case (_, TacNac()) => {
            result(key1) = new TacNac();
          }
          case (TacInt(val1), TacInt(val2)) => {
            if (val1 == val2) {
              result(key1) = new TacInt(val1);
            } else {
              result(key1) = new TacNac();
            }
          }
          case (TacString(val1), TacString(val2)) => {
            if (val1 == val2) {
              result(key1) = new TacString(val1);
            } else {
              result(key1) = new TacNac();
            }
          }
          case (TacBool(val1), TacBool(val2)) => {
            if (val1 == val2) {
              result(key1) = new TacBool(val1);
            } else {
              result(key1) = new TacNac();
            }
          }
          case (TacNull(), TacNull()) => {
            result(key1) = new TacNull();
          }
        }
      } else {
        result(key1) = literal1;
      }
    }

    for (key2 <- t2.keys) {
      if (!(t1 contains key2)) {
        result(key2) = t2(key2);
      }
    }

    return result;
  }

  def transfer(instr: TacInstr, t: Map[TacVar, TacLiteral]): Map[TacVar, TacLiteral] = {
    var result = Map[TacVar, TacLiteral]();

    instr match {
      //unary instructions
      case unInstr: TacUnInstr => {
        unInstr.dest match {
          case tacVar: TacVar => {
            (unInstr.op, unInstr.src) match {
              case (Negative(_), TacInt(value)) => {
                result(tacVar) = new TacInt(-value);
              }
              case (Not(_), TacBool(value)) => {
                result(tacVar) = new TacBool(!value);
              }
              case (_, _) => {
                result(tacVar) = new TacNac();
              }
            }
          }
          case _ => {}
        }
      }
      //binary instructions
      case binInstr: TacBinInstr => {
        binInstr.dest match {
          case tacVar: TacVar => {
            (binInstr.left, binInstr.op, binInstr.right) match {
              case (TacInt(lVal), Plus(_), TacInt(rVal)) => {
                result(tacVar) = new TacInt(lVal + rVal);
              }
              case (TacInt(lVal), Minus(_), TacInt(rVal)) => {
                result(tacVar) = new TacInt(lVal - rVal);
              }
              case (TacInt(lVal), Mult(_), TacInt(rVal)) => {
                result(tacVar) = new TacInt(lVal * rVal);
              }
              case (TacInt(lVal), Div(_), TacInt(rVal)) => {
                result(tacVar) = new TacInt(lVal / rVal);
              }
              case (TacInt(lVal), Mod(_), TacInt(rVal)) => {
                result(tacVar) = new TacInt(lVal % rVal);
              }
              case (TacString(lVal), Plus(_), TacString(rVal)) => {
                result(tacVar) = new TacString(lVal + rVal);
              }
              case (TacInt(lVal), Greater(_), TacInt(rVal)) => {
                result(tacVar) = new TacBool(lVal > rVal);
              }
              case (TacInt(lVal), GreaterEq(_), TacInt(rVal)) => {
                result(tacVar) = new TacBool(lVal >= rVal);
              }
              case (TacInt(lVal), Less(_), TacInt(rVal)) => {
                result(tacVar) = new TacBool(lVal < rVal);
              }
              case (TacInt(lVal), LessEq(_), TacInt(rVal)) => {
                result(tacVar) = new TacBool(lVal <= rVal);
              }
              case (TacInt(lVal), Equal(_), TacInt(rVal)) => {
                result(tacVar) = new TacBool(lVal == rVal);
              }
              case (TacInt(lVal), NotEqual(_), TacInt(rVal)) => {
                result(tacVar) = new TacBool(lVal != rVal);
              }
              case (TacString(lVal), Equal(_), TacString(rVal)) => {
                result(tacVar) = new TacBool(lVal == rVal);
              }
              case (TacString(lVal), NotEqual(_), TacString(rVal)) => {
                result(tacVar) = new TacBool(lVal != rVal);
              }
              case (TacBool(lVal), Equal(_), TacBool(rVal)) => {
                result(tacVar) = new TacBool(lVal == rVal);
              }
              case (TacBool(lVal), NotEqual(_), TacBool(rVal)) => {
                result(tacVar) = new TacBool(lVal != rVal);
              }
              case (TacBool(lVal), And(_), TacBool(rVal)) => {
                result(tacVar) = new TacBool(lVal && rVal);
              }
              case (TacBool(lVal), Or(_), TacBool(rVal)) => {
                result(tacVar) = new TacBool(lVal || rVal);
              }
              case (_, _, _) => {
                result(tacVar) = new TacNac();
              }
            }
          }
          case _ => {}
        }
      }
      //copy instructions
      case copy: TacCopy => {
        copy.dest match {
          case tacVar: TacVar => {
            copy.src match {
              case literal: TacLiteral => {
                literal match {
                  case nac: TacNac => {
                    result(tacVar) = nac;
                  }
                  case _ => {
                    result(tacVar) = literal;
                  }
                }
              }
              case _ => {
                result(tacVar) = new TacNac();
              }
            }
          }
          case _ => {}
        }
      }
      //other instructions
      case _ => {}
    }

    return result;
  }
}