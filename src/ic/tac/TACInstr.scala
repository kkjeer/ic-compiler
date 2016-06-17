package ic.tac;
import ic.ast._;

//The TAC instruction set is documented in writeup/TAC Instruction Set.md

/*Instructions*/

abstract class TacInstr {
  var astNode = None: Option[ic.ast.ASTNode];
  var comment = "": String;

  def setASTNode(node: ic.ast.ASTNode) {
    astNode = Some(node);
  }

  def setComment(newComment: String) {
    comment = newComment;
    if (comment.charAt(0) != '#') {
      comment = "#" + comment;
    }
  }

  override def toString(): String = {
    return TACPrettyString.prettyTACInstr(this);
  }
}

//all instructions extend TacInstr

/*Logic/Arithmetic*/

//dest = op src
case class TacUnInstr(dest: TacVar, op: ic.ast.Unop, src: TacOperand) extends TacInstr;

//dest = left op right
case class TacBinInstr(dest: TacVar, left: TacOperand, op: ic.ast.Binop, right: TacOperand) extends TacInstr;

/*Copy*/

//dest = src
case class TacCopy(dest: TacVar, src: TacOperand) extends TacInstr;

/*Arrays*/

//dest = array[index]
case class TacArrayLoad(dest: TacVar, array: TacOperand, index: TacOperand) extends TacInstr;

//array[index] = src
case class TacArrayStore(array: TacOperand, index: TacOperand, src: TacOperand) extends TacInstr;

//dest = new T[size]
case class TacArrayCreation(dest: TacVar, size: TacOperand) extends TacInstr;

//dest = array.length
case class TacLengthLoad(dest: TacVar, array: TacOperand) extends TacInstr;

/*Fields*/

//dest = fieldObj.fieldDecl
case class TacFieldLoad(dest: TacVar, fieldObj: TacOperand, fieldDecl: ic.ast.FieldDecl) extends TacInstr;

//fieldObj.fieldDecl = src
case class TacFieldStore(fieldObj: TacOperand, fieldDecl: ic.ast.FieldDecl, src: TacOperand) extends TacInstr;

/*Labels and Branches (Jumps)*/

//label name (create a new label named name)
case class TacLabel(name: String) extends TacInstr;

//jump name (jump to label name)
case class TacJump(name: TacLabel) extends TacInstr;

//cjump condition name (if condition then jump to label name
case class TacCJump(condition: TacOperand, name: TacLabel) extends TacInstr;


/*Calls*/

//with no result

//virtual call with no result (void)
//receiver.function(params[0], params[1], ...)
case class TacVirtualCall(receiver: TacOperand, function: MethodDecl, params: List[TacOperand]) extends TacInstr;

//library call with no result (void)
//Library.function(params[0], params[1], ...)
case class TacLibCall(function: String, params: List[TacOperand]) extends TacInstr;

//with result

//virtual call with result
//dest = receiver.function(params[0], params[1], ...)
case class TacVirtualCallResult(dest: TacVar, receiver: TacOperand, function: MethodDecl, params: List[TacOperand]) extends TacInstr;

//library call with result
//dest = Library.function(params[0], params[1], ...)
case class TacLibCallResult(dest: TacVar, function: String, params: List[TacOperand]) extends TacInstr;

/*Object creation*/

//dest = new classDecl.classId()
case class TacNewObject(dest: TacVar, classDecl: ic.ast.ClassDecl) extends TacInstr;

/*Returns*/

//return;
case class TacReturn() extends TacInstr;

//return src;
case class TacReturnValue(src: TacOperand) extends TacInstr;

/*Runtime checks*/

//null check (for arrays, field accesses, and method calls)
case class TacNullCheck(src: TacOperand) extends TacInstr;

//bounds check (checks 0 <= src <= array.length)
case class TacBoundsCheck(src: TacOperand, array: TacOperand) extends TacInstr;

//size check (for array creation - checks src >= 0)
case class TacSizeCheck(src: TacOperand) extends TacInstr;

//zero check (for div and mod)
case class TacZeroCheck(src: TacOperand) extends TacInstr;

/*Comments*/

case class TacComment(id: String) extends TacInstr;

/**********/

/*Operands*/
class TacOperand {
  def offset(): Int = {
    return 0;
  }

  override def toString(): String = {
    return TACPrettyString.prettyTACOperand(this);
  }
}

abstract class TacVar extends TacOperand {
  def offset(): Int
}

case class TacLocal(vDecl: VarDecl) extends TacVar {
  override def offset(): Int = {
    return vDecl.index;
  }
}

case class TacThis(cDecl: ClassDecl) extends TacVar {
  override def offset(): Int = {
    return 2;
  }
}

//temporary variables (generated by TAC: t1, t2, etc.)
case class TempVar(id: String) extends TacVar {
  var tempOffset = 0: Int;

  def setOffset(newOffset: Int) {
    tempOffset = newOffset;
  }

  override def offset(): Int = {
    return tempOffset;
  }
}

//constants
abstract class TacLiteral extends TacOperand;

abstract class TacConstant extends TacLiteral;

case class TacInt(value: Int) extends TacConstant;

case class TacBool(value: Boolean) extends TacConstant;

//the isLiteral flag is used for pretty-printing (to distinguish string literals from Library function names)
case class TacString(value: String) extends TacConstant {
  var isLiteral = true;
  var id = 0;

  def setIsLiteral(literal: Boolean) {
    isLiteral = literal;
  }
  def setId(newId: Int) {
    id = newId;
  }
}

case class TacNull() extends TacConstant;

//not-a-constant (for constant folding analysis)
case class TacNac() extends TacLiteral;

/*Expressions (used for optimization - available expressions)*/
abstract class TacExpr;

case class TacUnExpr(op: Unop, src: TacOperand) extends TacExpr;

case class TacBinExpr(left: TacOperand, op: Binop, right: TacOperand) extends TacExpr;

case class TacArrayExpr(array: TacOperand, index: TacOperand) extends TacExpr;

case class TacLengthExpr(array: TacOperand) extends TacExpr;

case class TacFieldExpr(fieldObj: TacOperand, fieldDecl: FieldDecl) extends TacExpr;

case class TacNullCheckExpr(src: TacOperand) extends TacExpr;

case class TacBoundsCheckExpr(src: TacOperand, array: TacOperand) extends TacExpr;

case class TacSizeCheckExpr(src: TacOperand) extends TacExpr;

case class TacZeroCheckExpr(src: TacOperand) extends TacExpr;