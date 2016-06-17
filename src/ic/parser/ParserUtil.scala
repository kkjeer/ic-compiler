package ic.parser

import scala.collection._;
import collection.mutable.ListBuffer;
import ic.ast._;

/**
 * These utility methods create Scala lists and option values.
 * Use them in your parser to create these objects easily.
 *
 * Your AST should not store any Java collection objects. If you
 * wish to use other types of collections, simply add similar
 * construction methods to this file.
 *
 * Usage:
 *
 * In Java code or CUP file, use these methods as follows, after importing
 * the Scala classes:
 *
 *    import scala.collection.immutable.*;
 *
 *    ...
 *
 *    List<String> l = ParserUtil.empty();
 *    l = ParserUtil.cons(l, "cow");
 *    l = ParserUtil.append(l, "moo");
 *
 *    l.length() // or any other Scala list method
 *
 *    Option<String> s = ParserUtil.none();
 *    s = ParserUtil.some("moo");
 *
 *    s.isDefined() // or any other Scala Option method
 *
 */
object ParserUtil {

  /**
   * Create an empty list.
   */
  def empty[A](): List[A] = List();

  /**
   * Insert element a onto the front of list l.
   */
  def cons[A, T <: A](a: T, l: List[A]): List[A] = a :: l;

  /**
   * Append element a onto the list l.
   */
  def append[A, T <: A](l: List[A], a: T): List[A] = l :+ a;

  /**
   * Create the empty value for Option[A].
   */
  def none[A](): Option[A] = None;

  /**
   * Create the value Some(a) for type Option[A].
   */
  def some[A](a: A): Option[A] = Some(a);

  /**
   * Partitions the given list based on type
   * Returns tuple with two elements:
   * 	1. a list of elements of the type mapped to Left
   *  2. a list of elements of the type mapped to Right
   */
  def partition[X, A, B](xs: List[X])(f: X => Either[A, B]): (List[A], List[B]) = {
    val as = new ListBuffer[A]
    val bs = new ListBuffer[B]
    for (x <- xs) {
      f(x) match {
        case Left(a)  => as += a
        case Right(b) => bs += b
      }
    }
    (as.toList, bs.toList)
  }

  /*
	 * Returns a class declaration from the class and extends strings
	 * and a list of Decls, containing some combination of FieldDecls and MethodDecls
	 */
  def createClassDecl(classId: String, extendsId: Option[String], fmDecls: List[FMDecl], line: Int): ClassDecl = {
    var partsTuple = partition(fmDecls) {
      case f: FieldDecl  => Left(f)
      case m: MethodDecl => Right(m)
    }
    var fieldDecls = partsTuple._1;
    var methodDecls = partsTuple._2;
    return new ClassDecl(classId, extendsId, fieldDecls, methodDecls, line);
  }

  //	def createVarDecl (varType: Type, varId: String, expr: Option[Expr], assignVars: List[AssignVar]) : VarDecl = {
  //	  var extraAssign = new AssignVar(varId, expr);
  //	  var extendedAssigns = cons(extraAssign, assignVars);
  //	  return new VarDecl(varType, extendedAssigns);
  //	}

  def createVarDeclList(varType: Type, varId: String, expr: Option[Expr], assignVars: List[AssignVar], line: Int): List[VarDecl] = {
    var first = new VarDecl(varType, varId, expr, line);
    var rest = assignVars.map(aVar => new VarDecl(varType, aVar.id, aVar.expr, line));
    return ParserUtil.cons(first, rest);
  }
  
  def createFunctionDeclList(returnType: Type, fcnId: String, formals: List[VarDecl], block: BlockStmt, line: Int): List[VarDecl] = {
    var paramTypes = formals map (formal => formal.myType);
    var fcnType = new FunctionType(returnType, paramTypes.toList, line);
    var fcnExpr = new FunctionExpr(formals, returnType, block, line);
    var fcnVarDecl = new VarDecl(fcnType, fcnId, Some(fcnExpr), line);
    
    var list = List[VarDecl](fcnVarDecl);
    return list;
  }

  def addVarDecls(currentDecls: List[VarDecl], varDecls: List[VarDecl]): List[VarDecl] = {
    var result = currentDecls;
    for (varDecl <- varDecls) {
      result = ParserUtil.append(result, varDecl);
    }
    return result;
  }

  def createFieldDeclList(fieldType: Type, fieldId: String, moreIds: List[String], line: Int): List[FieldDecl] = {
    var first = new FieldDecl(fieldType, fieldId, line: Int);
    var rest = moreIds.map(id => new FieldDecl(fieldType, id, line: Int));
    return ParserUtil.cons(first, rest);
  }

  def addFieldDecls(currentDecls: List[FMDecl], fieldDecls: List[FieldDecl]): List[FMDecl] = {
    var result = currentDecls;
    for (fieldDecl <- fieldDecls) {
      result = ParserUtil.append(result, fieldDecl);
    }
    return result;
  }

}

