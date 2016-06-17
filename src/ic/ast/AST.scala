package ic.ast;
import ic.Util
import ic.symtab._;
import ic.tac._;

trait refToDecl[T] {
  //For times when we want to use a Decl
  var decl = None: Option[T];

  def getDecl(): T = {
    return decl.get;
  }

  def setDecl(newDecl: T) {
    decl = Some(newDecl);
  }
}

trait refToVar[T] {
  //For times when we want to use a Var
  var variable = None: Option[T];

  def getVar(): T = {
    return variable.get;
  }

  def setVar(newDecl: T) {
    variable = Some(newDecl);
  }
}

trait Index  {
  private var ind: Option[Int] = None
  def setIndex(i: Int) = {
    ind = Some(i)
    if (i == 0) Util.debug("WARNING: setting offset zero on " + this)
  }
  def index(): Int = ind.get
}

/* 
 * Generate a unique ID for each AST node. 
 * Adds UID attribute to each AST node. Called during AST node initial creation.  
 * */
object UIDGen {
  var curNum = -1;
  def nextID = {
    curNum = curNum + 1
    //curNum+= 1
    curNum
  }
}

/* 
 * Base class for all nodes in the AST. All other nodes inherit from this class. 
 * Initializes symbol table (with None) and creates a UID (unique ID) which can be used to identify the node. 
 * Create helper methods to get and set symbol tables. 
 * */
abstract class ASTNode {
  var symtab = None: Option[SymbolTable];
  val UID = UIDGen.nextID
  var maxVarIndex = None: Option[Int];
  //var length = None: Option[Int]; //If this is a parent thing, this is the max offset of it's children

  def getSymTab(): SymbolTable = {
    return symtab.get;
  }

  def setSymTab(newSymTab: SymbolTable) = {
    symtab = Some(newSymTab);
  }
  
  override def toString(): String = {
    return ASTPrettyString.prettyASTNode(this);
  }
}

/*
 * Programs with a list of class declarations
 */
case class Program(classes: Seq[ClassDecl], line: Int) extends ASTNode {
  var tacStrings: List[TacString] = List[TacString]();

  def setTacStrings(tacstrs: List[TacString]) = {
    tacStrings = tacstrs;
  }
  
  def getClasses() : Seq[ClassDecl] = {
    return classes;
  }
}

/*
 * Class declarations:
 * classId
 * optional extendsId
 * list of field declarations
 * list of method declarations
 */
case class ClassDecl(classId: String, extendsId: Option[String], fields: Seq[FieldDecl], methods: Seq[MethodDecl], line: Int) extends Decl with refToDecl[ClassDecl] {
  var maxFieldIndex = None: Option[Int];
  var vTable = Vector[MethodDecl](); // Virtual table. Contains offsets of its methods.  
  var payloadSize = 0;
  for (m <- methods) {
    m.cls = this
  }
  def getMethods() : Seq[MethodDecl] = {
    return methods;
  }
  var functionType = None: Option[FunctionType];
  
  def getFunctionType(): Option[FunctionType] = {
    return functionType;
  }
  
  def setFunctionType(fcnType: FunctionType) = {
    functionType = Some(fcnType);
  }
}

/*
 * General declaration
 */
abstract class Decl extends ASTNode

/*
 * Base class for Field or Method declarations
 * for interleaving fields and methods in grammar
 */
abstract class FMDecl extends ASTNode with Index

case class FieldDecl(myType: Type, id: String, line: Int) extends FMDecl

abstract class MethodDecl(val id: String, val line: Int, val formals: Seq[VarDecl], val block: BlockStmt) extends FMDecl {
  var cls: ClassDecl  = null
  var tacList = new TACList(): TACList;
  def qname = cls.classId + "." + id
  var varTable = Vector[String]()

  def getTacList(): TACList = {
    return tacList;
  }

  def setTacList(newTacList: TACList) = {
    tacList = newTacList;
  }
}

case class VoidMethod(methodId: String, methodFormals: Seq[VarDecl], methodBlock: BlockStmt, methodLine: Int) extends MethodDecl(methodId, methodLine, methodFormals, methodBlock)
case class FruitfulMethod(returnType: Type, methodId: String, methodFormals: Seq[VarDecl],
                          methodBlock: BlockStmt, methodLine: Int) extends MethodDecl(methodId, methodLine, methodFormals, methodBlock)

/*
 * Types. All IC types extend this class
 */
abstract class Type extends ASTNode

case class IntType(line: Int) extends Type
case class StringType(line: Int) extends Type
case class BoolType(line: Int) extends Type
case class ClassType(classId: String, line: Int) extends Type with refToDecl[ClassDecl]
case class ArrayType(theType: Type, line: Int) extends Type
case class NullType(line: Int) extends Type
case class VoidType(line: Int) extends Type
case class FunctionType(returnType: Type, paramTypes: List[Type], line: Int) extends Type

/*
 * Variable declarations
 */
case class VarDecl(myType: Type, id: String, expr: Option[Expr], line: Int) extends ASTNode with Index {
  var isParam = false;
  var closureClass = None: Option[ClassDecl];
  var closureInstance = None: Option[ClassExpr];

  def setIsParam(param: Boolean) = {
    isParam = param;
  }

  def getIsParam(): Boolean = {
    return isParam;
  }
  
  def setClosureClass(closure: ClassDecl) = {
    closureClass = Some(closure);
  }
  
  def getClosureClass(): Option[ClassDecl] = {
    return closureClass;
  }
  
  def setClosureInstance(instance: ClassExpr) = {
    closureInstance = Some(instance);
  }
  
  def getClosureInstance(): Option[ClassExpr] = {
    return closureInstance;
  }
}

/*
 * Statements. All statement classes extend this class. 
 */
abstract class Stmt extends ASTNode
case class BlockStmt(vars: Seq[VarDecl], stmts: Seq[Stmt], line: Int) extends Stmt
case class LocStmt(loc: Location, expr: Expr, line: Int) extends Stmt
case class CallStmt(call: Call, line: Int) extends Stmt
case class ReturnStmt(expr: Option[Expr], line: Int) extends Stmt
case class IfStmt(cond: Expr, then: Stmt, elseStmt: Option[Stmt], line: Int) extends Stmt
case class WhileStmt(expr: Expr, stmt: Stmt, line: Int) extends Stmt
case class BreakStmt(line: Int) extends Stmt
case class ContinueStmt(line: Int) extends Stmt
case class FunctionStmt(id: String, formals: Seq[VarDecl], returnType: Type, block: BlockStmt, line: Int) extends Stmt

/*
 * Expressions. All expression classes extend this class. 
 */
abstract class Expr extends ASTNode {
  private var exprType: Option[Type] = None

  def getType(): Type = {
    return exprType.get
  }

  def setType(newType: Type) = {
    exprType = Some(newType);
  }
}

case class LocExpr(loc: Location, line: Int) extends Expr
case class CallExpr(call: Call, line: Int) extends Expr
case class ThisExpr(id: String = "this", line: Int) extends Expr with refToDecl[ClassDecl]
case class ClassExpr(classId: String, line: Int) extends Expr with refToDecl[ClassDecl] //HERE
case class ArrayExpr(myType: Type, expr: Expr, line: Int) extends Expr
case class LengthExpr(expr: Expr, line: Int) extends Expr
case class BinExpr(left: Expr, op: Binop, right: Expr, line: Int) extends Expr
case class UnExpr(op: Unop, expr: Expr, line: Int) extends Expr
case class IntExpr(value: Int, line: Int) extends Expr
case class StringExpr(value: String, line: Int) extends Expr
case class BoolExpr(value: Boolean, line: Int) extends Expr
case class NullExpr(line: Int) extends Expr
case class FunctionExpr(formals: Seq[VarDecl], returnType: Type, block: BlockStmt, line: Int) extends Expr

/*
 * Calls: Library and Virtual. Base Call class which other call classes extend
 */
abstract class Call extends ASTNode

case class LibCall(id: String, exprs: Seq[Expr], line: Int) extends Call
case class VirtualCall(expr: Option[Expr], id: String, exprs: Seq[Expr], line: Int) extends Call with refToDecl[MethodDecl]
case class FunctionCall(id: String, exprs: Seq[Expr], line: Int) extends Call with refToDecl[VarDecl] 
case class AnonCall(fcnExpr: FunctionExpr, exprs: Seq[Expr], line: Int) extends Call;

/*
 * Locations. Base class from which location classes extend. 
 */
abstract class Location extends ASTNode

case class IdLoc(id: String, line: Int) extends Location with refToDecl[ASTNode]
case class DotLoc(expr: Expr, id: String, line: Int) extends Location with refToDecl[FieldDecl]
case class ArrayLoc(e1: Expr, e2: Expr, line: Int) extends Location

/*
 * Binary operations 
 */
abstract class Binop extends ASTNode

case class Plus(line: Int) extends Binop
case class Minus(line: Int) extends Binop
case class Mult(line: Int) extends Binop
case class Div(line: Int) extends Binop
case class Mod(line: Int) extends Binop
case class And(line: Int) extends Binop
case class Or(line: Int) extends Binop
case class Less(line: Int) extends Binop
case class LessEq(line: Int) extends Binop
case class Greater(line: Int) extends Binop
case class GreaterEq(line: Int) extends Binop
case class Equal(line: Int) extends Binop
case class NotEqual(line: Int) extends Binop

/*
 * Unary operations 
 */
abstract class Unop extends ASTNode

case class Negative(line: Int) extends Unop
case class Not(line: Int) extends Unop

/*
 * Variable
 * Stores type and id
 * Used in Formals
 */
case class Var(myType: Type, id: String, line: Int) extends ASTNode

/*
 * Assignment variable
 * Stores id and expression
 * Used in Variable declarations (VarDecl)
 */
case class AssignVar(id: String, expr: Option[Expr], line: Int) extends ASTNode with refToVar[AssignVar] //Here expr //K
