package ic.tac;
import ic.ast._;

object TACPrettyString {
  def prettyTACInstr(instr: TacInstr): String = {
    instr match {
      case unInstr: TacUnInstr => {
        return prettyTACOperand(unInstr.dest) + " = " +
          prettyUnop(unInstr.op) + prettyTACOperand(unInstr.src) +
          formatComment(unInstr.comment);
      }
      case binInstr: TacBinInstr => {
        return prettyTACOperand(binInstr.dest) + " = " +
          prettyTACOperand(binInstr.left) + " " + prettyBinop(binInstr.op) + " " + prettyTACOperand(binInstr.right) +
          formatComment(binInstr.comment);
      }
      case copyInstr: TacCopy => {
        return prettyTACOperand(copyInstr.dest) + " = " + prettyTACOperand(copyInstr.src) +
          formatComment(copyInstr.comment);
      }
      case arrayLoad: TacArrayLoad => {
        return prettyTACOperand(arrayLoad.dest) + " = " +
          prettyTACOperand(arrayLoad.array) + "[" + prettyTACOperand(arrayLoad.index) + "]" +
          formatComment(arrayLoad.comment);
      }
      case arrayStore: TacArrayStore => {
        return prettyTACOperand(arrayStore.array) + "[" + prettyTACOperand(arrayStore.index) + "] = " +
          prettyTACOperand(arrayStore.src) +
          formatComment(arrayStore.comment);
      }
      case arrayCreation: TacArrayCreation => {
        return prettyTACOperand(arrayCreation.dest) + " = new [" + prettyTACOperand(arrayCreation.size) + "]" +
          formatComment(arrayCreation.comment);
      }
      case lengthLoad: TacLengthLoad => {
        return prettyTACOperand(lengthLoad.dest) + "= " + prettyTACOperand(lengthLoad.array) + ".length" +
          formatComment(lengthLoad.comment);
      }
      case fieldLoad: TacFieldLoad => {
        return prettyTACOperand(fieldLoad.dest) + " = " +
          prettyTACOperand(fieldLoad.fieldObj) + "." + fieldLoad.fieldDecl.id +
          formatComment(fieldLoad.comment);
      }
      case fieldStore: TacFieldStore => {
        return prettyTACOperand(fieldStore.fieldObj) + "." + fieldStore.fieldDecl.id + " = " +
          prettyTACOperand(fieldStore.src) +
          formatComment(fieldStore.comment);
      }
      case label: TacLabel => {
        return "label " + label.name + formatComment(label.comment);
      }
      case jump: TacJump => {
        return "jump " + jump.name + formatComment(jump.comment);
      }
      case cjump: TacCJump => {
        return "cjump " + prettyTACOperand(cjump.condition) + " " + cjump.name + formatComment(cjump.comment);
      }
      case virtualCall: TacVirtualCall => {
        var str = "call " + prettyTACOperand(virtualCall.receiver) + "." + virtualCall.function.id + "(";
        str += commaSeparated(virtualCall.params);
        str += ")" + formatComment(virtualCall.comment);
        return str;
      }
      case libCall: TacLibCall => {
        var str = "call Library." + libCall.function + "(";
        str += commaSeparated(libCall.params);
        str += ")" + formatComment(libCall.comment);
        return str;
      }
      case virtualResult: TacVirtualCallResult => {
        var str = prettyTACOperand(virtualResult.dest) + " = call " +
          prettyTACOperand(virtualResult.receiver) + "." + virtualResult.function.id + "(";
        str += commaSeparated(virtualResult.params);
        str += ")" + formatComment(virtualResult.comment);
        return str;
      }
      case libResult: TacLibCallResult => {
        var str = prettyTACOperand(libResult.dest) + " = call " +
          "Library." + libResult.function + "(";
        str += commaSeparated(libResult.params);
        str += ")" + formatComment(libResult.comment);
        return str;
      }
      case newObject: TacNewObject => {
        return prettyTACOperand(newObject.dest) + " = new " + newObject.classDecl.classId + "()" +
          formatComment(newObject.comment);
      }
      case returnVoid: TacReturn => {
        return "return" + formatComment(returnVoid.comment);
      }
      case returnValue: TacReturnValue => {
        return "return " + prettyTACOperand(returnValue.src) + formatComment(returnValue.comment);
      }
      case nullCheck: TacNullCheck => {
        return "Null check: " + prettyTACOperand(nullCheck.src) + " != Null" + formatComment(nullCheck.comment);
      }
      case boundsCheck: TacBoundsCheck => {
        return "Bounds check: " + " 0 <= " + prettyTACOperand(boundsCheck.src) + " < " +
          prettyTACOperand(boundsCheck.array) + ".length" +
          formatComment(boundsCheck.comment);
      }
      case sizeCheck: TacSizeCheck => {
        return "Size check: " + prettyTACOperand(sizeCheck.src) + " >= 0" + "\t\t\t" + formatComment(sizeCheck.comment);
      }
      case zeroCheck: TacZeroCheck => {
        return "Zero check: " + prettyTACOperand(zeroCheck.src) + " != 0" + formatComment(zeroCheck.comment);
      }
      case comment: TacComment => {
        return "### " + comment.id;
      }
    }
    return instr.toString();
  }

  def prettyTACOperand(operand: TacOperand): String = {
    operand match {
      case tempVar: TempVar => {
        return tempVar.id;
      }
      case programVar: TacLocal => {
        return programVar.vDecl.id;
      }
      case thisVar: TacThis => {
        return "this";
      }
      case intConst: TacInt => {
        return intConst.value.toString();
      }
      case stringConst: TacString => {
        if (stringConst.isLiteral) {
          return "\"" + stringConst.value + "\"";
        }
        return stringConst.value;
      }
      case boolConst: TacBool => {
        return boolConst.value.toString();
      }
      case nullConst: TacNull => {
        return "Null";
      }
      case nac: TacNac => {
        return "Not_A_Constant";
      }
    }
  }

  def prettyBinop(op: Binop): String = {
    op match {
      case plus: Plus => {
        return "+";
      }
      case minus: Minus => {
        return "-";
      }
      case mult: Mult => {
        return "*";
      }
      case div: Div => {
        return "/";
      }
      case mod: Mod => {
        return "%";
      }
      case and: And => {
        return "&&";
      }
      case or: Or => {
        return "||";
      }
      case less: Less => {
        return "<";
      }
      case lesseq: LessEq => {
        return "<=";
      }
      case greater: Greater => {
        return ">";
      }
      case greatereq: GreaterEq => {
        return ">=";
      }
      case equal: Equal => {
        return "==";
      }
      case neq: NotEqual => {
        return "!=";
      }
    }
  }

  def prettyUnop(op: Unop): String = {
    op match {
      case not: Not => {
        return "!";
      }
      case negative: Negative => {
        return "-";
      }
    }
  }

  def commaSeparated(ops: List[TacOperand]): String = {
    var str = "";
    if (ops.length == 0) {
      return str;
    }

    for (op <- ops) {
      str += prettyTACOperand(op) + ", ";
    }
    str = str.substring(0, str.length - 2);

    return str;
  }

  def formatComment(comment: String): String = {
    if (comment == "") {
      return "";
    } else {
      return "\t\t\t" + comment;
    }
  }
}
