package ic.symtab

import ic.ast._
import ic.error._
import ic.tc._
//import ic.symtab._

object useResolve {

  def resolveStart(program: Program) {
    val symTab = program.symtab.get
    for (classNode <- program.classes) {
      extendClass(classNode);
    }
  }

  def extendClass(classNode: ClassDecl) {
    //println("extending class: " + classNode.classId);
    fixClassDecl(classNode);
    for (field <- classNode.fields) {
      extendFieldDecl(field);
    }

    for (method <- classNode.methods) {
      extendMethodDecl(method);
    }
  }

  def extendFieldDecl(field: FieldDecl) {
    //println("extending field: " + field.id);
    extendType(field.myType);
  }

  def extendMethodDecl(method: MethodDecl) {
    //println("extending method: " + method.id);
    method match {
      case VoidMethod(id, formals, block, line) => {
        for (variable <- formals) {
          extendVar(variable);
        }
        extendStmt(block);
      }
      case FruitfulMethod(returnType, id, formals, block, line) => {
        extendType(returnType);
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
      case vCall: VirtualCall => {
        vCall.expr match {
          case Some(e) => {
            extendExpr(e)
          }
          case None => {}
        }
        for (expression <- vCall.exprs) {
          extendExpr(expression)
        }
      }
      case fCall: FunctionCall => {
        for (expr <- fCall.exprs) {
          extendExpr(expr);
        }
      }
      case aCall: AnonCall => {
        extendExpr(aCall.fcnExpr);
        for (expr <- aCall.exprs) {
          extendExpr(expr);
        }
      }
    }
  }

  def extendBinop(op: Binop) {}
  def extendUnop(unop: Unop) {}

  def fixClassType(node: ClassType) {
    val table = node.symtab.get;
    node.decl = table.getClassDecl(node.classId);
    node.decl match {
      case Some(cDecl) => {
      }
      case None => {
        throw new ScopeError(node.line, "class " + node.classId + " not found");
      }
    }
  }

  def fixClassDecl(node: ClassDecl) {
    val table = node.symtab.get;
    node.extendsId match {
      case Some(e) => {
        node.decl = table.getClassDecl(e)
      }
      case None => {}
    }
  }

  def fixClassExpr(node: ClassExpr) {
    val table = node.symtab.get;
    node.decl = table.getClassDecl(node.classId);
    node.decl match {
      case Some(cDecl) => {
      }
      case None => {
        throw new ScopeError(node.line, "class " + node.classId + " not found");
      }
    }
  }

  def fixIdLoc(node: IdLoc) {
    val table = node.symtab.get;
    var varDecl = table.getVarDecl(node.id);
    varDecl match {
      case Some(vDecl) => {
        node.setDecl(vDecl);
      }
      case None => {
        var fieldDecl = table.getFieldDecl(node.id);
        fieldDecl match {
          case Some(fDecl) => {
            node.setDecl(fDecl);
          }
          case None => {
            throw new ScopeError(node.line, "use of undeclared variable or field " + node.id);
          }
        }
      }
    }
  }

  //TODO: determine whether this is necessary, i.e. whether type checking will be always be done
  //DotLoc field declaration now set in TypeChecker (?)
  //use the type checker's method to set the decl, 
  //in case type checking isn't done on the closure-converted program
  def fixDotLoc(dotLoc: DotLoc) {
    TypeChecker.checkDotLoc(dotLoc);
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