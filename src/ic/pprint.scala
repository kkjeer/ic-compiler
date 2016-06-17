package ic

import scala.io.Source

/* PROGRAM FORMAT:
 * 1. Helper functions
 * 2. Sorting functions. Take abstract class print call and call the approprate, more specific call on the data.
 * 3. Specific print functions, organized by general type
 * 
 * */

object pprint {

  //////////////////////    HELPER FUNCTIONS:     /////////////////////////
  // Helper spacing function. 
  def printIndentSpaces(i: Int) {
    for (space <- 0 to i) {
      print("  ");
    }
  }

  def printFieldID(i: Int, id: String) {
    printIndentSpaces(i);
    print("Field ID: ");
    println(id);
  }

  def threeCats() {
    println();
    Source.fromFile("src/ic/.3cats.txt").foreach {
      print;
    }
  }

  //////////////////////    SORTING FUNCTIONS:     /////////////////////////
  // Sort generic print type call into appropriate specific type print call: 

  def printBinop(i: Int, opp: ic.ast.Binop) {
    opp match {
      case ic.ast.Plus(_) => {
        printPlus(i);
      }
      case ic.ast.Minus(line) => {
        printMinus(i);
      }
      case ic.ast.Mult(line) => {
        printMult(i);
      }
      case ic.ast.Div(line) => {
        printDiv(i);
      }
      case ic.ast.Mod(line) => {
        printMod(i);
      }
      case ic.ast.And(line) => {
        printAnd(i);
      }
      case ic.ast.Or(line) => {
        printOr(i);
      }
      case ic.ast.Less(line) => {
        printLess(i);
      }
      case ic.ast.LessEq(line) => {
        printLessEq(i);
      }
      case ic.ast.Greater(line) => {
        printGreater(i);
      }
      case ic.ast.GreaterEq(line) => {
        printGreaterEq(i);
      }
      case ic.ast.Equal(line) => {
        printEqual(i);
      }
      case ic.ast.NotEqual(line) => {
        printNotEqual(i);
      }
    }
  }

  def printCall(i: Int, call: ic.ast.Call) {
    call match {
      case ic.ast.LibCall(id, exprs, line) => {
        printLibCall(i, id, exprs);
      }
      case ic.ast.VirtualCall(expr, id, exprs, line) => {
        printVirtualCall(i, expr, id, exprs);
      }

    }
  }

  def printLocation(i: Int, location: ic.ast.Location) {
    location match {
      case ic.ast.IdLoc(id, line) => {
        printIdLoc(i, id);
      }
      case ic.ast.DotLoc(expr, id, line) => {
        printDotLoc(i, expr, id);
      }
      case ic.ast.ArrayLoc(e1, e2, line) => {
        printArrayLoc(i, e1, e2);
      }
    }
  }

  def printUnop(i: Int, opp: ic.ast.Unop) {
    opp match {
      case ic.ast.Negative(line) => {
        printNegative(i);
      }
      case ic.ast.Not(line) => {
        printNot(i);
      }
    }
  }

  def printExpr(i: Int, expr: ic.ast.Expr) {
    expr match {
      case ic.ast.LocExpr(loc, line) => {
        printLocExpr(i, loc);
      }
      case ic.ast.CallExpr(call, line) => {
        printCallExpr(i, call);
      }
      case ic.ast.ThisExpr(id, line) => {
        printThisExpr(i);
      }
      case ic.ast.ClassExpr(classId, line) => {
        printClassExpr(i, classId);
      }
      case ic.ast.ArrayExpr(myType, expr, line) => {
        printArrayExpr(i, myType, expr);
      }
      case ic.ast.LengthExpr(expr, line) => {
        printLengthExpr(i, expr);
      }
      case ic.ast.BinExpr(left, op, right, line) => {
        printBinExpr(i, left, op, right);
      }
      case ic.ast.UnExpr(op, expr, line) => {
        printUnExpr(i, op, expr)
      }
      case ic.ast.IntExpr(value, line) => {
        printIntExpr(i, value)
      }
      case ic.ast.StringExpr(value, line) => {
        printStringExpr(i, value);
      }
      case ic.ast.BoolExpr(value, line) => {
        printBoolExpr(i, value);
      }
      case ic.ast.NullExpr(line) => {
        printNullExpr(i)
      }
      case _ => {
        
      }
    }
  }

  def printStmt(i: Int, statement: ic.ast.Stmt) {
    statement match {
      case ic.ast.BlockStmt(vars, stmts, line) => {
        printBlockStatement(i, vars, stmts);
      }
      case ic.ast.LocStmt(loc, expr, line) => {
        printLocStmt(i, loc, expr);
      }
      case ic.ast.CallStmt(call, line) => {
        printCallStmt(i, call);
      }
      case ic.ast.ReturnStmt(expr, line) => {
        printReturnStmt(i, expr);
      }
      case ic.ast.IfStmt(cond, then, elseStmt, line) => {
        printIfStmt(i, cond, then, elseStmt);
      }
      case ic.ast.WhileStmt(expr, stmt, line) => {
        printWhileStmt(i, expr, stmt);
      }
      case ic.ast.BreakStmt(line) => {
        printBreakStmt(i);
      }
      case ic.ast.ContinueStmt(line) => {
        printContinueStmt(i)
      }
      case _ => {
        
      }
    }
  }

  def printType(i: Int, Type: ic.ast.Type) {
    Type match {
      case ic.ast.IntType(line) => {
        printIntType(i);
      }
      case ic.ast.StringType(line) => {
        printStringType(i);
      }
      case ic.ast.BoolType(line) => {
        printBoolType(i);
      }
      case ic.ast.ClassType(string, line) => {
        printClassType(i, string);
      }
      case ic.ast.ArrayType(theType, line) => {
        printArrayType(i, theType);
      }
      case ic.ast.VoidType(_) => {
        printIndentSpaces(i);
        println("Void type");
      }
      case ic.ast.FunctionType(returnType, paramTypes, line) => {
        printFunctionType(i, returnType, paramTypes);
      }
    }
  }

  //////////////////////    PROGRAM PRINT FUNCTION:     /////////////////////////  
  def printProgram(i: Int, program: ic.ast.Program) {

    printIndentSpaces(i);
    print("PROGRAM: ")
    println(program.getClass.getName);

    for (classDecl <- program.classes) {
      printClassDecl(i + 1, classDecl)
    }
  }

  //////////////////////    CALL PRINT FUNCTIONS:     /////////////////////////
  def printLibCall(i: Int, id: String, exprs: Seq[ic.ast.Expr]) {
    printIndentSpaces(i);
    print("Lib Call with ID: ")
    print(id);
    println(" and Exprs: ");
    for (expression <- exprs) {
      printExpr(i + 1, expression)
    }
  }

  def printVirtualCall(i: Int, expr: Option[ic.ast.Expr], id: String, exprs: Seq[ic.ast.Expr]) {
    printIndentSpaces(i);

    expr match {
      case None => {
        print(" No expression With ID: ");
        println(id);
      }
      case Some(e) => {
        println("Expressions: ");
        printExpr(i + 1, e);
      }
    }

    for (expression <- exprs) {
      printExpr(i + 1, expression);
    }
  }

  //////////////////////    LOCATION (LOC) PRINT FUNCTIONS:     /////////////////////////
  def printIdLoc(i: Int, id: String) {
    printIndentSpaces(i);
    print("ID Loc with ID: ");
    print(id);
    println(".")
  }

  def printDotLoc(i: Int, expr: ic.ast.Expr, id: String) {
    printIndentSpaces(i);
    print("Dot Loc with ID: ");
    print(id);
    println(" and Expr: ");
    printExpr(i + 1, expr);
  }

  def printArrayLoc(i: Int, e1: ic.ast.Expr, e2: ic.ast.Expr) {
    printIndentSpaces(i);
    println("Array Loc with Expressions: ");
    printExpr(i + 1, e1);
    printExpr(i + 1, e2);
  }

  //////////////////////    UNARY OPPERATOR PRINT FUNCTIONS:     /////////////////////////
  def printNegative(i: Int) {
    printIndentSpaces(i);
    println("Negative Unary Opperator.");
  }

  def printNot(i: Int) {
    printIndentSpaces(i);
    println("Not Unary Opperator.");
  }

  //////////////////    BINARY OPPERATOR PRINT FUNCTIONS: ///////////////////
  def printPlus(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: Plus. ");
  }
  def printMinus(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: Minus. ");
  }
  def printMult(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: Multiplication. ");
  }
  def printDiv(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: Divison. ");
  }
  def printMod(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: Modulus. ");
  }
  def printAnd(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: And. ");
  }
  def printOr(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: Or. ");
  }
  def printLess(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: Less than. ");
  }
  def printLessEq(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: Less than or equal to. ");
  }
  def printGreater(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: Greater than. ");
  }
  def printGreaterEq(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: Greater than or equal to. ");
  }
  def printEqual(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: Equal to comparison. ");
  }
  def printNotEqual(i: Int) {
    printIndentSpaces(i);
    println("Binary Opperator: Not equal to comparison. ");
  }

  //////////////////    EXPRESSION PRINT FUNCTIONS: ///////////////////
  def printLocExpr(i: Int, loc: ic.ast.Location) {
    printIndentSpaces(i);
    println("Loc Expr: ");
    printLocation(i + 1, loc);
  }

  def printCallExpr(i: Int, call: ic.ast.Call) {
    printIndentSpaces(i);
    println("Call Expr: ");
    printCall(i + 1, call);
  }

  def printThisExpr(i: Int) {
    printIndentSpaces(i);
    println("This Expr.");
  }

  def printClassExpr(i: Int, classId: String) {
    printIndentSpaces(i);
    print("Class Expr: ");
    println(classId);
  }

  def printArrayExpr(i: Int, myType: ic.ast.Type, expr: ic.ast.Expr) {
    printIndentSpaces(i);
    print("Array Expr of type: ");
    printType(i + 1, myType);
    println(" containing: ");
    printExpr(i + 1, expr);
  }

  def printLengthExpr(i: Int, expr: ic.ast.Expr) {
    printIndentSpaces(i);
    println("Length Expr: ");
    printExpr(i + 1, expr);
  }

  def printBinExpr(i: Int, left: ic.ast.Expr, op: ic.ast.Binop, right: ic.ast.Expr) {
    printIndentSpaces(i);
    println("Bin Expr with: ");
    printExpr(i + 1, left);
    printBinop(i + 1, op);
    //print(" and right: ");
    printExpr(i + 1, right);
  }

  def printUnExpr(i: Int, op: ic.ast.Unop, expr: ic.ast.Expr) {
    printIndentSpaces(i);
    println("Un Expr: ");
    printUnop(i + 1, op);
    //print(" and expression: ");
    printExpr(i + 1, expr);
  }

  def printIntExpr(i: Int, value: Int) {
    printIndentSpaces(i);
    print("Integer Expr: ");
    println(value);
  }

  def printStringExpr(i: Int, value: String) {
    printIndentSpaces(i);
    print("String Expr: ");
    println(value);
  }

  def printBoolExpr(i: Int, value: Boolean) {
    printIndentSpaces(i);
    print("Boolean Expr: ");
    println(value);
  }

  def printNullExpr(i: Int) {
    printIndentSpaces(i);
    print("Null Expr. ");
  }

  //////////////////////    STATEMENT PRINT FUNCTIONS:     /////////////////////////
  def printBlockStatement(i: Int, vars: Seq[ic.ast.VarDecl], stmts: Seq[ic.ast.Stmt]) {
    printIndentSpaces(i);
    println("Block Statement!")
    for (variable <- vars) {
      printVarDecl(i + 1, variable.myType, variable.expr); //<- nul pointer java exception
    }
    for (statement <- stmts) {
      printStmt(i + 1, statement);
    }
  }

  def printLocStmt(i: Int, loc: ic.ast.Location, expr: ic.ast.Expr) {
    printIndentSpaces(i);
    println("Loc Statement: ");
    printLocation(i + 1, loc);
    printExpr(i + 1, expr);
  }

  def printCallStmt(i: Int, call: ic.ast.Call) {
    printIndentSpaces(i);
    println("Call Statement: ");
    printCall(i + 1, call);
  }

  def printIfStmt(i: Int, cond: ic.ast.Expr, then: ic.ast.Stmt, elseStmt: Option[ic.ast.Stmt]) {
    //IfStmt(cond: Expr, then: Stmt, elseStmt: Option[Stmt]) extends Stmt
    printIndentSpaces(i);
    println("If Statement: ");
    printExpr(i + 1, cond);
    //print(" then: ");
    printStmt(i + 1, then);
    //print(" else ");

    elseStmt match {
      case None => {
        // Do we want to do anything if an else stateemnt isn't provided? 
        printIndentSpaces(i + 1);
        println("No else statemnt");
      }
      case Some(e) => {
        printStmt(i + 1, e);
      }
    }
  }

  def printReturnStmt(i: Int, expr: Option[ic.ast.Expr]) {
    //ReturnStmt(expr: Option[Expr]) extends Stmt
    printIndentSpaces(i);
    println("Return Statement: ");

    expr match {
      case None => {
        println(" No Value Provided. ");
      }
      case Some(e) => {
        //println(" Value: ");
        printExpr(i + 1, e);
      }
    }
  }

  def printWhileStmt(i: Int, expr: ic.ast.Expr, stmt: ic.ast.Stmt) {
    printIndentSpaces(i);
    println("While Statement: ");
    printExpr(i + 1, expr);
    printStmt(i + 1, stmt);
  }

  def printBreakStmt(i: Int) {
    printIndentSpaces(i);
    println("Break Stmt.")
  }

  def printContinueStmt(i: Int) {
    printIndentSpaces(i);
    println("Continue Stmt.")
  }

  //////////////////////    TYPE PRINT FUNCTIONS:     /////////////////////////
  def printIntType(i: Int) {
    printIndentSpaces(i);
    println("Int type.");
  }

  def printStringType(i: Int) {
    printIndentSpaces(i);
    println("String type.");
  }

  def printBoolType(i: Int) {
    printIndentSpaces(i);
    println("Boolean type.");
  }

  def printClassType(i: Int, classId: String) {
    printIndentSpaces(i);
    print("Class type with ID: ");
    print(classId);
  }

  def printArrayType(i: Int, theType: ic.ast.Type) {
    printIndentSpaces(i);
    println("Array type element type: ");
    printType(i + 1, theType);
  }
  
  def printFunctionType(i: Int, returnType: ic.ast.Type, paramTypes: List[ic.ast.Type]) {
    printIndentSpaces(i);
    print("Function type: Return type: ");
    printType(i + 1, returnType);
    printIndentSpaces(i);
    println("Function type: Parameter types: ");
    for (pType <- paramTypes) {
      printType(i + 1, pType);
    }
  }

  //////////////////////    ASSIGNMENT PRINT FUNCTIONS:     /////////////////////////
  def printAssignVar(i: Int, id: String, expr: Option[ic.ast.Expr]) {
    printIndentSpaces(i);
    print("Assign Var expression to ID: ");
    println(id);

    expr match {
      case None => {
        // TODO: Do we want to note that there's no expression given or do nothing?
        printIndentSpaces(i + 1);
        print(" No expression given.");
      }
      case Some(e) => {
        printExpr(i + 1, e);
      }
    }
  }

  //////////////////////    VARIABLE PRINT FUNCTIONS:     /////////////////////////
  def printVar(i: Int, myType: ic.ast.Type, id: String) {
    printIndentSpaces(i);
    print("Var with ID: ");
    print(id);
    println(" and type: ");
    printType(i + 1, myType);
  }

  //////////////////////    FORMAL PRINT FUNCTIONS:     /////////////////////////
  def printFormal(i: Int, vars: Seq[ic.ast.Var]) {
    for (variable <- vars) {
      printVar(i + 1, variable.myType, variable.id);
    }
  }

  def printFormals(i: Int, formals: Seq[ic.ast.VarDecl]) {
    printIndentSpaces(i);
    println("Formals: ");
    for (formal <- formals) {
      printVar(i + 1, formal.myType, formal.id);
    }
  }

  //////////////////////    METHOD PRINT FUNCTIONS:     /////////////////////////
  def printVoidMethod(i: Int, id: String, formals: Seq[ic.ast.VarDecl], block: ic.ast.BlockStmt) {
    printIndentSpaces(i);
    print("Void Method of name: ");
    println(id);

    printFormals(i + 1, formals);

    printBlockStatement(i + 1, block.vars, block.stmts);

  }

  def printFruitfulMethod(i: Int, returnType: ic.ast.Type, id: String, formals: Seq[ic.ast.VarDecl], block: ic.ast.BlockStmt) {
    printIndentSpaces(i);
    print(id);
    println(" Method with type: ");

    printType(i + 1, returnType);

    printFormals(i + 1, formals);

    printBlockStatement(i + 1, block.vars, block.stmts);
  }

  //////////////////////    DECLARATION (DECL) PRINT FUNCTIONS:     /////////////////////////
  def printVarDecl(i: Int, myType: ic.ast.Type, expr: Option[ic.ast.Expr]) {
    printIndentSpaces(i);
    println("VarDecl of type: ");
    printType(i + 1, myType);

    // TODO: Possibly check to see if the length of the vars sequence is non-zero:
    expr match {
      case Some(e) => printExpr(i + 1, e);
      case None    =>
    }
  }

  def printClassDecl(i: Int, term: ic.ast.ClassDecl) {
    printIndentSpaces(i);
    print("Class Decl: ");
    print(term.classId);
    print(" extends ");
    println(term.extendsId);

    for (field <- term.fields) {
      printFieldDecl(i + 1, field);
    }

    for (method <- term.methods) {
      method match {
        case ic.ast.VoidMethod(id, formals, block, line) => {
          printVoidMethod(i + 1, id, formals, block)
        }
        case ic.ast.FruitfulMethod(returnType, id, formals, block, line) => {
          printFruitfulMethod(i + 1, returnType, id, formals, block);
        }
      }
    }
  }

  def printFieldDecl(i: Int, term: ic.ast.FieldDecl) {

    printIndentSpaces(i);
    println("Field decl of type: ");

    printType(i + 1, term.myType);

    printFieldID(i + 1, term.id);

    //    for (id <- term.ids){
    //      printFieldID(i+1, id);
    //    }
  }

}
