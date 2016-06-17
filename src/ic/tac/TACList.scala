package ic.tac;
import ic.ast._;
import ic.cfg._;

class TACList() {
  var tacInstructions = List[TacInstr]();
  var temps = List[TempVar]();

  var frameSize = 0;
  
  var methodName = "";
  var lastTemp = 0;
  var lastOr = 0;
  var lastAnd = 0;
  var lastIfEnd = 0;
  var lastElse = 0;
  var lastWhileStart = 0;
  var lastWhileEnd = 0;
  
  def setMethodName (mName: String) = {
    methodName = mName;
  }

  def addInstr(instr: TacInstr) = {
    tacInstructions :+= instr;
  }

  def getInstr(index: Int): TacInstr = {
    return tacInstructions(index);
  }

  def setInstrs(instrs: List[TacInstr]) = {
    tacInstructions = instrs;
    if (tacInstructions.length < 1) {
      addInstr(new TacComment("WARNING: Empty method"));
    }
  }

  def genTemp(): TempVar = {
    var temp = new TempVar("t" + lastTemp);
    lastTemp += 1;
    temps :+= temp;
    return temp;
  }

  def genOrLabel(): TacLabel = {
    var label = new TacLabel("_endOr" + methodName + lastOr);
    lastOr += 1;
    return label;
  }

  def genAndLabel(): TacLabel = {
    var label = new TacLabel("_endAnd" + methodName + lastAnd);
    lastAnd += 1;
    return label;
  }

  def genIfLabel(): TacLabel = {
    var label = new TacLabel("_endIf" + methodName + lastIfEnd);
    lastIfEnd += 1;
    return label;
  }

  def genElseLabel(): TacLabel = {
    var label = new TacLabel("_else" + methodName + lastElse);
    lastElse += 1;
    return label;
  }

  def genWhileStartLabel(): TacLabel = {
    var label = new TacLabel("_beginWhile" + methodName + lastWhileStart);
    lastWhileStart += 1;
    return label;
  }

  def genWhileEndLabel(): TacLabel = {
    var label = new TacLabel("_endWhile" + methodName + lastWhileEnd);
    lastWhileEnd += 1;
    return label;
  }

  def getCopies(): List[TacCopy] = {
    var copies = List[TacCopy]();

    for (instr <- tacInstructions) {
      instr match {
        case copy: TacCopy => {
          copies :+= copy;
        }
        case _ => {}
      }
    }

    return copies;
  }

  def toCFG(): ControlFlowGraph = {
    var cfg = new ControlFlowGraph();
    
    var enter = new TacComment("Enter");
    var enterBlock = cfg.newBlock(enter);
    cfg.setEnter(enterBlock);
    
    if (tacInstructions.length < 1) {
      return cfg;
    }

    for (i <- 0 to tacInstructions.length - 1) {
      var instr = tacInstructions(i);
      cfg.newBlock(instr);
    }

    var exit = new TacComment("Exit");
    var exitBlock = cfg.newBlock(exit);
    cfg.setExit(exitBlock);

    enterBlock.addEdge(cfg.getBlock(tacInstructions(0)));

    for (i <- 0 to tacInstructions.length - 1) {
      var instr = tacInstructions(i);
      instr match {
        case jump: TacJump => {
          var currentBlock = cfg.getBlock(jump);
          var labelInstr = getLabelInstr(jump.name);
          var labelBlock = cfg.getBlock(labelInstr);
          currentBlock.addEdge(labelBlock);
        }
        case cJump: TacCJump => {
          var currentBlock = cfg.getBlock(cJump);
          var labelInstr = getLabelInstr(cJump.name);
          var labelBlock = cfg.getBlock(labelInstr);
          currentBlock.addEdge(labelBlock);

          var nextInstr = tacInstructions(i + 1);
          var nextBlock = cfg.getBlock(nextInstr);
          currentBlock.addEdge(nextBlock);
        }
        case _ => {
          var currentBlock = cfg.getBlock(instr);
          if (i == tacInstructions.length - 1) {
            var exitBlock = cfg.getExit();
            currentBlock.addEdge(exitBlock);
          } else {
            var nextInstr = tacInstructions(i + 1);
            var nextBlock = cfg.getBlock(nextInstr);
            currentBlock.addEdge(nextBlock);
          }
        }
      }
    }

    return cfg;
  }

  def getLabelInstr(label: TacLabel): TacLabel = {
    tacInstructions.find(x => x == label) match {
      case Some(t@ TacLabel(_)) => t
    }
  }

  def tempsString(): String = {
    var str = "";

    for (temp <- temps) {
      str += temp.id + " offset: " + temp.offset + "\n";
    }

    return str;
  }

  override def toString(): String = {
    var str = "";

    for (instr <- tacInstructions) {
      str += TACPrettyString.prettyTACInstr(instr) + "\n";
    }

    return str;
  }
}
