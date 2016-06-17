package ic.symtab

import ic.ast._
//import ic.symtab._

object isSymTabDefined {

  def checkSymtabsAreDefinedStart(program: Program) {
    program.symtab match {
      case Some(e) => {}
      case None => {
        println("WARNING: Program Symbol Table not defined.")
      }
    }
    for (classNode <- program.classes) {
      extendClass(classNode);
    }
  }

  def extendClass(classNode: ClassDecl) {
    // Do classie things!
    fixClassDecl(classNode);
    for (field <- classNode.fields) {
      extendFieldDecl(field);
    }

    for (method <- classNode.methods) {
      extendMethodDecl(method);
    }
  }

  def extendFieldDecl(field: FieldDecl) {
    extendType(field.myType);
  }

  def extendMethodDecl(method: MethodDecl) {

    method match {
      case VoidMethod(id, formals, block, line) => {
        for (variable <- formals) {
          extendVar(variable);
        }
        extendStmt(block);
      }
      case FruitfulMethod(returnType, id, formals, block, line) => {
        for (variable <- formals) {
          extendVar(variable);
        }
        extendStmt(block);
      }
    }
  }

  def extendVar(variable: VarDecl) {
    extendType(variable.myType);
  }

  def extendStmt(statement: Stmt) {
    statement match {
      case ic.ast.BlockStmt(vars, stmts, line) => {
        for (vardecl <- vars) {
          extendVarDecl(vardecl)
        }
        for (subStatement <- stmts) {
          extendStmt(subStatement)
        }
      }
      case ic.ast.LocStmt(loc, expr, line) => {
        extendLocation(loc)
        extendExpr(expr)
      }
      case ic.ast.CallStmt(call, line) => {
        extendCall(call)
      }
      case ic.ast.ReturnStmt(expr, line) => {
        expr match {
          case Some(e) => {
            extendExpr(e)
          }
          case None => {}
        }
      }
      case ic.ast.IfStmt(cond, then, elseStmt, line) => {
        extendExpr(cond)
        extendStmt(then)
        elseStmt match {
          case Some(e) => {
            extendStmt(e)
          }
          case None => {}
        }
      }
      case ic.ast.WhileStmt(expr, stmt, line) => {
        extendExpr(expr)
        extendStmt(stmt)
      }
      case ic.ast.BreakStmt(line)    => {}
      case ic.ast.ContinueStmt(line) => {}
      case _                         => {}
    }
  }

  def extendVarDecl(vardecl: VarDecl) {
    extendType(vardecl.myType)

    vardecl.expr match {
      case Some(v) => {
        extendExpr(v)
      }
      case None => {}
    }
  }

  def extendExpr(expr: Expr) {
    expr match {
      case ic.ast.LocExpr(loc, line) => {
        extendLocation(loc)
      }
      case ic.ast.CallExpr(call, line) => {
        extendCall(call)
      }
      case ic.ast.ThisExpr(id, line) => {}
      case t: ic.ast.ClassExpr => {
        fixClassExpr(t);
      }
      case ic.ast.ArrayExpr(myType, expr, line) => {
        extendType(myType)
        extendExpr(expr)
      }
      case ic.ast.LengthExpr(expr, line) => {
        extendExpr(expr)
      }
      case ic.ast.BinExpr(left, op, right, line) => {
        extendExpr(left)
        extendBinop(op)
        extendExpr(right)
      }
      case ic.ast.UnExpr(op, expr, line) => {
        extendUnop(op)
        extendExpr(expr)
      }
      case ic.ast.IntExpr(value, line)    => {}
      case ic.ast.StringExpr(value, line) => {}
      case ic.ast.BoolExpr(value, line)   => {}
      case ic.ast.NullExpr(line)          => {}
      case _                              => {}
    }
  }

  def extendCall(call: Call) {
    call match {
      case LibCall(id, exprs, line) => {
        for (expr <- exprs) {
          extendExpr(expr)
        }
      }
      case VirtualCall(expr, id, exprs, line) => {
        expr match {
          case Some(e) => {
            extendExpr(e)
          }
          case None => {}
        }
        for (expression <- exprs) {
          extendExpr(expression)
        }
      }
      case _ => {}
    }
  }

  def extendBinop(op: Binop) {}
  def extendUnop(unop: Unop) {}

  def fixClassType(node: ClassType) {
    node.symtab match {
      case Some(e) => {}
      case None => {
        println("WARNING: Symbol Table not defined for class type node " + node.classId)
      }
    }
  }

  def fixClassDecl(node: ClassDecl) {
    node.symtab match {
      case Some(e) => {}
      case None => {
        println("WARNING: Symbol Table not defined for class decl node " + node.classId)
      }
    }
  }

  def fixClassExpr(node: ClassExpr) {
    node.symtab match {
      case Some(e) => {}
      case None => {
        println("WARNING: Symbol Table not defined for class expr node " + node.classId)
      }
    }
  }

  def fixIdLoc(node: IdLoc) {
    node.symtab match {
      case Some(e) => {}
      case None => {
        println("WARNING: Symbol Table not defined for ID loc node " + node.id)
      }
    }
  }

  def fixDotLoc(node: DotLoc) {
    node.symtab match {
      case Some(e) => {}
      case None => {
        println("WARNING: Symbol Table not defined for dot loc node " + node.id)
      }
    }
  }

  def extendType(typeNode: Type) {
    typeNode match {
      case c: ClassType => {
        fixClassType(c);
      }
      case ArrayType(t, line) => {
        extendType(t);
      }
      case _ => {}
    }
  }

  def extendLocation(location: ic.ast.Location) {
    location match {
      case i: ic.ast.IdLoc => {
        fixIdLoc(i);
      }
      case d: ic.ast.DotLoc => {
        extendExpr(d.expr);
        fixDotLoc(d);
      }
      case ic.ast.ArrayLoc(e1, e2, line) => {
        extendExpr(e1);
        extendExpr(e2);
      }
    }
  }

}