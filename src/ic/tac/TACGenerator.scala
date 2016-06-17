package ic.tac

import ic.ast._
import ic.symtab._
import ic.error._
import scala.collection.mutable._

object TACGenerator {
  var lastString = 0;
  var tacStrings = List[TacString]();

  /*
   * generateTAC()
   * Generates TAC for each class in the program
   * Top-level TAC generation function
   */
  def generateTAC(program: Program) = {
    for (cDecl <- program.classes) {
      tacForClass(cDecl);
    }
    program.setTacStrings(tacStrings);
  }

  /*
   * printTAC()
   * Pretty-prints the TACList for each method in each class of the program
   */
  def printTAC(program: Program) = {
    for (cDecl <- program.classes) {
      println("Tac for class " + cDecl.classId);
      for (mDecl <- cDecl.methods) {
        println("Tac for method " + mDecl.id + " in class " + cDecl.classId);
        println(mDecl.getTacList());
        println();
      }
    }
  }

  /*
   * printTemps()
   * Pretty-prints the temporary variables and offsets for each method in each class of the program
   */
  def printTemps(program: Program) = {
    for (cDecl <- program.classes) {
      for (mDecl <- cDecl.methods) {
        println("Max local var offset for method " + mDecl.id + ": " + mDecl.maxVarIndex.get);
        println("Temp vars for method " + mDecl.id + ":");
        println(mDecl.getTacList().tempsString());
        println();
      }
    }
  }

  /*
   * tacForClass()
   * Generates TAC for each method in the class
   */
  def tacForClass(cDecl: ClassDecl) = {
    for (mDecl <- cDecl.methods) {
      var tacList = new TACList();
      tacList.setMethodName(cDecl.classId + "_" + mDecl.id);
      tacStmt(mDecl.block, tacList, None, None);
      mDecl.setTacList(tacList);
    }
  }

  /*
   * tacForMethod()
   * Generates a list of TAC instructions for the method
   * 	and sets the method's tacList to a new TACList with the generated instruction list
   */
  def tacForMethod(mDecl: MethodDecl) = {
    var tacList = new TACList();
    tacStmt(mDecl.block, tacList, None, None);
    mDecl.setTacList(tacList);
  }

  /*Statement translation functions*/

  /*
   * tacStmt
   * Generates TAC for a statement
   * Top-level statement translation function
9   */
  def tacStmt(stmt: Stmt, tacList: TACList, loopStart: Option[TacLabel], loopEnd: Option[TacLabel]) = {
    stmt match {
      case blockStmt: BlockStmt => {
        tacBlock(blockStmt, tacList, loopStart, loopEnd);
      }
      case locStmt: LocStmt => {
        tacLoc(locStmt, tacList);
      }
      case callStmt: CallStmt => {
        tacCall(callStmt.call, tacList);
      }
      case returnStmt: ReturnStmt => {
        tacReturn(returnStmt, tacList);
      }
      case ifStmt: IfStmt => {
        tacIf(ifStmt, tacList, loopStart, loopEnd);
      }
      case whileStmt: WhileStmt => {
        tacWhile(whileStmt, tacList, loopStart, loopEnd);
      }
      case breakStmt: BreakStmt => {
        tacBreak(breakStmt, tacList, loopStart, loopEnd);
      }
      case continueStmt: ContinueStmt => {
        tacContinue(continueStmt, tacList, loopStart, loopEnd);
      }
      case _ => {}
    }
  }

  /*
   * tacBlock()
   * Generates TAC for a block statement
   */
  def tacBlock(blockStmt: BlockStmt, tacList: TACList, loopStart: Option[TacLabel], loopEnd: Option[TacLabel]): Unit = {
    //translate each variable declaration
    for (vDecl <- blockStmt.vars) {
      tacVarDecl(vDecl, tacList);
    }

    //recursively translate each sub-statement
    for (stmt <- blockStmt.stmts) {
      tacStmt(stmt, tacList, loopStart, loopEnd);
    }
  }

  /*
   * tacVarDecl()
   * Generates TAC for variable declarations:
   * 	both T a = b and T a
   */
  def tacVarDecl(vDecl: VarDecl, tacList: TACList) = {
    vDecl.expr match {
      //declaring and initializing: T a = b
      case Some(e) => {
        var exprResult = tacExpr(e, tacList);
        var programVar = new TacLocal(vDecl);
        var instr = new TacCopy(programVar, exprResult);
        tacList.addInstr(instr);
      }
      //just declaring, not initializing: T a
      //nothing - no instructions
      case None => {

      }
    }
  }

  /*
   * tacLoc()
   * Generates TAC for assignment statements
   */
  def tacLoc(locStmt: LocStmt, tacList: TACList) = {
    //get the result of the right-hand expression
    var exprResult = tacExpr(locStmt.expr, tacList);

    locStmt.loc match {
      //idLoc: a = b
      case idLoc: IdLoc => {
        //        var programVar = new TacLocal(idLoc.decl.get);
        //        var instr = new TacCopy(programVar, exprResult);
        //        tacList.addInstr(instr);

        var idDecl = idLoc.decl.get;
        idDecl match {
          //var declaration: variable store
          case vDecl: VarDecl => {
            var programVar = new TacLocal(vDecl);
            var instr = new TacCopy(programVar, exprResult);
            tacList.addInstr(instr);
          }
          //field declaration: field store
          case fDecl: FieldDecl => {
            var tempVar = tacList.genTemp();

            //create an object for the implicit "this"
            var thisDecl = idLoc.symtab.get.getThis().get;
            var thisObj = new TacThis(thisDecl);

            //check that the thisObj isn't null
            var nullCheck = new TacNullCheck(thisObj);
            tacList.addInstr(nullCheck);

            //create a new instruction storing the exprResult into the field
            var instr = new TacFieldStore(thisObj, fDecl, exprResult);
            tacList.addInstr(instr);
          }
        }
      }

      //dotLoc: e.f = b
      case dotLoc: DotLoc => {
        //translate the sub-expression object
        var fieldObj = tacExpr(dotLoc.expr, tacList);

        //check that fieldObj isn't null
        var nullCheck = new TacNullCheck(fieldObj);
        tacList.addInstr(nullCheck);

        //get the field declaration of the accessed field
        var fieldDecl = dotLoc.decl.get;

        //store the right-hand expression into the field
        var instr = new TacFieldStore(fieldObj, fieldDecl, exprResult);
        tacList.addInstr(instr);
      }

      //arrayLoc: a[i] = b
      case arrayLoc: ArrayLoc => {
        //translate the two subexpressions (array and index)
        var arrayResult = tacExpr(arrayLoc.e1, tacList);
        var indexResult = tacExpr(arrayLoc.e2, tacList);

        //check that the arrayResult isn't null
        var arrayNullCheck = new TacNullCheck(arrayResult);
        tacList.addInstr(arrayNullCheck);

        //check that the index is in bounds (0 <= index <= array.length)
        var boundsCheck = new TacBoundsCheck(indexResult, arrayResult);
        tacList.addInstr(boundsCheck);

        //store the right-hand expression into arrayResult[indexResult]
        var instr = new TacArrayStore(arrayResult, indexResult, exprResult);
        tacList.addInstr(instr);
      }
    }
  }

  /*
   * tacCall()
   * Generates TAC for method calls
   */
  def tacCall(call: Call, tacList: TACList) = {
    call match {
      case vCall: VirtualCall => {
        tacVirtualCall(vCall, tacList);
      }
      case lCall: LibCall => {
        tacLibCall(lCall, tacList);
      }
    }
  }

  def tacVirtualCall(virtualCall: VirtualCall, tacList: TACList) = {
    //get the function that's being called (method decl of virtual method)
    var methodDecl = virtualCall.decl.get;
    //var methodProgramVar = new TacLocal(methodDecl);

    //get the receiver: either some object with class type (including explicit this) or implicit this
    var receiver = new TacOperand();
    virtualCall.expr match {
      //some object with class type
      case Some(e) => {
        receiver = tacExpr(e, tacList);
      }
      //implicit this
      case None => {
        var thisDecl = virtualCall.symtab.get.getThis().get;
        receiver = new TacThis(thisDecl);
      }
    }

    //list of parameters (will be an operand to the call instruction)
    var paramOperands = List[TacOperand]();

    //recursively translate and get the result of each parameter
    for (param <- virtualCall.exprs) {
      var paramResult = tacExpr(param, tacList);
      paramOperands :+= paramResult;
    }

    //call the function
    tacList.addInstr(TacNullCheck(receiver))
    var callInstr = new TacVirtualCall(receiver, methodDecl, paramOperands);
    tacList.addInstr(callInstr);
  }

  def tacLibCall(libCall: LibCall, tacList: TACList) = {
    //list of parameters (will be an operand to the call instruction)
    var paramOperands = List[TacOperand]();

    //recursively translate and get the result of each parameter
    for (param <- libCall.exprs) {
      var paramResult = tacExpr(param, tacList);
      paramOperands :+= paramResult;
    }

    //call the function
    var callInstr = new TacLibCall(libCall.id, paramOperands);
    tacList.addInstr(callInstr);
  }

  /*
   * tacReturn()
   * Generates TAC for return statements
   * Either TacReturnValue (return a) or TacReturn (return)
   */
  def tacReturn(returnStmt: ReturnStmt, tacList: TACList) = {
    returnStmt.expr match {
      //returning an expression
      case Some(e) => {
        var exprResult = tacExpr(e, tacList);

        var instr = new TacReturnValue(exprResult);
        tacList.addInstr(instr);
      }
      //just returning, no expression
      case None => {
        var instr = new TacReturn();
        tacList.addInstr(instr);
      }
    }
  }

  /*
   * tacIf()
   * Generates TAC for if statements
   * Includes an optional else case
   */
  def tacIf(ifStmt: IfStmt, tacList: TACList, loopStart: Option[TacLabel], loopEnd: Option[TacLabel]): Unit = {
    //generate temp var to hold condition result
    var condTemp = tacList.genTemp();

    //translate and add the condition expression
    var condResult = tacExpr(ifStmt.cond, tacList);

    //store the condition result into the condition temp var and add the store instruction
    var storeCond = new TacCopy(condTemp, condResult);
    storeCond.setComment("condition for if on line " + ifStmt.line);
    tacList.addInstr(storeCond);

    //generate temp var to hold !condition
    var notCondTemp = tacList.genTemp();

    //store !condition into notCondTemp and add the store instruction
    var storeNotCond = new TacUnInstr(notCondTemp, new Not(0), condResult);
    tacList.addInstr(storeNotCond);

    //generate label for end of if statement
    var endLabel = tacList.genIfLabel();

    //check for an else case
    ifStmt.elseStmt match {
      //has an "else"
      case Some(s) => {
        //generate a label for the else branch
        var elseLabel = tacList.genElseLabel();

        //cjump notCondTemp elseLabel
        var cjump = new TacCJump(notCondTemp, elseLabel);
        tacList.addInstr(cjump);

        //add the "then" instructions
        tacStmt(ifStmt.then, tacList, loopStart, loopEnd);

        //add jump endIf
        var jumpToEnd = new TacJump(endLabel);
        tacList.addInstr(jumpToEnd);

        //add label else
        tacList.addInstr(elseLabel);

        //recursively translate and add the "else" statement
        tacStmt(s, tacList, loopStart, loopEnd);
      }

      //no else, just an if
      case None => {
        //cjump notCondTemp end
        var cjump = new TacCJump(notCondTemp, endLabel);
        tacList.addInstr(cjump);

        //add the "then" instructions
        tacStmt(ifStmt.then, tacList, loopStart, loopEnd);
      }
    }

    //add the end label
    tacList.addInstr(endLabel);
  }

  /*
   * tacWhile()
   * Generates TAC for while statements
   * Creates labels for loopStart and loopEnd that are passed into recursive statement translation
   */
  def tacWhile(whileStmt: WhileStmt, tacList: TACList, loopStart: Option[TacLabel], loopEnd: Option[TacLabel]): Unit = {
    //generate the start label
    var startLabel = tacList.genWhileStartLabel();

    //add the start label
    tacList.addInstr(startLabel);

    //generate the end label
    var endLabel = tacList.genWhileEndLabel();

    //generate temporary var to hold result of condition expression
    var conditionTemp = tacList.genTemp();

    //translate the condition expression
    var conditionResult = tacExpr(whileStmt.expr, tacList);

    //store the condition in the condition temp var
    var storeCond = new TacCopy(conditionTemp, conditionResult);
    storeCond.setComment("condition for while loop on line " + whileStmt.line);
    tacList.addInstr(storeCond);

    //generate a new temporary variable to hold !condition
    var notConditionTemp = tacList.genTemp();

    //store !condition in notConditionTemp
    var storeNotCond = new TacUnInstr(notConditionTemp, new Not(0), conditionResult);
    tacList.addInstr(storeNotCond);

    //cjump notConditionTemp whileEnd
    var cJump = new TacCJump(notConditionTemp, endLabel);
    cJump.setComment("test for while loop on line " + whileStmt.line);
    tacList.addInstr(cJump);

    //recursively translate the sub-statement
    tacStmt(whileStmt.stmt, tacList, Some(startLabel), Some(endLabel));

    //jump whileStart
    var jump = new TacJump(startLabel);
    tacList.addInstr(jump);

    //add the end label
    tacList.addInstr(endLabel);
  }

  /*
   * tacBreak()
   * Generates TAC for break statements
   * Jumps to the end of the innermost containing loop (loopEnd)
   */
  def tacBreak(breakStmt: BreakStmt, tacList: TACList, loopStart: Option[TacLabel], loopEnd: Option[TacLabel]) = {
    loopEnd match {
      case Some(lEnd) => {
        var jump = new TacJump(lEnd);
        jump.setComment("break to end of loop " + lEnd);
        tacList.addInstr(jump);
      } case None => {
        throw new TacError("cannot break to nonexistent label");
      }
    }
  }

  /*
   * tacContinue()
   * Generates TAC for continue statements
   * Jumps to the beginning of the innermost containing loop (loopStart)
   */
  def tacContinue(continueStmt: ContinueStmt, tacList: TACList, loopStart: Option[TacLabel], loopEnd: Option[TacLabel]) = {
    loopStart match {
      case Some(lStart) => {
        var jump = new TacJump(lStart);
        jump.setComment("continue to beginning of loop " + lStart);
        tacList.addInstr(jump);
      } case None => {
        throw new TacError("cannot continue to nonexistent label");
      }
    }
  }

  /*Expression translation functions*/

  /*
   * tacExpr()
   * Generates TAC for expressions
   * The last instruction in each list stores the result of the expression in a temporary variable
   * Top-level expression translation function
   */
  def tacExpr(expr: Expr, tacList: TACList): TacOperand = {
    expr match {
      case locExpr: LocExpr => {
        return tacLocExpr(locExpr, tacList);
      }
      case callExpr: CallExpr => {
        return tacCallExpr(callExpr.call, tacList);
      }
      case thisExpr: ThisExpr => {
        return tacThisExpr(thisExpr, tacList);
      }
      case classExpr: ClassExpr => {
        return tacClassExpr(classExpr, tacList);
      }
      case arrayExpr: ArrayExpr => {
        return tacArrayExpr(arrayExpr, tacList);
      }
      case lengthExpr: LengthExpr => {
        return tacLengthExpr(lengthExpr, tacList);
      }
      case binExpr: BinExpr => {
        return tacBinExpr(binExpr, tacList);
      }
      case unExpr: UnExpr => {
        return tacUnExpr(unExpr, tacList);
      }
      case intExpr: IntExpr => {
        return tacIntExpr(intExpr, tacList);
      }
      case stringExpr: StringExpr => {
        return tacStringExpr(stringExpr, tacList);
      }
      case boolExpr: BoolExpr => {
        return tacBoolExpr(boolExpr, tacList);
      }
      case nullExpr: NullExpr => {
        return tacNullExpr(nullExpr, tacList);
      }
      case _ => { return new TacInt(0); }
    }
  }

  /*
   * tacLocExpr()
   * Generates TAC for location expressions
   */
  def tacLocExpr(locExpr: LocExpr, tacList: TACList): TacOperand = {
    locExpr.loc match {
      //idLoc: variable reference
      case idLoc: IdLoc => {
        var idDecl = idLoc.decl.get;
        idDecl match {
          //var declaration: variable access
          case vDecl: VarDecl => {
            var programVar = new TacLocal(vDecl);
            return programVar;
          }
          //field declaration: field access
          case fDecl: FieldDecl => {
            var tempVar = tacList.genTemp();

            var thisDecl = idLoc.symtab.get.getThis().get;
            var thisObj = new TacThis(thisDecl);

            //check that the thisObj isn't null
            var nullCheck = new TacNullCheck(thisObj);
            tacList.addInstr(nullCheck);

            //create a new instruction loading the field into a temporary variable
            var instr = new TacFieldLoad(tempVar, thisObj, fDecl);
            tacList.addInstr(instr);

            return tempVar;
          }
        }
      }

      //dotLoc: field access
      case dotLoc: DotLoc => {
        var tempVar = tacList.genTemp();

        //recursively translate the sub-expression object
        var fieldObj = tacExpr(dotLoc.expr, tacList);

        //check that the fieldObj isn't null
        var nullCheck = new TacNullCheck(fieldObj);
        tacList.addInstr(nullCheck);

        //get the field declaration of the accessed field
        var fieldDecl = dotLoc.decl.get;

        //create a new instruction loading the field into a temporary variable
        var instr = new TacFieldLoad(tempVar, fieldObj, fieldDecl);
        tacList.addInstr(instr);

        return tempVar;
      }

      //arrayLoc: array access
      case arrayLoc: ArrayLoc => {
        var tempVar = tacList.genTemp();

        //recursively translate the two subexpressions (array and index)
        var arrayResult = tacExpr(arrayLoc.e1, tacList);
        var indexResult = tacExpr(arrayLoc.e2, tacList);

        //create a new instruction loading arrayResult[indexResult] into a temporary variable
        tacList.addInstr(TacNullCheck(arrayResult))
        tacList.addInstr(TacBoundsCheck(indexResult, arrayResult))
        var instr = new TacArrayLoad(tempVar, arrayResult, indexResult);
        tacList.addInstr(instr);

        return tempVar;
      }
    }
  }

  /*
   * tacCallExpr()
   * Generates TAC for method calls
   */
  def tacCallExpr(call: Call, tacList: TACList): TacOperand = {
    call match {
      case vCall: VirtualCall => {
        return tacVirtualCallExpr(vCall, tacList);
      }
      case lCall: LibCall => {
        return tacLibCallExpr(lCall, tacList);
      }
      //TODO
      case fCall: FunctionCall => {
        return new TacInt(0);
      }
      //TODO
      case aCall: AnonCall => {
        return new TacInt(0);
      }
    }
  }

  /*
   * tacVirtualCallExpr()
   * Generates TAC for virtual method call expressions (returns the result operand)
   */
  def tacVirtualCallExpr(virtualCall: VirtualCall, tacList: TACList): TacOperand = {
    //generate temporary variable to hold call result
    var tempVar = tacList.genTemp();

    //get the function that's being called (method decl of virtual method)
    var methodDecl = virtualCall.decl.get;
    //var methodProgramVar = new TacLocal(methodDecl);

    //get the receiver: either some object with class type (including explicit this) or implicit this
    var receiver = new TacOperand();
    virtualCall.expr match {
      //some object with class type
      case Some(e) => {
        receiver = tacExpr(e, tacList);
      }
      //implicit this
      case None => {
        var thisDecl = virtualCall.symtab.get.getThis().get;
        receiver = new TacThis(thisDecl);
      }
    }

    //list of parameters (will be an operand to the call instruction)
    var paramOperands = List[TacOperand]();

    //recursively translate and get the result of each parameter
    for (param <- virtualCall.exprs) {
      var paramResult = tacExpr(param, tacList);
      paramOperands :+= paramResult;
    }

    //store the result of the call into tempVar
    tacList.addInstr(TacNullCheck(receiver))
    var storeInstr = new TacVirtualCallResult(tempVar, receiver, methodDecl, paramOperands);
    tacList.addInstr(storeInstr);

    return tempVar;
  }

  /*
   * tacLibCallExpr()
   * Generates TAC for library method call expressions (returns a result operand)
   */
  def tacLibCallExpr(libCall: LibCall, tacList: TACList): TacOperand = {
    //generate a temporary variable to hold the result of the call
    var tempVar = tacList.genTemp();

    //list of parameters (will be an operand to the call instruction)
    var paramOperands = List[TacOperand]();

    //recursively translate and get the result of each parameter
    for (param <- libCall.exprs) {
      var paramResult = tacExpr(param, tacList);
      paramOperands :+= paramResult;
    }

    //store the reuslt of the call into tempVar
    var storeInstr = new TacLibCallResult(tempVar, libCall.id, paramOperands);
    tacList.addInstr(storeInstr);

    return tempVar;
  }

  /*
   * tacThisExpr()
   * Generates TAC for "this" expressions
   * Result is a ProgramVar that holds the class declaration for the this expression
   */
  def tacThisExpr(thisExpr: ThisExpr, tacList: TACList): TacOperand = {
    //create a temporary variable to store the result
    var tempVar = tacList.genTemp();

    //store this in a program variable
    var programVar = new TacThis(thisExpr.decl.get);

    //copy the program variable into the result
    var instr = new TacCopy(tempVar, programVar);
    tacList.addInstr(instr);

    return tempVar;
  }

  /*
   * tacClassExpr
   * Generates TAC for class expressions (a = new C())
   */
  def tacClassExpr(classExpr: ClassExpr, tacList: TACList): TacOperand = {
    //create a temporary variable to store the result
    var tempVar = tacList.genTemp();

    //create a new instruction storing the new object into tempVar
    var instr = new TacNewObject(tempVar, classExpr.decl.get);
    tacList.addInstr(instr);

    return tempVar;
  }

  /*
   * tacArrayExpr()
   * Generates TAC for array expressions (a = new T[size])
   */
  def tacArrayExpr(arrayExpr: ArrayExpr, tacList: TACList): TacOperand = {
    //create a temporary variable to store the result
    var tempVar = tacList.genTemp();

    //recursively translate the size sub-expression
    var sizeResult = tacExpr(arrayExpr.expr, tacList);

    //check that the size isn't negative
    var sizeCheck = new TacSizeCheck(sizeResult);
    tacList.addInstr(sizeCheck);

    //create a new instruction storing the new array into tempVar
    var instr = new TacArrayCreation(tempVar, sizeResult);
    tacList.addInstr(instr);

    return tempVar;
  }

  /*
   * tacLengthExpr()
   * Generates TAC for length expression (a = b.length)
   */
  def tacLengthExpr(lengthExpr: LengthExpr, tacList: TACList): TacOperand = {
    //create a temporary variable to store the result
    var tempVar = tacList.genTemp();

    //recursively translate the array sub-expression
    var arrayResult = tacExpr(lengthExpr.expr, tacList);

    //check non-null array
    var nullCheck = new TacNullCheck(arrayResult);
    tacList.addInstr(nullCheck);

    //create a new instruction storing the length into tempVar
    var instr = new TacLengthLoad(tempVar, arrayResult);
    tacList.addInstr(instr);

    return tempVar;
  }

  /*
   * tacBinExpr()
   * Generates TAC for binary expression (arithmetic, comparisons, and logic)
   */
  def tacBinExpr(binExpr: BinExpr, tacList: TACList): TacOperand = {
    //create a temporary variable to store the result
    var tempVar = tacList.genTemp();

    //different behavior based on binary operation
    binExpr.op match {
      //plus: handle string concatenation
      case plus: Plus => {
        //recursively translate the left and right sub-expressions
        var leftResult = tacExpr(binExpr.left, tacList);
        var rightResult = tacExpr(binExpr.right, tacList);

        (binExpr.left.getType(), binExpr.right.getType()) match {
          //adding two ints => binary instruction
          case (i1: IntType, i2: IntType) => {
            var instr = new TacBinInstr(tempVar, leftResult, binExpr.op, rightResult);
            tacList.addInstr(instr);
          }
          //concatenating two strings => call Library.stringConcat()
          case (s1: StringType, s2: StringType) => {
            var params = List(leftResult, rightResult);
            var libCall = new TacLibCallResult(tempVar, "stringCat", params);
            tacList.addInstr(libCall);
          }
        }

      }

      //no special behavior needed: minus, mult, comparisons
      case Minus(_) | Mult(_) | Less(_) | LessEq(_) | Greater(_) | GreaterEq(_) | Equal(_) | NotEqual(_) => {
        //recursively translate the left and right sub-expressions
        var leftResult = tacExpr(binExpr.left, tacList);
        var rightResult = tacExpr(binExpr.right, tacList);

        //create a new instruction storing the binary result into tempVar
        var instr = new TacBinInstr(tempVar, leftResult, binExpr.op, rightResult);
        tacList.addInstr(instr);
      }

      //arithmetic: div, mod (check for 0)
      case Div(_) | Mod(_) => {
        //recursively translate the right sub-expression
        var rightResult = tacExpr(binExpr.right, tacList);

        //check that the right expression isn't 0
        var zeroCheck = new TacZeroCheck(rightResult);
        tacList.addInstr(zeroCheck);

        //recursively translate the left sub-expression
        var leftResult = tacExpr(binExpr.left, tacList);

        //create a new instruction storing the binary result into tempVar
        var instr = new TacBinInstr(tempVar, leftResult, binExpr.op, rightResult);
        tacList.addInstr(instr);
      }

      //logic: short-circuit and
      case and: And => {
        //recursively translate the left sub-expression
        var leftResult = tacExpr(binExpr.left, tacList);

        //store left into the result var
        var leftStore = new TacCopy(tempVar, leftResult);
        tacList.addInstr(leftStore);

        //create a temp var to hold !left
        var notLeftTemp = tacList.genTemp();

        //store !left (left is stored in tempVar) into the not left temp var
        var notLeftInstr = new TacUnInstr(notLeftTemp, new Not(0), tempVar);
        tacList.addInstr(notLeftInstr);

        //generate the end label
        var endLabel = tacList.genAndLabel();

        //if left is false (so if notLeftTemp is true), jump to the end of the and
        var cJump = new TacCJump(notLeftTemp, endLabel);
        tacList.addInstr(cJump);

        //recursively translate the right sub-expression
        var rightResult = tacExpr(binExpr.right, tacList);

        //store right into the result var
        var rightStore = new TacCopy(tempVar, rightResult);
        tacList.addInstr(rightStore);

        //label the end of the and
        tacList.addInstr(endLabel);
      }

      //logic: short-circuit or
      case or: Or => {
        //recursively translate the left sub-expression
        var leftResult = tacExpr(binExpr.left, tacList);

        //store the left expression into the result temp var
        var leftTempInstr = new TacCopy(tempVar, leftResult);
        tacList.addInstr(leftTempInstr);

        //generate the endOr label
        var endLabel = tacList.genOrLabel();

        //if the left expression (stored in the result temp var) is true, jump to the end of the or
        var cJump = new TacCJump(tempVar, endLabel);
        tacList.addInstr(cJump);

        //recursively translate the right sub-expression
        var rightResult = tacExpr(binExpr.right, tacList);

        //store the right expression into the temp var that holds the result
        var rightTempInstr = new TacCopy(tempVar, rightResult);
        tacList.addInstr(rightTempInstr);

        //label the end
        tacList.addInstr(endLabel);
      }
    }

    return tempVar;
  }

  /*
   * tacUnExpr()
   * Generates TAC for unary expressions (negative and not)
   */
  def tacUnExpr(unExpr: UnExpr, tacList: TACList): TacOperand = {
    //create a temporary variable to store the result
    var tempVar = tacList.genTemp();

    //recursively translate the sub-expression
    var subResult = tacExpr(unExpr.expr, tacList);

    //create a new instruction storing the unary result into tempVar
    var instr = new TacUnInstr(tempVar, unExpr.op, subResult);
    tacList.addInstr(instr);

    return tempVar;
  }

  /*
   * tacIntExpr()
   * Generates TAC for int expressions (integer literals)
   */
  def tacIntExpr(intExpr: IntExpr, tacList: TACList): TacOperand = {
    //create an integer constant operand
    var intOperand = new TacInt(intExpr.value);
    return intOperand;
  }

  /*
   * tacStringExpr()
   * Generates TAC for string expressions (string literals)
   */
  def tacStringExpr(stringExpr: StringExpr, tacList: TACList): TacOperand = {
    //create a string constant operand
    var stringOperand = new TacString(stringExpr.value);
    stringOperand.setId(lastString);
    lastString += 1;
    tacStrings :+= stringOperand;
    return stringOperand;
  }

  /*
   * tacBoolExpr()
   * Generates TAC for boolean expressions (boolean literals)
   */
  def tacBoolExpr(boolExpr: BoolExpr, tacList: TACList): TacOperand = {
    //create a boolean constant operand
    var boolOperand = new TacBool(boolExpr.value);
    return boolOperand;
  }

  /*
   * tacNullExpr()
   * Generates TAC for null expressions (Null)
   */
  def tacNullExpr(nullExpr: NullExpr, tacList: TACList): TacOperand = {
    //create a null constant operand
    var nullOperand = new TacNull();
    return nullOperand
  }

  /*Helper functions*/

  /*
   * getLastDest()
   * Returns the destination of the last instruction of the given list
   */
  def getLastDest(tacList: List[TacInstr]): TacOperand = {
    if (tacList.length == 0) {
      throw new TacError("Cannot get last dest of empty list");
    }
    return getDest(tacList(tacList.length - 1));
  }

  /*
   * getDest()
   * Returns the destination of the given operand
   * Throws an error if no destination exists
   */
  def getDest(TacInstr: TacInstr): TacOperand = {
    TacInstr match {
      case unInstr: TacUnInstr => {
        return unInstr.dest;
      }
      case binInstr: TacBinInstr => {
        return binInstr.dest;
      }
      case copyInstr: TacCopy => {
        return copyInstr.dest;
      }
      case arrayLoad: TacArrayLoad => {
        return arrayLoad.dest;
      }
      case arrayCreation: TacArrayCreation => {
        return arrayCreation.dest;
      }
      case lengthLoad: TacLengthLoad => {
        return lengthLoad.dest;
      }
      case fieldLoad: TacFieldLoad => {
        return fieldLoad.dest;
      }
      case virtualResult: TacVirtualCallResult => {
        return virtualResult.dest;
      }
      case libResult: TacLibCallResult => {
        return libResult.dest;
      }
      case newObject: TacNewObject => {
        return newObject.dest;
      }
      case _ => {
        throw new TacError("cannot retrieve destination for TAC instruction " + TacInstr);
      }
    }
  }
}

