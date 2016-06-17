package ic.dfa;

import ic.cfg.ControlFlowGraph;
import ic.tac._;

class LiveVariableAnalysis(override val cfg: ControlFlowGraph) extends DataFlowAnalysis[List[TacVar]](cfg) {

  //In[Exit] = empty list
  def boundary() = List[TacVar]();
  def top() = List[TacVar]();

  def equals(t1: List[TacVar], t2: List[TacVar]): Boolean = {
    return t1 == t2;
  }

  //live variable analysis goes backward
  def isForward() = false;

  //meet operator: union
  def meet(t1: List[TacVar], t2: List[TacVar]): List[TacVar] = {
    return union(t1, t2);
  }

  //transfer: In[B] = useB Union (Out[B] - defB), where Out[B] == t
  def transfer(instr: TacInstr, t: List[TacVar]): List[TacVar] = {
    var useB = List[TacVar]();
    var defB = List[TacVar]();

    instr match {
      //unary instructions
      case unInstr: TacUnInstr => {
        unInstr.dest match {
          case defVar: TacVar => {
            defB :+= defVar;
          }
          case _ => {}
        }
        unInstr.src match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //binary instructions
      case binInstr: TacBinInstr => {
        binInstr.dest match {
          case defVar: TacVar => {
            defB :+= defVar;
          }
          case _ => {}
        }
        binInstr.left match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
        binInstr.right match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //copy
      case copy: TacCopy => {
        copy.dest match {
          case defVar: TacVar => {
            defB :+= defVar;
          }
          case _ => {}
        }
        copy.src match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //array load
      case arrayLoad: TacArrayLoad => {
        arrayLoad.dest match {
          case defVar: TacVar => {
            defB :+= defVar;
          }
          case _ => {}
        }
        arrayLoad.array match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
        arrayLoad.index match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //array store
      case arrayStore: TacArrayStore => {
        arrayStore.array match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
        arrayStore.index match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
        arrayStore.src match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //new array
      case arrayCreate: TacArrayCreation => {
        arrayCreate.dest match {
          case defVar: TacVar => {
            defB :+= defVar;
          }
          case _ => {}
        }
        arrayCreate.size match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //array.length
      case arrayLength: TacLengthLoad => {
        arrayLength.dest match {
          case defVar: TacVar => {
            defB :+= defVar;
          }
          case _ => {}
        }
        arrayLength.array match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //field load
      case fieldLoad: TacFieldLoad => {
        fieldLoad.dest match {
          case defVar: TacVar => {
            defB :+= defVar;
          }
          case _ => {}
        }
        fieldLoad.fieldObj match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //field store
      case fieldStore: TacFieldStore => {
        fieldStore.fieldObj match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
        fieldStore.src match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //cjump
      case cJump: TacCJump => {
        cJump.condition match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //virtual call (no result)
      case virtualCall: TacVirtualCall => {
        virtualCall.receiver match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
        for (param <- virtualCall.params) {
          param match {
            case useVar: TacVar => {
              useB :+= useVar;
            }
            case _ => {}
          }
        }
      }
      //library call (no result) {
      case libCall: TacLibCall => {
        for (param <- libCall.params) {
          param match {
            case useVar: TacVar => {
              useB :+= useVar;
            }
            case _ => {}
          }
        }
      }
      //virtual call with result
      case virtualResult: TacVirtualCallResult => {
        virtualResult.dest match {
          case defVar: TacVar => {
            defB :+= defVar;
          }
          case _ => {}
        }
        virtualResult.receiver match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
        for (param <- virtualResult.params) {
          param match {
            case useVar: TacVar => {
              useB :+= useVar;
            }
            case _ => {}
          }
        }
      }
      //library call with result
      case libResult: TacLibCallResult => {
        libResult.dest match {
          case defVar: TacVar => {
            defB :+= defVar;
          }
          case _ => {}
        }
        for (param <- libResult.params) {
          param match {
            case useVar: TacVar => {
              useB :+= useVar;
            }
            case _ => {}
          }
        }
      }
      //object creation
      case objCreate: TacNewObject => {
        objCreate.dest match {
          case defVar: TacVar => {
            defB :+= defVar;
          }
          case _ => {}
        }
      }
      //return value
      case retVal: TacReturnValue => {
        retVal.src match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //null check
      case nullCheck: TacNullCheck => {
        nullCheck.src match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //bounds check
      case boundsCheck: TacBoundsCheck => {
        boundsCheck.src match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
        boundsCheck.array match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //size check
      case sizeCheck: TacSizeCheck => {
        sizeCheck.src match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      //zero check
      case zeroCheck: TacZeroCheck => {
        zeroCheck.src match {
          case useVar: TacVar => {
            useB :+= useVar;
          }
          case _ => {}
        }
      }
      case _ => {

      }
    }

    //    println("Instruction: " + instr);
    //    println("out: " + t);
    //    println("def: " + defB);
    //    println("use: " + useB);

    var outMinusDef = subtract(t, defB);
    //println("outMinusDef: " + outMinusDef);

    var inB = union(useB, outMinusDef);
    //println("inB: " + inB);

    return inB;
  }

  def union(t1: List[TacVar], t2: List[TacVar]): List[TacVar] = {
    var result = Set[TacVar]();

    for (var1 <- t1) {
      result += var1;
    }
    for (var2 <- t2) {
      result += var2;
    }

    return result.toList;
  }

  def subtract(t1: List[TacVar], t2: List[TacVar]): List[TacVar] = {
    var result = Set[TacVar]();

    for (var1 <- t1) {
      if (!t2.contains(var1)) {
        result += var1;
      }
    }

    return result.toList;
  }

}