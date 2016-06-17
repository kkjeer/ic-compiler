package ic.tc

import ic.ast._
import ic.symtab._
import ic.error._
import scala.collection.mutable._

object TypeChecker {
  //stores library call types
  //each list of types contains argType_0, argType_1, ..., argType_n, returnType
  val libTypes: Map[String, List[Type]] = Map[String, List[Type]]();

  //print functions
  libTypes("println") = List(new StringType(0), new VoidType(0));
  libTypes("print") = List(new StringType(0), new VoidType(0));
  libTypes("printi") = List(new IntType(0), new VoidType(0));
  libTypes("printb") = List(new BoolType(0), new VoidType(0));

  //read functions
  libTypes("readi") = List(new IntType(0));
  libTypes("readln") = List(new StringType(0));
  libTypes("eof") = List(new BoolType(0));

  //conversion functions
  libTypes("stoi") = List(new StringType(0), new IntType(0), new IntType(0));
  libTypes("itos") = List(new IntType(0), new StringType(0));
  libTypes("stoa") = List(new StringType(0), new ArrayType(new IntType(0), 0));
  libTypes("atos") = List(new ArrayType(new IntType(0), 0), new StringType(0));

  //other functions
  libTypes("random") = List(new IntType(0), new IntType(0));
  libTypes("time") = List(new IntType(0));
  libTypes("exit") = List(new IntType(0), new VoidType(0));

  /*
   * checkProgram()
   * Root method: type checks one Program AST node
   * Returns true iff program type checks, throws TypeError otherwise
   */
  def checkProgram(program: Program): Boolean = {
    checkNumMainDecls(program);
    return checkClassesInProgram(program);
  }

  /*
   * checkNumMainDecls()
   * Checks that a Program contains exactly one main method
   * Checks the signature of the main method, i.e. a program can contain
   * more than one method named "main", if only one has the correct main signature
   */
  def checkNumMainDecls(program: ic.ast.Program): Boolean = {
    var numMainDecls = 0;
    var lastMainLineNumber = 0;
    for (classDecl <- program.classes) {
      for (methodDecl <- classDecl.methods) {
        //found a method with id "main": check the signature
        if (methodDecl.id == "main") {
          methodDecl match {
            //found void method with id "main": check the arguments
            case v: VoidMethod => {
              //found void method with one argument: check the argument type
              if (methodDecl.formals.size == 1) {
                methodDecl.formals(0).myType match {
                  case aType: ArrayType => {
                    aType.theType match {
                      //found a void method named main that takes one string [] argument
                      case sType: StringType => {
                        numMainDecls += 1;
                        lastMainLineNumber = sType.line;
                      }
                      //takes an array, but not a string array
                      case _ => {}
                    }
                  }
                  //takes one parameter, but it's not an array
                  case _ => {}
                }
              }
            }
            //not a void method
            case _ => {}
          }
        }
      }
    }

    //check for one and only one main method
    numMainDecls match {
      case 0 => {
        throw new TypeError(0, "Program must contain at least one main method.");
      }
      case 1 => {
        return true;
      }
      case _ => {
        throw new TypeError(lastMainLineNumber, "Too many main methods: expected 1, found " + numMainDecls);
      }
    }
  }

  /*
   * checkClassesInProgram()
   * Type checks each class in a Program node
   */
  def checkClassesInProgram(program: Program): Boolean = {
    for (cDecl <- program.classes) {
      checkMethodsInClass(cDecl);
    }
    return true;
  }

  /*
   * checkMethodsInClass()
   * Type checks each method in a ClassDecl node
   * Checks method overriding and typing within each method
   */
  def checkMethodsInClass(cDecl: ClassDecl): Boolean = {
    //check method overriding
    for (mDecl <- cDecl.methods) {
      checkMethodOverride(mDecl);
    }
    //type check each method
    for (mDecl <- cDecl.methods) {
      typeCheckMethod(mDecl);
    }
    return true;
  }

  /*
   * typeCheckMethod()
   * Type checks the MethodDecl node
   * Checks each statement within the method
   */
  def typeCheckMethod(mDecl: MethodDecl): Boolean = {
    mDecl match {
      case f: FruitfulMethod => {
        return checkStmt(f.block, false, f.returnType);
      }
      case v: VoidMethod => {
        return checkStmt(v.block, false, new VoidType(v.line));
      }
    }
  }

  /*
   * Method override checking functions
   */

  /*
   * checkMethodOverride()
   * Checks that the given method is overridden correctly
   * (if it is overridden at all)
   */
  def checkMethodOverride(mDecl: MethodDecl): Boolean = {
    //get the method that this method overrides (if any)
    val overridden = mDecl.symtab.get.getOverriddenMethod(mDecl);
    overridden match {
      //this method overrides something: check the method arguments and return type
      case Some(overDecl) => {
        checkMethodFormals(mDecl, overDecl);
        return checkMethodReturn(mDecl, overDecl);
      }
      //this method doesn't override anything, so it's fine
      case None => {
        return true;
      }
    }
  }

  /*
   * checkMethodFormals()
   * Checks that the given method's formals (arguments) override the 
   * given overridden method's arguments, i.e.
   * that the number of arguments match and each method argument is a supertype of the overridden argument
   */
  def checkMethodFormals(methodDecl: MethodDecl, overDecl: MethodDecl): Boolean = {
    val methodFormals = methodDecl.formals;
    val overFormals = overDecl.formals;

    //both methods take zero arguments: fine
    if (methodFormals.size == 0 && overFormals.size == 0) {
      return true;
    }

    //not enough arguments in the method
    if (methodFormals.size < overFormals.size) {
      throw new TypeError(methodDecl.line, "not enough parameters for method " + methodDecl.id +
        " overriding method " + overDecl.id + " on line " + overDecl.line);
    }

    //too many arguments in the method
    if (methodFormals.size > overFormals.size) {
      throw new TypeError(methodDecl.line, "too many parameters for method " + methodDecl.id +
        " overriding method " + overDecl.id + " on line " + overDecl.line);
    }

    //same number of arguments: check contravariant argument types
    for (i <- 0 to methodFormals.size - 1) {
      val mFormal = methodFormals(i);
      val oFormal = overFormals(i);
      if (!isSubtype(oFormal.myType, mFormal.myType)) {
        throw new TypeError(methodDecl.line, "expected parameter type: " + oFormal.myType + " found illegal parameter type " + mFormal.myType +
          " in method " + methodDecl.id +
          " overriding method " + overDecl.id + " on line " + overDecl.line);
      }
    }
    return true;
  }

  /*
   * checkMethodReturn()
   * Checks correct overriding of the method return type
   */
  def checkMethodReturn(mDecl: MethodDecl, overDecl: MethodDecl): Boolean = {
    (mDecl, overDecl) match {
      //both fruitful methods: check covariant return type
      case (fMethod: FruitfulMethod, fOver: FruitfulMethod) => {
        if (!isSubtype(fMethod.returnType, fOver.returnType)) {
          throw new TypeError(fMethod.line, "illegal method return type for method " + fMethod.id +
            " overriding method " + fOver.id + " on line " + fOver.line +
            ": found " + fMethod.returnType + " expected: " + fOver.returnType);
        }
        return true;
      }
      //both void methods: fine
      case (vMethod: VoidMethod, vOver: VoidMethod) => {
        return true;
      }
      //fruitful method overrides void method
      case (fMethod: FruitfulMethod, vOver: VoidMethod) => {
        throw new TypeError(fMethod.line, "cannot override void method with fruitful method");
      }
      //void method overrides fruitful method
      case (vMethod: VoidMethod, fOver: FruitfulMethod) => {
        throw new TypeError(vMethod.line, "cannot override fruitful method with void method");
      }
    }
  }

  /*
   * Statement checking functions
   */

  /*
   * checkStmt()
   * Top-level statement checking function
   * Checks the given statement by calling recursive helper functions
   * Keeps track of whether the given statement is in a loop
   * and the expected return type
   */
  def checkStmt(stmt: Stmt, inLoop: Boolean, expectedReturnType: Type): Boolean = {
    stmt match {
      case blockStmt: BlockStmt => {
        return checkBlockStmt(blockStmt, inLoop, expectedReturnType);
      }
      case locStmt: LocStmt => {
        return checkLocStmt(locStmt, expectedReturnType);
      }
      case callStmt: CallStmt => {
        return checkCall(callStmt.call);
      }
      case returnStmt: ReturnStmt => {
        return checkReturnStmt(returnStmt, expectedReturnType);
      }
      case ifStmt: IfStmt => {
        return checkIfStmt(ifStmt, inLoop, expectedReturnType);
      }
      case whileStmt: WhileStmt => {
        return checkWhileStmt(whileStmt, expectedReturnType);
      }
      case breakStmt: BreakStmt => {
        if (inLoop) return true;
        throw new TypeError(breakStmt.line, "break not allowed outside of loop");
      }
      case continueStmt: ContinueStmt => {
        if (inLoop) return true;
        throw new TypeError(continueStmt.line, "continue not allowed outside of loop");
      }
      case functionStmt: FunctionStmt => {
        return checkFunctionStmt(functionStmt);
      }
      case _ => { return true; }
    }
  }

  /*
   * checkBlockStmt()
   */
  def checkBlockStmt(blockStmt: BlockStmt, inLoop: Boolean, returnType: Type): Boolean = {
    //check the variable declarations
    for (vDecl <- blockStmt.vars) {
      checkVarDecl(vDecl);
    }

    //check each contained statement
    for (stmt <- blockStmt.stmts) {
      checkStmt(stmt, inLoop, returnType);
    }
    return true;
  }

  /*
   * checkVarDecl()
   * Checks the variable declaration by checking the type of its optional assigned expression
   */
  def checkVarDecl(vDecl: VarDecl): Boolean = {
    vDecl.expr match {
      //assigning an expression to the variable: check its type
      case Some(e) => {
        val eType = checkExpr(e);
        if (isSubtype(eType, vDecl.myType)) {
          return true;
        }
        throw new TypeError(vDecl.line, "illegal assignment. Expected: " + vDecl.myType + " Found: " + eType);
      }
      //just declaring, no assignment: fine
      case None => {
        return true;
      }
    }
    return true;
  }

  /*
   * checkLocStmt()
   * Checks an assignment statement by checking the type of its expression
   */
  def checkLocStmt(locStmt: LocStmt, returnType: Type): Boolean = {
    val locType = checkLocation(locStmt.loc);
    val exprType = checkExpr(locStmt.expr);
    if (isSubtype(exprType, locType)) {
      return true;
    }
    throw new TypeError(locStmt.line, "invalid assignment. " + locStmt + " Expected: " + locType + " Found: " + exprType);
  }

  /*
   * checkReturnStmt()
   * Checks a return statement by checking its expression type (if any) against the expected return type
   * Also checks that return; is only allowed in a void method and return expr; is only allowed in a fruitful method
   */
  def checkReturnStmt(returnStmt: ReturnStmt, returnType: Type): Boolean = {
    (returnStmt.expr, returnType) match {
      //returning an expression from a void method
      case (Some(expr), v: VoidType) => {
        throw new TypeError(returnStmt.line, "can't return an expression from a void method");
      }
      //returning nothing from a void method: fine
      case (None, v: VoidType) => {
        return true;
      }
      //returning nothing from a fruitful method
      case (None, v: Type) => {
        throw new TypeError(returnStmt.line, "must return a subtype of " + v);
      }
      //returning something from a fruitful method: check the "something"'s type
      case (Some(expr), v: Type) => {
        val exprType = checkExpr(expr);
        if (isSubtype(exprType, v)) {
          return true;
        }
        throw new TypeError(returnStmt.line, "illegal return type: expected a subtype of " + v + ", found: " + exprType);
      }
    }
    return true;
  }

  /*
   * checkIfStmt()
   * Checks the condition is a boolean type
   * and checks each sub-statement
   */
  def checkIfStmt(ifStmt: IfStmt, inLoop: Boolean, returnType: Type): Boolean = {
    val exprType = checkExpr(ifStmt.cond);
    exprType match {
      //condition is a boolean: check the "then" statement
      case b: BoolType => {
        checkStmt(ifStmt.then, inLoop, returnType);
        ifStmt.elseStmt match {
          //check the "else" statement
          case Some(eStmt) => {
            return checkStmt(eStmt, inLoop, returnType);
          }
          //no else statement: fine
          case None => {
            return true;
          }
        }
      }
      //condition is not a boolean
      case _ => {
        throw new TypeError(ifStmt.line, "if condition must be a boolean type. Found: " + exprType);
      }
    }
    return true;
  }

  /*
   * checkWhileStatement()
   * Checks that the condition is a boolean 
   * and checks the sub-statement
   */
  def checkWhileStmt(whileStmt: WhileStmt, returnType: Type): Boolean = {
    val exprType = checkExpr(whileStmt.expr);
    exprType match {
      //boolean condition: check the contained statement
      case b: BoolType => {
        return checkStmt(whileStmt.stmt, true, returnType);
      }
      //non-boolean condition
      case _ => {
        throw new TypeError(whileStmt.line, "while condition must be a boolean type. Found: " + exprType);
      }
    }
    return true;
  }

  def checkFunctionStmt(functionStmt: FunctionStmt): Boolean = {
    var fcnFormals = functionStmt.formals;
    var returnType = functionStmt.returnType;
    var paramTypes = fcnFormals map (formal => formal.myType);
    var fcnType = new FunctionType(returnType, paramTypes.toList, functionStmt.line);
    var fcnExpr = new FunctionExpr(fcnFormals, returnType, functionStmt.block, functionStmt.line);
    var fcnVarDecl = new VarDecl(fcnType, functionStmt.id, Some(fcnExpr), functionStmt.line);
    return checkVarDecl(fcnVarDecl);
  }

  /*
   * Expression checking functions
   */

  /*
   * checkExpr()
   * Top-level expression type-checking function
   * Checks the given expression by calling recursive helper functions
   * Attaches the determined type to the Expr node and returns the type
   */
  def checkExpr(expr: Expr): Type = {
    expr match {
      case locExpr: LocExpr => {
        val locType = checkLocation(locExpr.loc);
        locExpr.setType(locType);
        return locType;
      }
      case callExpr: CallExpr => {
        val callType = getCallType(callExpr.call);
        callType match {
          case v: VoidType => {
            throw new TypeError(callExpr.line, "cannot store result of void method call in expression");
          }
          case _ => {
            callExpr.setType(callType);
            return callType;
          }
        }
      }
      case thisExpr: ThisExpr => {
        val thisType = checkThis(thisExpr);
        thisExpr.setType(thisType);
        return thisType;
      }
      case classExpr: ClassExpr => {
        val classType = new ClassType(classExpr.classId, classExpr.line);
        val classTable = classExpr.symtab.get;
        val classDecl = classTable.getThis();
        classType.decl = classExpr.decl;
        classExpr.setType(classType);
        return classType;
      }
      case arrayExpr: ArrayExpr => {
        val arrayType = checkArray(arrayExpr);
        arrayExpr.setType(arrayType);
        return arrayType;
      }
      case lengthExpr: LengthExpr => {
        val lengthType = checkLength(lengthExpr);
        lengthExpr.setType(lengthType);
        return lengthType;
      }
      case binExpr: BinExpr => {
        val binType = checkBinExpr(binExpr);
        binExpr.setType(binType);
        return binType;
      }
      case unExpr: UnExpr => {
        val unType = checkUnExpr(unExpr);
        unExpr.setType(unType);
        return unType;
      }
      case intExpr: IntExpr => {
        val intType = new IntType(intExpr.line);
        intExpr.setType(intType);
        return intType;
      }
      case stringExpr: StringExpr => {
        val stringType = new StringType(stringExpr.line);
        stringExpr.setType(stringType);
        return stringType;
      }
      case boolExpr: BoolExpr => {
        val boolType = new BoolType(boolExpr.line);
        boolExpr.setType(boolType);
        return boolType;
      }
      case nullExpr: NullExpr => {
        val nullType = new NullType(nullExpr.line);
        nullExpr.setType(nullType);
        return nullType;
      }
      case functionExpr: FunctionExpr => {
        return checkFunction(functionExpr);
      }
    }
  }

  /*
   * checkFunction()
   * Returns the type of the given function expression,
   * derived from the expression's formals and return type
   */
  def checkFunction(functionExpr: FunctionExpr): Type = {
    var fcnFormals = functionExpr.formals;
    var returnType = functionExpr.returnType;
    var paramTypes = fcnFormals map (formal => formal.myType);
    var fcnType = new FunctionType(returnType, paramTypes.toList, 0);
    return fcnType;
  }

  /*
   * checkLocation()
   * Checks any of the three types of locations
   */
  def checkLocation(loc: Location): Type = {
    loc match {
      case idLoc: IdLoc => {
        return checkIdLoc(idLoc);
      }
      case dotLoc: DotLoc => {
        return checkDotLoc(dotLoc);
      }
      case arryLoc: ArrayLoc => {
        return checkArrayLoc(arryLoc);
      }
    }
  }

  /*
   * checkIdLoc()
   * Returns the type of the variable by getting its declaration
   * i.e. look it up in the "environment"
   */
  def checkIdLoc(idLoc: IdLoc): Type = {
    val idDecl = idLoc.decl.get;
    idDecl match {
      case vDecl: VarDecl => {
        return vDecl.myType;
      }
      case fDecl: FieldDecl => {
        return fDecl.myType;
      }
    }
  }

  /*
   * checkDotLoc()
   * Returns the type of the field accessed
   */
  def checkDotLoc(dotLoc: DotLoc): Type = {
    val exprType = checkExpr(dotLoc.expr);
    exprType match {
      //accessing something from a class type: get the declaration of the class
      case classType: ClassType => {
        val classTable = classType.decl.get.symtab.get;
        val exprClassDecl = classTable.getThis();
        exprClassDecl match {
          //found the class declaration: get the field
          case Some(eClassDecl) => {
            val fieldDecl = eClassDecl.symtab.get.getFieldDecl(dotLoc.id);
            fieldDecl match {
              //found a field declaration
              case Some(fDecl) => {
                dotLoc.setDecl(fDecl);
                return fDecl.myType;
              }
              //no field found for the class
              case None => {
                throw new TypeError(dotLoc.line, "class " + eClassDecl.classId + " does not have a field " + dotLoc.id);
              }
            }
          }
          //no class found
          case None => {
            throw new TypeError(dotLoc.line, "no class found for " + classType.classId);
          }
        }
      }
      //accessing a "field" from a non-class type
      case _ => {
        throw new TypeError(dotLoc.line, "cannot access field " + dotLoc.id + " of non-class type");
      }
    }
  }

  /*
   * checkArrayLoc()
   * Checks array access
   */
  def checkArrayLoc(arrayLoc: ArrayLoc): Type = {
    val t1 = checkExpr(arrayLoc.e1);
    val t2 = checkExpr(arrayLoc.e2);
    (t1, t2) match {
      //accessing an array using an int
      case (arrayType: ArrayType, intType: IntType) => {
        return arrayType.theType;
      }
      //anything else
      case _ => {
        throw new TypeError(arrayLoc.line, "invalid array access");
      }
    }
  }

  /*
   * checkCall()
   * Returns true iff the virtual or library call is made correctly,
   * i.e. with the correct parameters
   * Used to check call statements as well as call expressions
   */
  def checkCall(call: Call): Boolean = {
    call match {
      case vCall: VirtualCall => {
        return checkVirtualCall(vCall);
      }
      case lCall: LibCall => {
        return checkLibCall(lCall);
      }
      case fCall: FunctionCall => {
        return checkFunctionCall(fCall);
      }
      case aCall: AnonCall => {
        return checkAnonCall(aCall);
      }
    }
  }

  /*
   * checkVirtualCall()
   * Checks the virtual call
   */
  def checkVirtualCall(vCall: VirtualCall): Boolean = {
    val mDecl = getVirtualMethodDecl(vCall);
    return checkVirtualParameters(vCall, mDecl);
  }

  /*
   * getVirtualMethodDecl()
   * Get the declaration of the virtual method that is being called
   */
  def getVirtualMethodDecl(vCall: VirtualCall): MethodDecl = {
    vCall.expr match {
      //method is being called on some expression
      case Some(expr) => {
        val exprType = checkExpr(expr);
        exprType match {
          //expression is being called on a class instance: get the class declaration and symtab
          case classType: ClassType => {
            val classTable = classType.decl.get.symtab;
            classTable match {
              //found a class symtab: get the method declaration
              case Some(cTable) => {
                val methodDecl = cTable.getMethodDecl(vCall.id);
                methodDecl match {
                  //found a method declaration for the called method
                  case Some(mDecl) => {
                    vCall.setDecl(mDecl);
                    return mDecl;
                  }
                  //no method found for the class
                  case None => {
                    throw new TypeError(vCall.line, "method " + vCall.id + " not defined for class " + classType.classId);
                  }
                }
              }
              //no class found for calling expression
              case None => {
                throw new TypeError(vCall.line, "no class found for expression " + expr);
              }
            }
          }
          //method called on a non-class instance (e.g. 2.doThings())
          case _ => {
            throw new TypeError(vCall.line, "method " + vCall.id + " not called on an instance of a class");
          }
        }
      }
      //no expression: implicit "this" call
      case None => {
        val thisClass = vCall.symtab.get.getThis();
        return getVirtualDeclFromThis(vCall, thisClass);
      }
    }
  }

  /*
   * getVirtualDeclFromThis()
   * Returns the method declaration for the given virtual call in the current class
   */
  def getVirtualDeclFromThis(vCall: VirtualCall, thisClass: Option[ClassDecl]): MethodDecl = {
    thisClass match {
      //found a class declaration for the current class
      case Some(cDecl) => {
        val classTable = cDecl.symtab;
        classTable match {
          //found a symbol table for the current class: get the method declaration
          case Some(cTable) => {
            val methodDecl = cTable.getMethodDecl(vCall.id);
            methodDecl match {
              //found method declaration
              case Some(mDecl) => {
                vCall.setDecl(mDecl);
                return mDecl;
              }
              //no method declaration found
              case None => {
                throw new TypeError(vCall.line, "method " + vCall.id + " is not defined for class " + cDecl.classId);
              }
            }
          }
          //no symbol table found
          case None => {
            throw new TypeError(vCall.line, "method " + vCall.id + " is not defined for class " + cDecl.classId);
          }
        }
      }
      //no class given
      case None => {
        throw new TypeError(vCall.line, "method " + vCall.id + " not called within a class");
      }
    }
  }

  /*
   * checkVirtualParameters()
   * Returns true iff the given virtual call gives the correct parameters for the given method
   */
  def checkVirtualParameters(vCall: VirtualCall, mDecl: MethodDecl): Boolean = {
    val mFormals = mDecl.formals;
    //compare given arguments size with method arguments size:

    //both 0: fine
    if (vCall.exprs.size == 0 && mFormals.size == 0) {
      return true;
    }

    //too many arguments given 
    if (vCall.exprs.size > mFormals.size) {
      throw new TypeError(vCall.line, "too many arguments for method " + vCall.id);
    }

    //not enough arguments given
    if (vCall.exprs.size < mFormals.size) {
      throw new TypeError(vCall.line, "not enough arguments for method " + vCall.id);
    }

    //same number of arguments: check that each called expression is a subtype of the corresponding method argument
    for (i <- 0 to vCall.exprs.size - 1) {
      val param = vCall.exprs(i);
      val paramType = checkExpr(param);
      val formal = mFormals(i);
      if (!isSubtype(paramType, formal.myType)) {
        throw new TypeError(vCall.line, "illegal argument type: expected " + formal.myType + ", found: " + paramType);
      }
    }
    return true;
  }

  /*
   * checkLibCall()
   * Returns true iff the given library call is called with the correct argument(s)
   * No need to get the library call separately - just look it up in the map at the top of the file
   */
  def checkLibCall(lCall: LibCall): Boolean = {
    //get the signature (list of arguments types and return type)
    val libSignature = libTypes(lCall.id);

    //the last type is the return type, the rest are the argument types
    if (lCall.exprs.size == 0 & libSignature.size == 1) {
      return true;
    }
    if (lCall.exprs.size > libSignature.size - 1) {
      throw new TypeError(lCall.line, "too many arguments for method " + lCall.id);
    }
    if (lCall.exprs.size < libSignature.size - 1) {
      throw new TypeError(lCall.line, "not enough arguments for method " + lCall.id);
    }
    for (i <- 0 to lCall.exprs.size - 1) {
      val param = lCall.exprs(i);
      val paramType = checkExpr(param);
      val formalType = libSignature(i);
      if (!isSubtype(paramType, formalType)) {
        throw new TypeError(lCall.line, "illegal argument type: expected " + formalType + ", found: " + paramType);
      }
    }
    return true;
  }

  /*
   * checkFunctionCall()
   * Checks the given function call
   */
  def checkFunctionCall(fCall: FunctionCall): Boolean = {
    var fDecl = getFcnDecl(fCall);
    fDecl match {
      case Some(f) => {
        return checkFunctionParameters(fCall, f);
      }
      case None => {
        var fField = getFcnField(fCall);
        fField match {
          case Some(f) => {
            return checkFunctionParameters(fCall, f);
          }
          case None => {
            throw new ScopeError(fCall.line, "use of undeclared function " + fCall.id);
          }
        }
      }
    }
    //return checkFunctionParameters(fCall, fDecl);
  }

  /*
   * checkFunctionParameters()
   * Checks that the given function call is made with the correct arguments
   */
  def checkFunctionParameters(fCall: FunctionCall, fDecl: VarDecl): Boolean = {
    var fType = fDecl.myType;
    fType match {
      case fcnType: FunctionType => {
        var paramTypes = fcnType.paramTypes;
        if (paramTypes.size == 0 && fCall.exprs.size == 0) {
          return true;
        }

        if (paramTypes.size > fCall.exprs.size) {
          throw new TypeError(fCall.line, "not enough arguments given for function " + fCall.id +
            ": expected " + paramTypes.size + " arguments, found " + fCall.exprs.size + " arguments");
        }

        if (paramTypes.size < fCall.exprs.size) {
          throw new TypeError(fCall.line, "too many arguments given for function " + fCall.id +
            ": expected " + paramTypes.size + " arguments, found " + fCall.exprs.size + " arguments");
        }

        for (i <- 0 to fCall.exprs.size - 1) {
          var arg = fCall.exprs(i);
          var argType = checkExpr(arg);
          var paramType = paramTypes(i);
          if (!isSubtype(argType, paramType)) {
            throw new TypeError(fCall.line, "illegal argument type for function " + fCall.id + ": expected " + paramType + ", found " + argType);
          }
        }
      }
      case _ => {
        throw new TypeError(fCall.line, "cannot call a non-function " + fDecl.id);
      }
    }

    return true;
  }

  def checkFunctionParameters(fCall: FunctionCall, fDecl: FieldDecl): Boolean = {
    var fType = fDecl.myType;
    fType match {
      case fcnType: FunctionType => {
        var paramTypes = fcnType.paramTypes;
        if (paramTypes.size == 0 && fCall.exprs.size == 0) {
          return true;
        }

        if (paramTypes.size > fCall.exprs.size) {
          throw new TypeError(fCall.line, "not enough arguments given for function " + fCall.id +
            ": expected " + paramTypes.size + " arguments, found " + fCall.exprs.size + " arguments");
        }

        if (paramTypes.size < fCall.exprs.size) {
          throw new TypeError(fCall.line, "too many arguments given for function " + fCall.id +
            ": expected " + paramTypes.size + " arguments, found " + fCall.exprs.size + " arguments");
        }

        for (i <- 0 to fCall.exprs.size - 1) {
          var arg = fCall.exprs(i);
          var argType = checkExpr(arg);
          var paramType = paramTypes(i);
          if (!isSubtype(argType, paramType)) {
            throw new TypeError(fCall.line, "illegal argument type for function " + fCall.id + ": expected " + paramType + ", found " + argType);
          }
        }
      }
      case _ => {
        throw new TypeError(fCall.line, "cannot call a non-function " + fDecl.id);
      }
    }

    return true;
  }

  def checkAnonCall(aCall: AnonCall): Boolean = {
    var formalTypes = aCall.fcnExpr.formals map (formal => formal.myType); ;
    var params = aCall.exprs;

    if (formalTypes.size == 0 && params.size == 0) {
      return true;
    }

    if (params.size < formalTypes.size) {
      throw new TypeError(aCall.line, "not enough arguments for anonymous function " + aCall.fcnExpr);
    }

    if (params.size > formalTypes.size) {
      throw new TypeError(aCall.line, "too many arguments for anonymous function " + aCall.fcnExpr);
    }

    for (i <- 0 to params.size - 1) {
      var paramType = checkExpr(params(i));
      if (!isSubtype(paramType, formalTypes(i))) {
        throw new TypeError(aCall.line, "illegal argument type for anonymous function " + aCall.fcnExpr +
          ": expected: " + formalTypes(i) + ", found: " + paramType);
      }
    }

    return true;
  }

  /*
   * getCallType()
   * Returns the type of the given call
   */
  def getCallType(call: Call): Type = {
    call match {
      case vCall: VirtualCall => {
        return getVirtualCallType(vCall);
      }
      case lCall: LibCall => {
        return getLibCallType(lCall);
      }
      case fCall: FunctionCall => {
        return getFcnCallType(fCall);
      }
      case aCall: AnonCall => {
        return getAnonCallType(aCall);
      }
    }
  }

  /*
   * getVirtualCallType()
   * Returns the type of the given virtual call
   * First checks that the parameters match
   */
  def getVirtualCallType(vCall: VirtualCall): Type = {
    val mDecl = getVirtualMethodDecl(vCall);
    checkVirtualParameters(vCall, mDecl);
    mDecl match {
      case fruitful: FruitfulMethod => {
        return fruitful.returnType;
      }
      case voidMethod: VoidMethod => {
        return new VoidType(voidMethod.line);
      }
    }
  }

  /*
   * getLibCallType()
   * Returns the type of the given library call
   */
  def getLibCallType(lCall: LibCall): Type = {
    checkLibCall(lCall);
    val libSignature = libTypes(lCall.id);
    return libSignature(libSignature.size - 1);
  }

  /*
   * getFcnCallType()
   * Returns the type of the given function call
   */
  def getFcnCallType(fCall: FunctionCall): Type = {
    val vDecl = getFcnDecl(fCall);
    vDecl match {
      case Some(v) => {
        v.myType match {
          case fType: FunctionType => {
            checkFunctionParameters(fCall, v);
            return fType.returnType;
          }
          case _ => {
            throw new TypeError(fCall.line, "Cannot call a non-function " + v.id + " of type: " + v.myType);
          }
        }
      }
      case None => {
        var fDecl = getFcnField(fCall);
        fDecl match {
          case Some(f) => {
            f.myType match {
              case fType: FunctionType => {
                checkFunctionParameters(fCall, f);
                return fType.returnType;
              }
              case _ => {
                throw new TypeError(fCall.line, "Cannot call a non-function " + f.id + " of type: " + f.myType);
              }
            }
          }
          case None => {
            throw new TypeError(fCall.line, "no function found for " + fCall.id);
          }
        }
      }
    }

  }

  /*
   * getFcnDecl()
   * Returns the variable declaration of the given function call
   */
  def getFcnDecl(fCall: FunctionCall): Option[VarDecl] = {
    var symtab = fCall.symtab.get;
    var decl = symtab.getVarDecl(fCall.id);
    decl match {
      case Some(d) => {
        return Some(d);
      }
      case None => {
        return None;
        var fDecl = symtab.getFieldDecl(fCall.id)
        throw new ScopeError(fCall.line, "use of undeclared function " + fCall.id);
      }
    }
  }

  def getFcnField(fCall: FunctionCall): Option[FieldDecl] = {
    return fCall.symtab.get.getFieldDecl(fCall.id);
  }

  def getAnonCallType(aCall: AnonCall): Type = {
    checkAnonCall(aCall);
    var returnType = aCall.fcnExpr.returnType;
    return returnType;
  }

  /*
   * checkThis()
   * Checks the given this expression
   */
  def checkThis(thisExpr: ThisExpr): Type = {
    val thisTable = thisExpr.symtab;
    thisTable match {
      case Some(tTable) => {
        //get the declaration of the class that this represents
        var classDecl = tTable.getThis();
        classDecl match {
          //found a class declaration
          case Some(cDecl) => {
            //create a new class type and set its declaration
            var classType = new ClassType(cDecl.classId, thisExpr.line);
            classType.setDecl(thisExpr.decl.get);
            return classType;
          }
          //no class declaration found => error
          case None => {
            throw new TypeError(thisExpr.line, "no class found for value this");
          }
        }
      }
      //this doesn't have a symbol table => error
      case None => {
        throw new TypeError(thisExpr.line, "no class found for value this");
      }
    }
  }

  /*
   * checkArray()
   * Checks an array creation expression (new T[e])
   */
  def checkArray(arrayExpr: ArrayExpr): Type = {
    //check that the expression is an Int
    val exprType = checkExpr(arrayExpr.expr);
    exprType match {
      //expression has int type => result has array type
      case i: IntType => {
        val arrayType = new ArrayType(arrayExpr.myType, arrayExpr.line);
        return arrayType;
      }
      //expression doesn't have int type => error
      case _ => {
        throw new TypeError(arrayExpr.line, "invalid array creation. Cannot create array of length " + arrayExpr.expr);
      }
    }
  }

  /*
   * checkLength()
   * Checks the given length expression (e.length)
   */
  def checkLength(lengthExpr: LengthExpr): Type = {
    //check that the expression is an array
    val exprType = checkExpr(lengthExpr.expr);
    exprType match {
      //expression has array type => expression.length has int type
      case arrayType: ArrayType => {
        return new IntType(lengthExpr.line);
      }
      //expression isn't an array => error
      case _ => {
        throw new TypeError(lengthExpr.line, "can't access length of non-array " + lengthExpr.expr);
      }
    }
  }

  /*
   * checkBinExpr()
   * Checks the given binary expression
   */
  def checkBinExpr(binExpr: BinExpr): Type = {
    //get the types of the binary expression's operands
    val leftType = checkExpr(binExpr.left);
    val rightType = checkExpr(binExpr.right);

    (leftType, binExpr.op, rightType) match {
      //arithmetic operators: (int, int) => int
      case (i1: IntType, plus: Plus, i2: IntType) => {
        return new IntType(binExpr.line);
      }
      case (i1: IntType, minus: Minus, i2: IntType) => {
        return new IntType(binExpr.line);
      }
      case (i1: IntType, mult: Mult, i2: IntType) => {
        return new IntType(binExpr.line);
      }
      case (i1: IntType, div: Div, i2: IntType) => {
        return new IntType(binExpr.line);
      }
      case (i1: IntType, mod: Mod, i2: IntType) => {
        return new IntType(binExpr.line);
      }
      //comparisons of unequal magnitude: (int, int) => bool
      case (i1: IntType, le: LessEq, i2: IntType) => {
        return new BoolType(binExpr.line);
      }
      case (i1: IntType, l: Less, i2: IntType) => {
        return new BoolType(binExpr.line);
      }
      case (i1: IntType, ge: GreaterEq, i2: IntType) => {
        return new BoolType(binExpr.line);
      }
      case (i1: IntType, g: Greater, i2: IntType) => {
        return new BoolType(binExpr.line);
      }
      //logical operators: (bool, bool) => bool
      case (b1: BoolType, and: And, b2: BoolType) => {
        return new BoolType(binExpr.line);
      }
      case (b1: BoolType, or: Or, b2: BoolType) => {
        return new BoolType(binExpr.line);
      }
      //string concatenation: (string, string) => string
      case (s1: StringType, plus: Plus, s2: StringType) => {
        return new StringType(binExpr.line);
      }
      //equality and inequality (need subtyping)
      case (t1: Type, eq: Equal, t2: Type) => {
        if (isSubtype(t1, t2) || isSubtype(t2, t1)) {
          return new BoolType(binExpr.line);
        }
        throw new TypeError(binExpr.line, "Illegal binary expression: left type: " + t1 + " operation: Equal" + " right type: " + t2);
      }
      case (t1: Type, neq: NotEqual, t2: Type) => {
        if (isSubtype(t1, t2) || isSubtype(t2, t1)) {
          return new BoolType(binExpr.line);
        }
        throw new TypeError(binExpr.line, "Illegal binary expression: left type: " + t1 + " operation: NotEqual" + " right type: " + t2);
      }
      //not covered by above cases => error
      case (t1: Type, op: Binop, t2: Type) => {
        throw new TypeError(binExpr.line, "Illegal binary expression: left type: " + t1 + " operation: " + op + " right type: " + t2);
      }
    }
  }

  /*
   * checkUnExpr()
   * Checks the given unary expression
   */
  def checkUnExpr(unExpr: UnExpr): Type = {
    //get the type of the expression's operand
    val exprType = checkExpr(unExpr.expr);

    (exprType, unExpr.op) match {
      //negative: int => int
      case (i: IntType, negative: Negative) => {
        return new IntType(unExpr.line);
      }
      //not: bool => bool
      case (b: BoolType, not: Not) => {
        return new BoolType(unExpr.line);
      }
      //anything else => error
      case _ => {
        throw new TypeError(unExpr.line, "Invalid unary expression");
      }
    }
  }

  /*
   * isSubtype()
   * Returns true iff type b is a subtype of type a
   */
  def isSubtype(b: Type, a: Type): Boolean = {
    //if b and a are the same type, b is a subtype of a
    if (sameType(b, a)) {
      return true;
    }

    //not the same type => check other subtyping cases
    (b, a) match {
      //both class types
      case (bClass: ClassType, aClass: ClassType) => {
        //same class type
        if (bClass.classId == aClass.classId) {
          return true;
        }
        //different class types => check inheritance
        val bDecl = bClass.decl.get;
        bDecl.extendsId match {
          //if b extends some class, check whether it inherits from a
          case Some(eId) => {
            val bTable = bDecl.symtab.get;
            return bTable.inheritsFrom(aClass.classId);
          }
          //b doesn't extend any class, so it can't be a subtype of class a
          case None => {
            return false;
          }
        }
      }
      //null is a subtype of everything
      case (bNull: NullType, _) => {
        return true;
      }
      //anything else => b is not a subtype of a
      case _ => {
        return false;
      }
    }
  }

  /*
   * sameType()
   * Returns true iff type b and type a are the same type
   */
  def sameType(b: Type, a: Type): Boolean = {
    (b, a) match {
      //both ints
      case (bInt: IntType, aInt: IntType) => {
        return true;
      }
      //both strings
      case (bString: StringType, aString: StringType) => {
        return true;
      }
      //both booleans
      case (bBool: BoolType, aBool: BoolType) => {
        return true;
      }
      //both void
      case (bVoid: VoidType, aVoid: VoidType) => {
        return true;
      }
      //both classes => check if they're the same class
      case (bClass: ClassType, aClass: ClassType) => {
        return bClass.classId == aClass.classId;
      }
      //both arrays => check if the array types are the same
      //e.g. int [] == int []
      case (bArr: ArrayType, aArr: ArrayType) => {
        return sameType(bArr.theType, aArr.theType);
      }
      //both function types => check their param types and return type
      case (bFcn: FunctionType, aFcn: FunctionType) => {
        if (bFcn.paramTypes.length != aFcn.paramTypes.length) {
          return false;
        }
        if (bFcn.paramTypes.length == 0 && aFcn.paramTypes.length == 0) {
          return sameType(bFcn.returnType, aFcn.returnType);
        }
        for (i <- 0 to bFcn.paramTypes.length - 1) {
          if (!sameType(bFcn.paramTypes(i), aFcn.paramTypes(i))) {
            return false;
          }
        }
        return sameType(bFcn.returnType, aFcn.returnType);
      }
      //anything else => not the same type
      case _ => {
        return false;
      }
    }
  }
}
