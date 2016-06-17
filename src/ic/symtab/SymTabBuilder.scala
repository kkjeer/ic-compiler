// Symbol Table Building Traversal: 
// Recursively traverse the abstract syntax tree. 
// Pass the current scope as an inherited attribute 

//Added an abstract class ASTNode, and extending everything else to ASTNode
//get class declaration and now it should give you the class's ASTNode
//

package ic.symtab

import ic.parser._
import ic.symtab._
import ic.ast._

object SymTabBuilder {

  def buildSymbols(currentScope: SymbolTable, node: ic.ast.ASTNode): Unit = {
    //big pattern match over node
    node match {

      case program: Program => {
        program.setSymTab(currentScope);
        for (classDecl <- program.classes) {
          buildSymbols(currentScope, classDecl);
        }
      }

      case cdecl: ClassDecl => {
        currentScope.add(cdecl.classId, cdecl);
        val classTable = new SymbolTable(cdecl.classId, currentScope.getClassParentTable(cdecl.extendsId, cdecl.line), Some(cdecl));
        cdecl.setSymTab(classTable);
        for (fieldDecl <- cdecl.fields) {
          buildSymbols(classTable, fieldDecl);
        }
        for (methodDecl <- cdecl.methods) {
          buildSymbols(classTable, methodDecl);
        }
      }

      case field: FieldDecl => {
        currentScope.add(field.id, field);
        field.setSymTab(currentScope);
        buildSymbols(currentScope, field.myType);
      }

      //Create a new SymbolTable for Method, Add parameters to the table, callBuildSymbols to get the contents
      //in the method

      case method: VoidMethod => {
        currentScope.add(method.id, method);
        val methodTable = new SymbolTable(method.id, Some(currentScope), None);
        method.setSymTab(methodTable);
        for (formal <- method.formals) {
          formal.setIsParam(true);
          buildSymbols(methodTable, formal);
        }
        buildSymbols(methodTable, method.block);
      }

      case method: FruitfulMethod => {
        currentScope.add(method.id, method);
        val methodTable = new SymbolTable(method.id, Some(currentScope), None);
        method.setSymTab(methodTable);
        method.returnType.setSymTab(methodTable);
        for (formal <- method.formals) {
          formal.setIsParam(true);
          buildSymbols(methodTable, formal);
        }
        buildSymbols(methodTable, method.block);
        buildSymbols(methodTable, method.returnType);
      }

      case vDecl: VarDecl => {
        currentScope.add(vDecl.id, vDecl);
        vDecl.setSymTab(currentScope);
        buildSymbols(currentScope, vDecl.myType);
        vDecl.expr match {
          case Some(e) => {
            buildSymbols(currentScope.parent.get, e);
          }
          case None => {

          }
        }
      }

      case block: BlockStmt => {
        val blockTable = new SymbolTable("Block", Some(currentScope), None);
        block.setSymTab(blockTable);

        for (varDecl <- block.vars) {
          buildSymbols(blockTable, varDecl);
        }

        for (stmt <- block.stmts) {
          buildSymbols(blockTable, stmt);
        }
      }

      case locStmt: LocStmt => {
        locStmt.setSymTab(currentScope);
        buildSymbols(currentScope, locStmt.loc);
        buildSymbols(currentScope, locStmt.expr);
      }

      case callStmt: CallStmt => {
        callStmt.setSymTab(currentScope);
        buildSymbols(currentScope, callStmt.call);
      }

      case returnStmt: ReturnStmt => {
        returnStmt.setSymTab(currentScope);
        returnStmt.expr match {
          case Some(e) => buildSymbols(currentScope, e);
          case None    =>
        }
      }

      case ifStmt: IfStmt => {
        val ifTable = new SymbolTable("if", Some(currentScope), None);
        ifStmt.setSymTab(ifTable);
        buildSymbols(ifTable, ifStmt.cond);
        buildSymbols(ifTable, ifStmt.then);
        ifStmt.elseStmt match {
          case Some(eStmt) => buildSymbols(ifTable, eStmt);
          case None        =>
        }
      }

      case whileStmt: WhileStmt => {
        val whileTable = new SymbolTable("while", Some(currentScope), None);
        whileStmt.setSymTab(whileTable);
        buildSymbols(whileTable, whileStmt.expr);
        buildSymbols(whileTable, whileStmt.stmt)
      }

      case functionStmt: FunctionStmt => {
//        var fcnFormals = functionStmt.formals;
//        var returnType = functionStmt.returnType;
//        var paramTypes = fcnFormals map (formal => formal.myType);
//        var fcnType = new FunctionType(returnType, paramTypes.toList, functionStmt.line);
//        var fcnExpr = new FunctionExpr(fcnFormals, returnType, functionStmt.block, functionStmt.line);
//        var fcnVarDecl = new VarDecl(fcnType, functionStmt.id, Some(fcnExpr), functionStmt.line);
//        fcnVarDecl.index = Some(0);
//        functionStmt.setSymTab(currentScope);
//        buildSymbols(currentScope, fcnVarDecl);
      }

      case locExpr: LocExpr => {
        locExpr.setSymTab(currentScope);
        buildSymbols(currentScope, locExpr.loc);
      }

      case callExpr: CallExpr => {
        callExpr.setSymTab(currentScope);
        buildSymbols(currentScope, callExpr.call);
      }

      case classExpr: ClassExpr => {
        classExpr.setSymTab(currentScope);
      }

      case thisExpr: ThisExpr => {
        var classDecl = currentScope.getThis();
        classDecl match {
          case Some(cDecl) => {
            thisExpr.setSymTab(cDecl.symtab.get);
            thisExpr.setDecl(cDecl);
          }
          case None => {}
        }
      }

      case arrayExpr: ArrayExpr => {
        arrayExpr.setSymTab(currentScope);
        buildSymbols(currentScope, arrayExpr.expr);
        buildSymbols(currentScope, arrayExpr.myType);
      }

      case lengthExpr: LengthExpr => {
        lengthExpr.setSymTab(currentScope);
        buildSymbols(currentScope, lengthExpr.expr);
      }

      case binExpr: BinExpr => {
        binExpr.setSymTab(currentScope);
        buildSymbols(currentScope, binExpr.left);
        buildSymbols(currentScope, binExpr.right);
      }

      case unExpr: UnExpr => {
        unExpr.setSymTab(currentScope);
        buildSymbols(currentScope, unExpr.expr);
      }

      case functionExpr: FunctionExpr => {
        var functionTable = new SymbolTable("Function Expression " + functionExpr, Some(currentScope), None);
        functionExpr.setSymTab(functionTable);
        for (formal <- functionExpr.formals) {
          formal.setIsParam(true);
          buildSymbols(functionTable, formal);
        }
        buildSymbols(functionTable, functionExpr.block);
      }

      case libCall: LibCall => {
        libCall.setSymTab(currentScope);
        for (e <- libCall.exprs) {
          buildSymbols(currentScope, e);
        }
      }

      case virtualCall: VirtualCall => {
        virtualCall.setSymTab(currentScope);
        virtualCall.expr match {
          case Some(e) => {
            buildSymbols(currentScope, e);
          }
          case None => {}
        }
        for (e <- virtualCall.exprs) {
          buildSymbols(currentScope, e);
        }
      }

      case functionCall: FunctionCall => {
        functionCall.setSymTab(currentScope);
        for (e <- functionCall.exprs) {
          buildSymbols(currentScope, e);
        }
      }
      
      case anonCall: AnonCall => {
        anonCall.setSymTab(currentScope);
        buildSymbols(currentScope, anonCall.fcnExpr);
        for (e <- anonCall.exprs) {
          buildSymbols(currentScope, e);
        }
      }

      case idLoc: IdLoc => {
        idLoc.setSymTab(currentScope);
      }

      case dotLoc: DotLoc => {
        dotLoc.setSymTab(currentScope);
        buildSymbols(currentScope, dotLoc.expr);
      }

      case arrayLoc: ArrayLoc => {
        arrayLoc.setSymTab(currentScope);
        buildSymbols(currentScope, arrayLoc.e1);
        buildSymbols(currentScope, arrayLoc.e2);
      }

      case variable: Var => {
        variable.setSymTab(currentScope);
        buildSymbols(currentScope, variable.myType);
      }

      case assignVar: AssignVar => {
        assignVar.setSymTab(currentScope);
        assignVar.expr match {
          case Some(e) => {
            buildSymbols(currentScope, e);
          }
          case None => {}
        }
      }

      case classType: ClassType => {
        classType.setSymTab(currentScope);
      }

      case arrayType: ArrayType => {
        arrayType.setSymTab(currentScope);
        buildSymbols(currentScope, arrayType.theType);
      }

      case _ => {}

    }

  }

}
