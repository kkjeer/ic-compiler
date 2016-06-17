package ic.closures;

import ic.Util
import ic.ast._
import scala.collection.mutable.Map;

object ClosureConversion {
  var templateClasses = List[ClassDecl]();
  var closureClasses = List[ClassDecl]();
  var numAnons = 0;
  var anonToClosure = Map[FunctionExpr, ClassDecl]();

  /**
   * convertProgram
   * Top-level closure conversion
   */
  def convertProgram(p: Program): Program = {
    templateClasses = List[ClassDecl]();
    closureClasses = List[ClassDecl]();
    numAnons = 0;
    anonToClosure = Map[FunctionExpr, ClassDecl]();

    createClosureClasses(p);
    Util.debug("+++CLOSURE CLASSES+++");
    for (closureClass <- closureClasses) {
      Util.debug(closureClass.classId);
    }
    Util.debug("");

    Util.debug("%%%TEMPLATE CLASSES%%%");
    for (templateClass <- templateClasses) {
      Util.debug(templateClass.classId + " extends " + templateClass.extendsId);
    }
    Util.debug("");

    var convertedClosures = closureClasses map (closure => convertClass(closure));
    var convertedClasses = p.classes map (cDecl => convertClass(cDecl));
    var convertedTemplates = templateClasses map (template => convertClass(template));

    return new Program(convertedTemplates ++ convertedClosures ++ convertedClasses, p.line);
  }

  /**
   * Pass 1: Closure Class Creation
   */

  /**
   * createClosureClasses
   * Creates a closure class for every first-class function in the program
   */
  def createClosureClasses(p: Program) = {
    for (cDecl <- p.classes) {
      for (mDecl <- cDecl.methods) {
        closureStmtPass(mDecl.block, mDecl, cDecl, List[FunctionExpr](), List[String]());
      }
    }
  }

  /**
   * fixType
   * Creates a template closure class for any previously unencountered function types
   */
  def fixType(pType: Type): Type = {
    pType match {
      case fcnType: FunctionType => {
        var templateName = createTemplateName(fcnType);
        if (!hasTemplateClass(templateName)) {
          createClosureTemplate(fcnType);
        }
        var fixedReturn = fixType(fcnType.returnType);
        var fixedParams = fcnType.paramTypes map (param => fixType(param));
        var fixedFunction = new FunctionType(fixedReturn, fixedParams, fcnType.line);
        var fixedTemplateName = createTemplateName(fixedFunction);
        return new ClassType(templateName, fcnType.line);
      }
      case arrayType: ArrayType => {
        var fixedType = fixType(arrayType.theType);
        return new ArrayType(fixedType, arrayType.line);
      }
      case _ => {
        return pType;
      }
    }
  }

  /**
   * closureVarDeclPass
   * Creates a closure class for the declared function, if any
   */
  def closureVarDeclPass(vDecl: VarDecl, parentMethod: MethodDecl, parentClass: ClassDecl, parentFunctions: List[FunctionExpr], parentFunctionIds: List[String]): Unit = {
    fixType(vDecl.myType);
    vDecl.expr match {
      case Some(e) => {
        e match {
          case fcnExpr: FunctionExpr => {
            //local vars that are in scope at vDecl
            var parentLocals = getMethodLocals(vDecl, parentMethod);

            //create the closure class
            var closure = createClosureForFunction(vDecl.id, fcnExpr, parentMethod, parentClass, parentFunctions, parentFunctionIds, parentLocals);
            vDecl.setClosureClass(closure);
          }
          case _ => {
            closureExprPass(e, parentMethod, parentClass, parentFunctions, parentFunctionIds);
          }
        }
      }
      case None => {

      }
    }
  }

  /**
   * getMethodLocals
   * Returns a list of all local variables in the given method that are in scope at the given vardecl
   */
  def getMethodLocals(vDecl: VarDecl, parentMethod: MethodDecl): List[VarDecl] = {
    var parentLocals = List[VarDecl]();

    var parentSymTab = vDecl.symtab.get.parent.get;
    for (localDecl <- parentMethod.block.vars) {
      var localLookup = parentSymTab.getVarDecl(localDecl.id);
      localLookup match {
        case Some(local) => {
          if (local != vDecl) {
            parentLocals :+= local;
          }
        }
        case None => {}
      }
    }

    return parentLocals;
  }

  /**
   * getMethodLocalsExpr
   * Returns a list of all local variables in the given method that are in scope at the given expr
   */
  def getMethodLocalsExpr(expr: Expr, parentMethod: MethodDecl): List[VarDecl] = {
    var parentLocals = List[VarDecl]();

    var symTab = expr.symtab.get;
    for (localDecl <- parentMethod.block.vars) {
      var localLookup = symTab.getVarDecl(localDecl.id);
      localLookup match {
        case Some(local) => {
          parentLocals :+= local;
        }
        case None => {}
      }
    }

    return parentLocals;
  }

  /**
   * getFunctionLocals
   * Returns a list of all local variables that are in scope in any of the list of parent functions
   */
  def getFunctionLocals(fcnExpr: FunctionExpr, parentFunctions: List[FunctionExpr]): List[VarDecl] = {
    var fcnLocals = List[VarDecl]();

    var symTab = fcnExpr.symtab.get;
    for (parentFunction <- parentFunctions) {
      for (localDecl <- parentFunction.block.vars) {
        var localLookup = symTab.getVarDecl(localDecl.id);
        localLookup match {
          case Some(local) => {
            fcnLocals :+= local;
          }
          case None => {}
        }
      }
    }

    return fcnLocals;
  }

  /**
   * closureStmtPass
   * Creates a closure class for every first-class function in the statement
   */
  def closureStmtPass(stmt: Stmt, parentMethod: MethodDecl, parentClass: ClassDecl, parentFunctions: List[FunctionExpr], parentFunctionIds: List[String]): Unit = {
    stmt match {
      case block: BlockStmt => {
        for (vDecl <- block.vars) {
          closureVarDeclPass(vDecl, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        }
        for (s <- block.stmts) {
          closureStmtPass(s, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        }
      }
      case locStmt: LocStmt => {
        closureLocPass(locStmt.loc, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        closureExprPass(locStmt.expr, parentMethod, parentClass, parentFunctions, parentFunctionIds);
      }
      case callStmt: CallStmt => {
        closureCallPass(callStmt.call, parentMethod, parentClass, parentFunctions, parentFunctionIds);
      }
      case returnStmt: ReturnStmt => {
        returnStmt.expr match {
          case Some(e) => {
            closureExprPass(e, parentMethod, parentClass, parentFunctions, parentFunctionIds);
          }
          case None => {}
        }
      }
      case ifStmt: IfStmt => {
        closureExprPass(ifStmt.cond, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        closureStmtPass(ifStmt.then, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        ifStmt.elseStmt match {
          case Some(s) => {
            closureStmtPass(s, parentMethod, parentClass, parentFunctions, parentFunctionIds);
          }
          case None => {}
        }
      }
      case whileStmt: WhileStmt => {
        closureExprPass(whileStmt.expr, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        closureStmtPass(whileStmt.stmt, parentMethod, parentClass, parentFunctions, parentFunctionIds);
      }
      case _ => {

      }
    }
  }

  /**
   * closureExprPass
   * Creates a closure class for every first-class function in the expression
   */
  def closureExprPass(expr: Expr, parentMethod: MethodDecl, parentClass: ClassDecl, parentFunctions: List[FunctionExpr], parentFunctionIds: List[String]): Unit = {
    expr match {
      case locExpr: LocExpr => {
        closureLocPass(locExpr.loc, parentMethod, parentClass, parentFunctions, parentFunctionIds);
      }
      case callExpr: CallExpr => {
        closureCallPass(callExpr.call, parentMethod, parentClass, parentFunctions, parentFunctionIds);
      }
      case arrayExpr: ArrayExpr => {
        closureExprPass(arrayExpr.expr, parentMethod, parentClass, parentFunctions, parentFunctionIds);
      }
      case lengthExpr: LengthExpr => {
        closureExprPass(lengthExpr.expr, parentMethod, parentClass, parentFunctions, parentFunctionIds);
      }
      case binExpr: BinExpr => {
        closureExprPass(binExpr.left, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        closureExprPass(binExpr.right, parentMethod, parentClass, parentFunctions, parentFunctionIds);
      }
      case unExpr: UnExpr => {
        closureExprPass(unExpr.expr, parentMethod, parentClass, parentFunctions, parentFunctionIds);
      }
      case fcnExpr: FunctionExpr => {
        var fcnId = "anon" + numAnons;
        var parentLocals = getMethodLocalsExpr(fcnExpr, parentMethod);
        var closure = createClosureForFunction("anon" + numAnons, fcnExpr, parentMethod, parentClass, parentFunctions, parentFunctionIds, parentLocals);
        anonToClosure(fcnExpr) = closure;
        numAnons += 1;
      }
      case _ => {

      }
    }
  }

  /**
   * closureCallPass
   * Creates a closure class for every first-class function in the call
   */
  def closureCallPass(call: Call, parentMethod: MethodDecl, parentClass: ClassDecl, parentFunctions: List[FunctionExpr], parentFunctionIds: List[String]): Unit = {
    call match {
      case libCall: LibCall => {
        for (expr <- libCall.exprs) {
          closureExprPass(expr, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        }
      }
      case virtualCall: VirtualCall => {
        for (expr <- virtualCall.exprs) {
          closureExprPass(expr, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        }
        virtualCall.expr match {
          case Some(e) => {
            closureExprPass(e, parentMethod, parentClass, parentFunctions, parentFunctionIds);
          }
          case None => {}
        }
      }
      case fcnCall: FunctionCall => {
        for (expr <- fcnCall.exprs) {
          closureExprPass(expr, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        }
      }
      case anonCall: AnonCall => {
        closureExprPass(anonCall.fcnExpr, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        for (expr <- anonCall.exprs) {
          closureExprPass(expr, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        }
      }
    }
  }

  /**
   * closureLocPass
   * Creates a closure class for every first-class function in the location (within the location's expression(s))
   */
  def closureLocPass(loc: Location, parentMethod: MethodDecl, parentClass: ClassDecl, parentFunctions: List[FunctionExpr], parentFunctionIds: List[String]): Unit = {
    loc match {
      case idLoc: IdLoc => {

      }
      case dotLoc: DotLoc => {
        closureExprPass(dotLoc.expr, parentMethod, parentClass, parentFunctions, parentFunctionIds);
      }
      case arrayLoc: ArrayLoc => {
        closureExprPass(arrayLoc.e1, parentMethod, parentClass, parentFunctions, parentFunctionIds);
        closureExprPass(arrayLoc.e2, parentMethod, parentClass, parentFunctions, parentFunctionIds);
      }
    }
  }

  /**
   * createClosureTemplate
   * Returns a template closure class for a function type (e.g. <int> => string)
   * 	given a function expression
   */
  def createClosureTemplate(fcnExpr: FunctionExpr): ClassDecl = {
    //name - stringified function type
    var paramTypes = fcnExpr.formals map (formal => formal.myType);
    var fcnType = new FunctionType(fcnExpr.returnType, paramTypes.toList, 0);
    var templateName = createTemplateName(fcnType);

    //fields - empty
    var fields = List[FieldDecl]();

    //call method
    var callId = "call";
    var callFormals = fcnExpr.formals;
    var callStmts = List[Stmt]();
    fcnExpr.returnType match {
      case voidType: VoidType => {
        callStmts :+= new ReturnStmt(None, 0);
      }
      case intType: IntType => {
        callStmts :+= new ReturnStmt(Some(new IntExpr(0, 0)), 0);
      }
      case boolType: BoolType => {
        callStmts :+= new ReturnStmt(Some(new BoolExpr(true, 0)), 0);
      }
      case stringType: StringType => {
        callStmts :+= new ReturnStmt(Some(new StringExpr("", 0)), 0);
      }
      case _ => {
        callStmts :+= new ReturnStmt(Some(new NullExpr(0)), 0);
      }
    }
    var callBlock = new BlockStmt(List[VarDecl](), callStmts, 0);
    var callMethod = fcnExpr.returnType match {
      case voidType: VoidType => {
        new VoidMethod(callId, callFormals, callBlock, 0);
      }
      case _ => {
        new FruitfulMethod(fcnExpr.returnType, callId, callFormals, callBlock, 0);
      }
    }

    //methods - call (no create)
    var methods = List[MethodDecl](callMethod);

    //closure template class
    var closureTemplate = new ClassDecl(templateName, None, fields, methods, 0);
    templateClasses :+= closureTemplate;
    return closureTemplate;
  }

  /**
   * createClosureTemplate
   * Returns a template closure ClassDecl for a function type, e.g. <int, int> => string
   * 	given a function type
   */
  def createClosureTemplate(fcnType: FunctionType): ClassDecl = {
    //name - stringified function type
    var templateName = createTemplateName(fcnType);

    //fields - empty
    var fields = List[FieldDecl]();

    //call method
    var callId = "call";
    var callFormalTypes = fcnType.paramTypes;
    var formalName = 0;
    var callFormals = callFormalTypes map (
      formalType => {
        var formal = new VarDecl(formalType, "templateParam_" + formalName, None, 0);
        formalName += 1;
        formal;
      });
    var callStmts = List[Stmt]();
    fcnType.returnType match {
      case voidType: VoidType => {
        callStmts :+= new ReturnStmt(None, 0);
      }
      case intType: IntType => {
        callStmts :+= new ReturnStmt(Some(new IntExpr(0, 0)), 0);
      }
      case boolType: BoolType => {
        callStmts :+= new ReturnStmt(Some(new BoolExpr(true, 0)), 0);
      }
      case stringType: StringType => {
        callStmts :+= new ReturnStmt(Some(new StringExpr("", 0)), 0);
      }
      case _ => {
        callStmts :+= new ReturnStmt(Some(new NullExpr(0)), 0);
      }
    }
    var callBlock = new BlockStmt(List[VarDecl](), callStmts, 0);
    var callMethod = fcnType.returnType match {
      case voidType: VoidType => {
        new VoidMethod(callId, callFormals, callBlock, 0);
      }
      case _ => {
        new FruitfulMethod(fcnType.returnType, callId, callFormals, callBlock, 0);
      }
    }

    //methods - call (no create)
    var methods = List[MethodDecl](callMethod);

    //closure template class
    var closureTemplate = new ClassDecl(templateName, None, fields, methods, 0);
    templateClasses :+= closureTemplate;
    return closureTemplate;
  }

  /**
   * hasTemplateClass
   * Returns true iff a closure template has already been created for the given id
   */
  def hasTemplateClass(id: String): Boolean = {
    for (template <- templateClasses) {
      if (template.classId == id) {
        return true;
      }
    }
    return false;
  }

  /**
   * createClosureForFunction
   * Creates a closure class for the given function with the given parent method, class, and functions
   * Appends the closure class to the global closureClasses list
   */
  def createClosureForFunction(
    fcnId: String,
    fcnExpr: FunctionExpr,
    parentMethod: MethodDecl,
    parentClass: ClassDecl,
    parentFunctions: List[FunctionExpr],
    parentFunctionIds: List[String],
    parentLocals: List[VarDecl]): ClassDecl = {
    var className = createClassName(fcnId, parentMethod, parentClass, parentFunctionIds);

    //fields
    var fields = Set[FieldDecl]();

    //fields: fields of parent class
    for (fDecl <- parentClass.fields) {
      fields += fDecl;
    }

    //fields: parameters of parent method
    for (vDecl <- parentMethod.formals) {
      var fieldDecl = new FieldDecl(vDecl.myType, vDecl.id, vDecl.line);
      fields += fieldDecl;
    }

    //fields: local variables that are in scope
    for (vDecl <- parentLocals) {
      if (vDecl.id != fcnId) {
        fields += new FieldDecl(vDecl.myType, vDecl.id, vDecl.line);
      }
    }

    //fields: formals of parent functions
    for (pFcn <- parentFunctions) {
      for (formal <- pFcn.formals) {
        fields += new FieldDecl(formal.myType, formal.id, formal.line);
      }
    }

    //fields: local variables in scope from parent functions
    var fcnLocals = getFunctionLocals(fcnExpr, parentFunctions);
    for (fLocal <- fcnLocals) {
      fields += new FieldDecl(fLocal.myType, fLocal.id, fLocal.line);
    }

    var fieldsList = fields.toList;

    //create method
    var createReturnType = new ClassType(className, 0);
    var createId = "create";
    var createFormals = fieldsList map (
      field => {
        var formal = new VarDecl(field.myType, field.id, None, field.line);
        formal.setIsParam(true);
        formal;
      });
    var createStmts = Seq[Stmt]();
    createStmts = createFormals map (
      formal => {
        var dotLoc = new DotLoc(new ThisExpr("this", 0), formal.id, 0);
        var locExpr = new LocExpr(new IdLoc(formal.id, 0), 0);
        var assign = new LocStmt(dotLoc, locExpr, 0);
        assign;
      });
    createStmts :+= new ReturnStmt(Some(new ThisExpr("this", 0)), 0);
    var createBlock = new BlockStmt(List[VarDecl](), createStmts.toList, 0);
    var createMethod = new FruitfulMethod(createReturnType, createId, createFormals.toList, createBlock, 0);

    //call method
    var callId = "call";
    var callFormals = fcnExpr.formals;
    var callBlock = fcnExpr.block;
    var callMethod = fcnExpr.returnType match {
      case voidType: VoidType => {
        new VoidMethod(callId, callFormals, callBlock, 0);
      }
      case _ => {
        new FruitfulMethod(fcnExpr.returnType, callId, callFormals, callBlock, 0);
      }
    }

    //methods
    var methods = List[MethodDecl](createMethod, callMethod);

    //function type
    var fcnFormalTypes = fcnExpr.formals map (formal => formal.myType);
    var functionType = new FunctionType(fcnExpr.returnType, fcnFormalTypes.toList, fcnExpr.line);
    var templateName = createTemplateName(functionType);
    if (!hasTemplateClass(templateName)) {
      createClosureTemplate(fcnExpr);
    }

    //closure class
    var closureClass = new ClassDecl(className, Some(templateName), fields.toList, methods, 0);
    closureClass.setFunctionType(functionType);
    closureClasses :+= closureClass;

    //recursively handle any nested functions
    var newParentFunctions = parentFunctions :+ fcnExpr;
    var newParentFunctionIds = parentFunctionIds :+ fcnId;
    closureStmtPass(fcnExpr.block, parentMethod, parentClass, newParentFunctions, newParentFunctionIds);

    return closureClass;
  }

  /**
   * createTemplateName
   * Creates a name for a template closure class
   * 	stringified function type + "_Template"
   */
  def createTemplateName(fcnType: FunctionType): String = {
    return ASTPrettyString.prettyTemplateType(fcnType) + "_Template";
  }

  /**
   * createClassName
   * Creates a name for a closure class
   * 	with a function name, parent method, parent class, and N parent functions:
   * Class_Method_ParentFunction1_ParentFunction_2_...ParentFunctionN_FunctionName_Closure
   */
  def createClassName(fcnId: String, parentMethod: MethodDecl, parentClass: ClassDecl, parentFunctionIds: List[String]): String = {
    var str = parentClass.classId + "_" + parentMethod.id + "_";

    for (id <- parentFunctionIds) {
      str += id + "_";
    }

    str += fcnId + "_Closure";

    return str;
  }

  /**
   * getClosureById
   * Returns the ClassDecl of the closure class with the given id, or None if none exists
   */
  def getClosureById(id: String): Option[ClassDecl] = {
    for (closure <- closureClasses) {
      if (closure.classId == id) {
        return Some(closure);
      }
    }
    return None;
  }

  /**
   * Pass 2: Function definition and call replacement
   */

  /**
   * convertClass
   * Returns a new class with function definitions and calls replaced
   */
  def convertClass(cDecl: ClassDecl): ClassDecl = {
    var convertedFields = cDecl.fields map (fDecl => convertField(fDecl));
    var convertedMethods = cDecl.methods map (mDecl => convertMethod(mDecl));
    return new ClassDecl(cDecl.classId, cDecl.extendsId, convertedFields, convertedMethods, cDecl.line);
  }

  /**
   * convertField
   * Returns a new field decl with any function types replaced by closure types
   */
  def convertField(fDecl: FieldDecl): FieldDecl = {
    var fixedType = fixType(fDecl.myType);
    return new FieldDecl(fixedType, fDecl.id, fDecl.line);
  }

  /**
   * convertMethod
   * Returns a new method with function definitions and calls replaced
   */
  def convertMethod(mDecl: MethodDecl): MethodDecl = {
    var convertedFormals = mDecl.formals map (formal => convertVarDecl(formal, mDecl));
    var convertedBlock = convertBlock(mDecl.block, mDecl);
    mDecl match {
      case voidMethod: VoidMethod => {
        return new VoidMethod(mDecl.id, convertedFormals, convertedBlock, mDecl.line);
      }
      case fMethod: FruitfulMethod => {
        var fixedReturn = fixType(fMethod.returnType);
        return new FruitfulMethod(fixedReturn, fMethod.methodId,
          convertedFormals, convertedBlock, fMethod.methodLine);
      }
    }
  }

  /**
   * convertVarDecl
   * Returns a new var decl with function definitions and calls replaced
   */
  def convertVarDecl(vDecl: VarDecl, parentMethod: MethodDecl): VarDecl = {
    //fix the type of the variable declaration to handle any function types
    fixType(vDecl.myType);
    
    //determine whether the vDecl defines a function
    vDecl.myType match {
      //function declaration: replace with closure definition and possible instantiation
      case fcnType: FunctionType => {
        //get the template class that the function extends based on the function type
        var templateName = createTemplateName(fcnType);
        var templateType = new ClassType(templateName, 0);
        
        //get the closure class (if any) for the vDecl
        var closureOption = vDecl.getClosureClass();
        closureOption match {
          case Some(closure) => {
            vDecl.expr match {
              //vDecl is also an instantiation: replace with closureInstance.create()
              case Some(e) => {
                //set up the create call with arguments
                var createFormals = closure.fields;
                var createArgs = createFormals map (
                  formal => {
                    var idLoc = new IdLoc(formal.id, vDecl.line);
                    var locExpr = new LocExpr(idLoc, vDecl.line);
                    locExpr;
                  });
                 
                //create the closure instance
                var closureInstance = new ClassExpr(closure.classId, vDecl.line);
                vDecl.setClosureInstance(closureInstance);
                
                //call closureInstance.create()
                var createCall = new VirtualCall(Some(closureInstance), "create", createArgs, vDecl.line);
                var createCallExpr = new CallExpr(createCall, vDecl.line);
                var newDecl = new VarDecl(templateType, vDecl.id, Some(createCallExpr), vDecl.line);
                return newDecl;
              }
              //just a declaration, no instantiation
              case None => {
                var newDecl = new VarDecl(templateType, vDecl.id, None, vDecl.line);
                return newDecl;
              }
            }
          }
          //no closure found for vDecl
          case None => {
            var newDecl = new VarDecl(templateType, vDecl.id, vDecl.expr, vDecl.line);
            return newDecl;
          }
        }
      }
      //not a function declaration
      case _ => {
        vDecl.expr match {
          //translate the expression (if any), to handle any possible functions
          case Some(e) => {
            var newDecl = new VarDecl(vDecl.myType, vDecl.id, Some(convertExpr(e, parentMethod)), vDecl.line);
            return newDecl;
          }
          case None => {
            return vDecl;
          }
        }
      }
    }
  }

  /**
   * convertStmt
   * Returns a new statement with function definition and calls replaced
   */
  def convertStmt(stmt: Stmt, parentMethod: MethodDecl): Stmt = {
    stmt match {
      case blockStmt: BlockStmt => {
        return convertBlock(blockStmt, parentMethod);
      }
      case locStmt: LocStmt => {
        var convertedExpr = convertExpr(locStmt.expr, parentMethod);
        return new LocStmt(convertLoc(locStmt.loc, parentMethod), convertedExpr, locStmt.line);
      }
      case callStmt: CallStmt => {
        return new CallStmt(convertCall(callStmt.call, parentMethod), callStmt.line);
      }
      case returnStmt: ReturnStmt => {
        var convertedExpr = returnStmt.expr match {
          case Some(e) => Some(convertExpr(e, parentMethod));
          case None    => None;
        }
        return new ReturnStmt(convertedExpr, returnStmt.line);
      }
      case ifStmt: IfStmt => {
        var convertedCond = convertExpr(ifStmt.cond, parentMethod);
        var convertedThen = convertStmt(ifStmt.then, parentMethod);
        var convertedElse = ifStmt.elseStmt match {
          case Some(s) => Some(convertStmt(s, parentMethod));
          case None    => None;
        }
        return new IfStmt(convertedCond, convertedThen, convertedElse, ifStmt.line);
      }
      case whileStmt: WhileStmt => {
        return new WhileStmt(convertExpr(whileStmt.expr, parentMethod), convertStmt(whileStmt.stmt, parentMethod), whileStmt.line);
      }
      case _ => {
        return stmt;
      }
    }
  }

  /**
   * convertBlock
   * Returns a new block statement with function definitions and calls replaced
   */
  def convertBlock(blockStmt: BlockStmt, parentMethod: MethodDecl): BlockStmt = {
    var convertedVarDecls = blockStmt.vars map (vDecl => convertVarDecl(vDecl, parentMethod));
    var convertedStmts = blockStmt.stmts map (stmt => convertStmt(stmt, parentMethod));
    return new BlockStmt(convertedVarDecls, convertedStmts, blockStmt.line);
  }

  /**
   * convertExpr
   * Returns a new expression with function definitions and calls replaced
   */
  def convertExpr(expr: Expr, parentMethod: MethodDecl): Expr = {
    expr match {
      case locExpr: LocExpr => {
        return new LocExpr(convertLoc(locExpr.loc, parentMethod), locExpr.line);
      }
      case callExpr: CallExpr => {
        return new CallExpr(convertCall(callExpr.call, parentMethod), callExpr.line);
      }
      case arrayExpr: ArrayExpr => {
        return new ArrayExpr(arrayExpr.myType, convertExpr(arrayExpr.expr, parentMethod), arrayExpr.line);
      }
      case lengthExpr: LengthExpr => {
        return new LengthExpr(convertExpr(lengthExpr.expr, parentMethod), lengthExpr.line);
      }
      case binExpr: BinExpr => {
        return new BinExpr(convertExpr(binExpr.left, parentMethod), binExpr.op, convertExpr(binExpr.right, parentMethod), binExpr.line);
      }
      case unExpr: UnExpr => {
        return new UnExpr(unExpr.op, convertExpr(unExpr.expr, parentMethod), unExpr.line);
      }
      //function expression: replace with closureInstance.create()
      case fcnExpr: FunctionExpr => {
        //convert the function block to handle any nested functions
        convertBlock(fcnExpr.block, parentMethod);
        
        //get the template class that the function extends, and create one if none exists
        var fcnFormalTypes = fcnExpr.formals map (formal => formal.myType);
        var fcnType = new FunctionType(fcnExpr.returnType, fcnFormalTypes.toList, fcnExpr.line);
        var templateName = createTemplateName(fcnType);
        if (!hasTemplateClass(templateName)) {
          createClosureTemplate(fcnType);
        }
        
        //get the closure class for the (anonymous) function expression and set up the create arguments
        var closure = anonToClosure(fcnExpr);
        var createFormals = closure.fields;
        var createArgs = createFormals map (
          formal => {
            var idLoc = new IdLoc(formal.id, fcnExpr.line);
            var locExpr = new LocExpr(idLoc, fcnExpr.line);
            locExpr;
          });
          
        //create the closure instance
        var closureInstance = new ClassExpr(closure.classId, fcnExpr.line);
        
        //replace the function expression with closureInstance.create()
        var createCall = new VirtualCall(Some(closureInstance), "create", createArgs, fcnExpr.line);
        var createCallExpr = new CallExpr(createCall, fcnExpr.line);
        return createCallExpr;

      }
      case _ => {
        return expr;
      }
    }
  }

  /**
   * convertCall
   * Returns a new call with function definitions and calls replaced
   */
  def convertCall(call: Call, parentMethod: MethodDecl): Call = {
    call match {
      case libCall: LibCall => {
        var exprs = libCall.exprs map (expr => convertExpr(expr, parentMethod));
        return new LibCall(libCall.id, exprs, libCall.line);
      }
      case virtualCall: VirtualCall => {
        var exprs = virtualCall.exprs map (expr => convertExpr(expr, parentMethod));
        virtualCall.expr match {
          case Some(e) => {
            return new VirtualCall(Some(convertExpr(e, parentMethod)), virtualCall.id, exprs, virtualCall.line);
          }
          case None => {
            return new VirtualCall(None, virtualCall.id, exprs, virtualCall.line);
          }
        }
      }
      case fcnCall: FunctionCall => {
        var fcnDecl = fcnCall.symtab.get.getVarDecl(fcnCall.id);
        var exprs = fcnCall.exprs map (expr => convertExpr(expr, parentMethod));
        fcnDecl match {
          case Some(fDecl) => {
            var idLoc = new IdLoc(fDecl.id, fcnCall.line);
            var locExpr = new LocExpr(idLoc, fcnCall.line);

            //create a virtual call to fDecl.id.call
            var fcnToVirtual = new VirtualCall(Some(locExpr), "call", exprs, fcnCall.line);
            return fcnToVirtual;
          }
          case None => {
            var fcnField = fcnCall.symtab.get.getFieldDecl(fcnCall.id);
            fcnField match {
              case Some(fDecl) => {
                var idLoc = new IdLoc(fDecl.id, fcnCall.line);
                var locExpr = new LocExpr(idLoc, fcnCall.line);

                //create a virtual call to fDecl.id.call
                var fcnToVirtual = new VirtualCall(Some(locExpr), "call", exprs, fcnCall.line);
                return fcnToVirtual;
              }
              case None => {
                return fcnCall;
              }
            }
          }
        }
      }
      case anonCall: AnonCall => {
        var exprs = anonCall.exprs map (expr => convertExpr(expr, parentMethod));
        var closure = anonToClosure(anonCall.fcnExpr);
        var createFormals = closure.fields;
        var createArgs = createFormals map (
          formal => {
            var idLoc = new IdLoc(formal.id, anonCall.line);
            var locExpr = new LocExpr(idLoc, anonCall.line);
            locExpr;
          });
        var closureInstance = new ClassExpr(closure.classId, anonCall.line);
        var createCall = new VirtualCall(Some(closureInstance), "create", createArgs, anonCall.line);
        var createCallExpr = new CallExpr(createCall, anonCall.line);
        var anonToVirtual = new VirtualCall(Some(createCallExpr), "call", exprs, anonCall.line);
        return anonToVirtual;
        return anonCall;
      }
    }
  }

  /**
   * convertLoc
   * Returns a new location with function definitions and calls replaced
   */
  def convertLoc(loc: Location, parentMethod: MethodDecl): Location = {
    loc match {
      case idLoc: IdLoc => {
        return loc;
      }
      case dotLoc: DotLoc => {
        return new DotLoc(convertExpr(dotLoc.expr, parentMethod), dotLoc.id, dotLoc.line);
      }
      case arrayLoc: ArrayLoc => {
        return new ArrayLoc(convertExpr(arrayLoc.e1, parentMethod), convertExpr(arrayLoc.e2, parentMethod), arrayLoc.line);
      }
    }
  }

}