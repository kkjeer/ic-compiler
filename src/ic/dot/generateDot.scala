package ic.dot

import ic.ast._
import ic.tc._
import ic.dot._
import ic.error._

import java.io

object generateDot {

  def createLine(a: String, b: String): String = {
    val arrow = a + " -> " + b
    return arrow
  }

  def startGenerateDot(program: Program) {
    val dot = new java.io.PrintWriter("graphDot.dot")
    dot.println("digraph Program {")
    dot.println("Program[type=\"Program\"]")
    dot.println("Program[color=red]")
    for (cDecl <- program.classes) {
      //do class Decl things
      val cDeclID = cDecl.classId + cDecl.UID
      val line = createLine("Program", cDeclID)
      dot.println(line)
      dot.println(cDeclID + "[type=\"ClassDecl\"]")
      dot.println(cDeclID + "[color=blue]")
      for (field <- cDecl.fields) {
        addField(dot, field, cDeclID)
      }
      for (method <- cDecl.methods) {
        addMethod(dot, method, cDeclID)
      }
    }
    dot.println("}")
    dot.close()
  }

  def addField(dot: java.io.PrintWriter, field: ic.ast.FieldDecl, parentID: String) {
    val fieldID = field.id + field.UID + "index" + field.index
    dot.println(fieldID + "[color=yellow]")
    dot.println(fieldID + "[type=\"FieldDecl\"]")
    dot.println(createLine(parentID, fieldID))
  }

  def addMethod(dot: java.io.PrintWriter, method: ic.ast.MethodDecl, parentID: String) {
    method match {
      case VoidMethod(methodId, methodFormals, methodBlock, methodLine) => {
        val methodID = "VoidMethod" + method.UID + methodId + "MaxIndex" + method.maxVarIndex.get //+ methodLine
        dot.println(methodID + "[color=yellow]")
        dot.println(methodID + "[type=\"MethodDecl\"]")
        dot.println(createLine(parentID, methodID))

        for (varDecl <- methodFormals) {
          addVarDecl(dot, varDecl, methodID)
        }

        addStmt(dot, methodBlock, methodID)
      }

      case FruitfulMethod(returnType, methodId, methodFormals, methodBlock, methodLine) => {
        val methodID = "FruitfulMethod" + method.UID + methodId + "MaxIndex" + method.maxVarIndex.get // + methodLine
        dot.println(methodID + "[color=yellow]")
        dot.println(methodID + "[type=\"MethodDecl\"]")
        dot.println(createLine(parentID, methodID))

        for (varDecl <- methodFormals) {
          addVarDecl(dot, varDecl, methodID)
        }
        addStmt(dot, methodBlock, methodID)
      }
    }
  }

  def addVarDecl(dot: java.io.PrintWriter, decl: ic.ast.VarDecl, parentID: String) {
    val declID = "VarDecl" + decl.UID + decl.id + "index" + decl.index //+decl.line
    dot.println(createLine(parentID, declID))
    dot.println(declID + "[color=pink]")
    dot.println(declID + "[type=\"VarDecl\"]")

    decl.expr match {
      case Some(e) => {
        addExpr(dot, e, decl.id)
      }
      case None => {}
    }
  }

  def addStmt(dot: java.io.PrintWriter, stmt: ic.ast.Stmt, parentID: String) {
    stmt match {
      case BlockStmt(vars, stmts, line) => {
        val stmtID = "blockStmt" + stmt.UID //line
        dot.println(stmtID + "[color=purple]")
        dot.println(stmtID + "[type=\"Stmt\"]")
        dot.println(createLine(parentID, stmtID))

        for (statement <- stmts) {
          addStmt(dot, statement, stmtID)
        }

        for (varDecl <- vars) {
          addVarDecl(dot, varDecl, stmtID)
        }
      }

      case LocStmt(loc: Location, expr: Expr, line: Int) => {
        val stmtID = "locStmt" + stmt.UID //line
        dot.println(stmtID + "[color=purple]")
        dot.println(stmtID + "[type=\"Stmt\"]")
        dot.println(createLine(parentID, stmtID))

        addLoc(dot, loc, stmtID)
      }

      case CallStmt(call, line) => {
        val stmtID = "callStmt" + stmt.UID //+line

        dot.println(stmtID + "[type=\"Stmt\"]")
        dot.println(createLine(parentID, stmtID))
        dot.println(stmtID + "[color=purple]")

        addCall(dot, call, stmtID)
      }

      case ReturnStmt(expr: Option[Expr], line: Int) => {
        val stmtID = "returnStmt" + stmt.UID //+line
        dot.println(stmtID + "[color=purple]")
        dot.println(stmtID + "[type=\"Stmt\"]")
        dot.println(createLine(parentID, stmtID))

        expr match {
          case Some(e) => {
            addExpr(dot, e, stmtID)
          }
          case None => {}
        }
      }

      case IfStmt(cond: Expr, then: Stmt, elseStmt: Option[Stmt], line: Int) => {
        val stmtID = "ifStmt" + stmt.UID //line
        dot.println(stmtID + "[color=purple]")
        dot.println(stmtID + "[type=\"Stmt\"]")
        dot.println(createLine(parentID, stmtID))

        addExpr(dot, cond, stmtID)
        addStmt(dot, then, stmtID)

        elseStmt match {
          case Some(s) => {
            addStmt(dot, s, stmtID)
          }
          case None => {}
        }
      }

      case WhileStmt(expr: Expr, stmt: Stmt, line: Int) => {
        val stmtID = "whileStmt" + stmt.UID //line
        dot.println(stmtID + "[color=purple]")
        dot.println(stmtID + "[type=\"Stmt\"]")
        dot.println(createLine(parentID, stmtID))

        addExpr(dot, expr, stmtID)
        addStmt(dot, stmt, stmtID)
      }

      case BreakStmt(line) => {
        val stmtID = "breakStmt" + stmt.UID //+line
        dot.println(stmtID + "[color=purple]")
        dot.println(stmtID + "[type=\"Stmt\"]")
        dot.println(createLine(parentID, stmtID))
      }

      case ContinueStmt(line) => {
        val stmtID = "continueStmt" + stmt.UID //line
        dot.println(stmtID + "[color=purple]")
        dot.println(stmtID + "[type=\"Stmt\"]")
        dot.println(createLine(parentID, stmtID))
      }

      case _ => {}
    }
  }

  def addLoc(dot: java.io.PrintWriter, loc: ic.ast.Location, parentID: String) {

    loc match {
      case IdLoc(id: String, line: Int) => {
        val locID = "IDLoc" + id + loc.UID //line
        dot.println(locID + "[color=darkgreen]")
        dot.println(locID + "[type=\"Location\"]")
        dot.println(createLine(parentID, locID))
      }

      case DotLoc(expr, id, line) => {
        val locID = "DotLoc" + id + loc.UID //line
        dot.println(locID + "[color=darkgreen]")
        dot.println(locID + "[type=\"Location\"]")
        dot.println(createLine(parentID, locID))

        addExpr(dot, expr, locID)
      }

      case ArrayLoc(e1: Expr, e2: Expr, line: Int) => {
        val locID = "ArrayLoc" + loc.UID //line
        dot.println(locID + "[color=darkgreen]")
        dot.println(locID + "[type=\"Location\"]")
        dot.println(createLine(parentID, locID))

        addExpr(dot, e1, locID)
        addExpr(dot, e2, locID)
      }
    }
  }

  def addExpr(dot: java.io.PrintWriter, expr: ic.ast.Expr, parentID: String) {

    expr match {
      case LocExpr(loc: Location, line: Int) => {
        val exprID = "LocExpr" + expr.UID //line
        dot.println(exprID + "[color=cyan]")
        dot.println(exprID + "[type=\"Expr\"]")
        dot.println(createLine(parentID, exprID))

        addLoc(dot, loc, exprID)
      }

      case CallExpr(call: Call, line: Int) => {
        val exprID = "CallExpr" + expr.UID //line
        dot.println(exprID + "[color=cyan]")
        dot.println(exprID + "[type=\"Expr\"]")
        dot.println(createLine(parentID, exprID))

        addCall(dot, call, exprID)
      }

      case ThisExpr(id, line) => {
        val exprID = "ThisExpr" + expr.UID //line
        dot.println(exprID + "[color=cyan]")
        dot.println(exprID + "[type=\"Expr\"]")
        dot.println(createLine(parentID, exprID))
      }

      case ClassExpr(classId, line) => {
        val exprID = "ClassExpr" + expr.UID //line
        dot.println(exprID + "[color=cyan]")
        dot.println(exprID + "[type=\"Expr\"]")
        dot.println(createLine(parentID, exprID))
      }

      case ArrayExpr(myType, expr, line) => {
        val exprID = "ArrayExpr" + expr.UID //line
        dot.println(exprID + "[color=cyan]")
        dot.println(exprID + "[type=\"Expr\"]")
        dot.println(createLine(parentID, exprID))

        addExpr(dot, expr, exprID)
      }

      case LengthExpr(expr: Expr, line: Int) => {
        val exprID = "LengthExpr" + expr.UID //line
        dot.println(exprID + "[color=cyan]")
        dot.println(exprID + "[type=\"Expr\"]")
        dot.println(createLine(parentID, exprID))

        addExpr(dot, expr, exprID)
      }

      case BinExpr(left: Expr, op: Binop, right: Expr, line: Int) => {
        val exprID = "BinExpr" + expr.UID //line
        dot.println(exprID + "[color=cyan]")
        dot.println(exprID + "[type=\"Expr\"]")
        dot.println(createLine(parentID, exprID))

        addExpr(dot, left, exprID)
        addBinop(dot, op, exprID)
        addExpr(dot, right, exprID)
      }

      case UnExpr(op: Unop, expr: Expr, line: Int) => {
        val exprID = "UnExpr" + expr.UID //line
        dot.println(exprID + "[color=cyan]")
        dot.println(exprID + "[type=\"Expr\"]")
        dot.println(createLine(parentID, exprID))

        addUnop(dot, op, exprID)
        addExpr(dot, expr, exprID)
      }

      case IntExpr(value: Int, line: Int) => {
        val exprID = "IntExpr" + expr.UID //line
        dot.println(exprID + "[color=cyan]")
        dot.println(exprID + "[type=\"Expr\"]")
        dot.println(createLine(parentID, exprID))
      }

      case StringExpr(value, line) => {
        val exprID = "StringExpr" + expr.UID //line
        dot.println(exprID + "[color=cyan]")
        dot.println(exprID + "[type=\"Expr\"]")
        dot.println(createLine(parentID, exprID))
      }

      case BoolExpr(value: Boolean, line: Int) => {
        val exprID = "BoolExpr" + expr.UID //line
        dot.println(exprID + "[color=cyan]")
        dot.println(exprID + "[type=\"Expr\"]")
        dot.println(createLine(parentID, exprID))
      }

      case NullExpr(line) => {
        val exprID = "NullExpr" + expr.UID //line
        dot.println(exprID + "[color=cyan]")
        dot.println(exprID + "[type=\"Expr\"]")
        dot.println(createLine(parentID, exprID))
      }

    }
  }

  def addCall(dot: java.io.PrintWriter, call: ic.ast.Call, parentID: String) {
    call match {
      case LibCall(id: String, exprs: Seq[Expr], line: Int) => {
        val libID = "LibCall" + id + call.UID //line
        dot.println(libID + "[color=lightblue]")
        dot.println(libID + "[type=\"Call\"]")
        dot.println(createLine(parentID, libID))

        for (expr <- exprs) {
          addExpr(dot, expr, libID)
        }
      }

      case VirtualCall(expr: Option[Expr], id: String, exprs: Seq[Expr], line: Int) => {
        val libID = "LibCall" + id + call.UID //line
        dot.println(libID + "[color=lightblue]")
        dot.println(libID + "[type=\"Call\"]")
        dot.println(createLine(parentID, libID))

        // Add first optional expression to graph:
        expr match {
          case Some(e) => {
            addExpr(dot, e, libID)
          }
          case None => {}
        }

        //Add 3rd sequence of expressions to graph: 
        for (exp <- exprs) {
          addExpr(dot, exp, libID)
        }
      }
    }
  }

  def addBinop(dot: java.io.PrintWriter, binop: ic.ast.Binop, parentID: String) {
    var binopID = ""
    binop match {
      case Plus(_)         => binopID = "PlusBinop" + binop.UID //line
      case Minus(_)        => binopID = "MinusBinop" + binop.UID //line
      case Mult(line)      => binopID = "MultBinop" + binop.UID //line
      case Div(line)       => binopID = "DivBinop" + binop.UID //line
      case Mod(line)       => binopID = "ModBinop" + binop.UID //line
      case And(line)       => binopID = "AndBinop" + binop.UID //line
      case Or(line)        => binopID = "OrBinop" + binop.UID //line
      case Less(line)      => binopID = "LessBinop" + binop.UID //line
      case LessEq(line)    => binopID = "LessEqBinop" + binop.UID //line
      case Greater(line)   => binopID = "GreaterBinop" + binop.UID //line
      case GreaterEq(line) => binopID = "GreaterEqBinop" + binop.UID //line
      case Equal(line)     => binopID = "EqualBinop" + binop.UID //line
      case NotEqual(line)  => binopID = "NotEqualBinop" + binop.UID //line
    }

    dot.println(binopID + "[color=cornflowerblue]")
    dot.println(binopID + "[type=\"Binop\"]")
    dot.println(createLine(parentID, binopID))
  }

  def addUnop(dot: java.io.PrintWriter, unop: ic.ast.Unop, parentID: String) {
    var unopID = ""

    unop match {
      case Negative(line) => unopID = "NegativeUnop" + unop.UID //line
      case Not(line)      => unopID = "NotUnop" + unop.UID //line
    }

    dot.println(unopID + "[color=tomato2]")
    dot.println(unopID + "[type=\"Binop\"]")
    dot.println(createLine(parentID, unopID))

  }
}
