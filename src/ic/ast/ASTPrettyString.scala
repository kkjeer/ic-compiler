package ic.ast;

object ASTPrettyString {
  def prettyASTNode(node: ASTNode): String = {
    node match {
      case p: Program => {
        return prettyProgram(p);
      }
      case cDecl: ClassDecl => {
        return prettyClass(cDecl);
      }
      case mDecl: MethodDecl => {
        return prettyMethod(mDecl);
      }
      case fDecl: FieldDecl => {
        return prettyType(fDecl.myType) + " " + fDecl.id;
      }
      case t: Type => {
        return prettyType(t);
      }
      case vDecl: VarDecl => {
        return prettyVarDecl(vDecl);
      }
      case stmt: Stmt => {
        return prettyStmt(stmt);
      }
      case expr: Expr => {
        return prettyExpr(expr);
      }
      case call: Call => {
        return prettyCall(call);
      }
      case loc: Location => {
        return prettyLoc(loc);
      }
      case _ => {
        return "other node";
      }
    }
  }
  
  def prettyProgram(p: Program): String = {
    var result = "";
    
    for (cDecl <- p.classes) {
      result += prettyClass(cDecl) + "\n";
    }
    
    return result;
  }
  
  def prettyClass(cDecl: ClassDecl): String = {
    var result = "class " + cDecl.classId + " extends " + cDecl.extendsId + " {\n";
    
    for (field <- cDecl.fields) {
      result += prettyASTNode(field) + "\n";
    }
    for (mDecl <- cDecl.methods) {
      result += prettyMethod(mDecl) + "\n";
    }
    
    result += "}\n";
    
    return result;
  }
  
  def prettyMethod(mDecl: MethodDecl): String = {
    mDecl match {
      case vMethod: VoidMethod => {
        return "void " + vMethod.id + "(" + commaSeparated(vMethod.formals.toList) + ")" +  
                " {\n" + prettyStmt(vMethod.block) + "\n}";
      }
      case fMethod: FruitfulMethod => {
        return prettyType(fMethod.returnType) + " " + fMethod.id + "(" + commaSeparated(fMethod.formals.toList) + ")" + 
                 " {\n" + prettyStmt(fMethod.block) + "\n}";
      }
    }
  }
  
  def prettyType(t: Type): String = {
    t match {
      case i: IntType => {
        return "int";
      }
      case b: BoolType => {
        return "boolean";
      }
      case s: StringType => {
        return "string";
      }
      case c: ClassType => {
        return c.classId;
      }
      case a: ArrayType => {
        return prettyType(a.theType) + " []";
      }
      case n: NullType => {
        return "null";
      }
      case v: VoidType => {
        return "void";
      }
      case f: FunctionType => {
        return "<" + commaSeparated(f.paramTypes) + "> => " + prettyType(f.returnType);
      }
      case _ => {
        return "other type";
      }
    }
  }
  
  def prettyTemplateType(t: Type): String = {
    t match {
      case f: FunctionType => {
        var prettyParams = f.paramTypes map(param => prettyTemplateType(param));
        return "PARAMS__" + underscoreSeparatedStrs(prettyParams) + "__RETURN__" + prettyTemplateType(f.returnType);
      }
      case a: ArrayType => {
        return prettyTemplateType(a.theType) + "_array";
      }
      case _ => {
        return prettyType(t);
      }
    }
  }
  
  def prettyVarDecl(vDecl: VarDecl): String = {
    vDecl.expr match {
      case Some(e) => {
        return prettyType(vDecl.myType) + " " + vDecl.id + " = " + prettyExpr(e);
      }
      case None => {
        return prettyType(vDecl.myType) + " " + vDecl.id;
      }
    }
  }
  
  def prettyStmt(stmt: Stmt): String = {
    stmt match {
      case block: BlockStmt => {
        var str = "";
        for (vDecl <- block.vars) {
          str += prettyVarDecl(vDecl) + "\n";
        }
        for (stmt <- block.stmts) {
          str += prettyStmt(stmt) + "\n";
        }
        if (str.length > 0) {
          str = str.substring(0, str.length - 1);
        }
        return str;
      }
      case locStmt: LocStmt => {
        return prettyLoc(locStmt.loc) + " = " + prettyExpr(locStmt.expr);
      }
      case callStmt: CallStmt => {
        return prettyCall(callStmt.call);
      }
      case returnStmt: ReturnStmt => {
        returnStmt.expr match {
          case Some(e) => {
            return "return " + prettyExpr(e);
          }
          case None => {
            return "return";
          }
        }
      }
      case ifStmt: IfStmt => {
        ifStmt.elseStmt match {
          case Some(s) => {
            return "if (" + prettyExpr(ifStmt.cond) + ") then " + prettyStmt(ifStmt.then) + " else " + prettyStmt(s);
          }
          case None => {
            return "if (" + prettyExpr(ifStmt.cond) + ") then " + prettyStmt(ifStmt.then);
          }
        }
      }
      case whileStmt: WhileStmt => {
        return "while (" + prettyExpr(whileStmt.expr) + ")" + prettyStmt(whileStmt.stmt);
      }
      case breakStmt: BreakStmt => {
        return "break";
      }
      case continueStmt: ContinueStmt => {
        return "continue";
      }
      case _ => {
        return "other stmt";
      }
    }
  }
  
  def prettyExpr(expr: Expr): String = {
    expr match {
      case locExpr: LocExpr => {
        return prettyLoc(locExpr.loc);
      }
      case callExpr: CallExpr => {
        return prettyCall(callExpr.call);
      }
      case thisExpr: ThisExpr => {
        return "this";
      }
      case classExpr: ClassExpr => {
        return "new " + classExpr.classId + "()";
      }
      case arrayExpr: ArrayExpr => {
        return "new " + prettyType(arrayExpr.myType) + "[" + prettyExpr(arrayExpr.expr) + "]";
      }
      case lengthExpr: LengthExpr => {
        return prettyExpr(lengthExpr.expr) + ".length";
      }
      case binExpr: BinExpr => {
        return prettyExpr(binExpr.left) + " " + prettyBinop(binExpr.op) + " " + prettyExpr(binExpr.right);
      }
      case unExpr: UnExpr => {
        return prettyUnop(unExpr.op) + prettyExpr(unExpr.expr);
      }
      case intExpr: IntExpr => {
        return intExpr.value + "";
      }
      case boolExpr: BoolExpr => {
        return boolExpr.value + "";
      }
      case stringExpr: StringExpr => {
        return "\"" + stringExpr.value + "\"";
      }
      case nullExpr: NullExpr => {
        return "null";
      }
      case fcnExpr: FunctionExpr => {
        return "(" + commaSeparated(fcnExpr.formals.toList) + "): " + 
                prettyType(fcnExpr.returnType) + " => {" + prettyStmt(fcnExpr.block) + "}";
      }
      case _ => {
        return "other expr";
      }
    }
  }
  
  def prettyLoc(loc: Location): String = {
    loc match {
      case idLoc: IdLoc => {
        return idLoc.id;
      }
      case dotLoc: DotLoc => {
        return prettyExpr(dotLoc.expr) + "." + dotLoc.id;
      }
      case arrayLoc: ArrayLoc => {
        return prettyExpr(arrayLoc.e1) + "[" + prettyExpr(arrayLoc.e2) + "]";
      }
    }
  }
  
  def prettyCall(call: Call): String = {
    call match {
      case libCall: LibCall => {
        return "Library." + libCall.id + "(" + commaSeparated(libCall.exprs.toList) + ")";
      }
      case virtualCall: VirtualCall => {
        virtualCall.expr match {
          case Some(e) => {
            return prettyExpr(e) + "." + virtualCall.id + "(" + commaSeparated(virtualCall.exprs.toList) + ")";
          }
          case None => {
            virtualCall.id + "(" + commaSeparated(virtualCall.exprs.toList) + ")";
          }
        }
      }
      case fcnCall: FunctionCall => {
         return fcnCall.id + "(" + commaSeparated(fcnCall.exprs.toList) + ")";
      }
      case anonCall: AnonCall => {
        return prettyExpr(anonCall.fcnExpr) + "(" + commaSeparated(anonCall.exprs.toList) + ")";
      }
    }
  }
  
  def prettyBinop(op: Binop): String = {
    op match {
      case plus: Plus => {
        return "+";
      }
      case minus: Minus => {
        return "-";
      }
      case mult: Mult => {
        return "*";
      }
      case div: Div => {
        return "/";
      }
      case mod: Mod => {
        return "%";
      }
      case and: And => {
        return "&&";
      }
      case or: Or => {
        return "||";
      }
      case less: Less => {
        return "<";
      }
      case lesseq: LessEq => {
        return "<=";
      }
      case greater: Greater => {
        return ">";
      }
      case greatereq: GreaterEq => {
        return ">=";
      }
      case equal: Equal => {
        return "==";
      }
      case neq: NotEqual => {
        return "!=";
      }
    }
  }

  def prettyUnop(op: Unop): String = {
    op match {
      case not: Not => {
        return "!";
      }
      case negative: Negative => {
        return "-";
      }
    }
  }
  
  def commaSeparated(nodes: List[ASTNode]): String = {
    var str = "";
    if (nodes.length == 0) {
      return str;
    }

    for (node <- nodes) {
      str += prettyASTNode(node) + ", ";
    }
    str = str.substring(0, str.length - 2);

    return str;
  }
  
  def underscoreSeparatedStrs(nodes: List[String]): String = {
    var str = "";
    if (nodes.length == 0) {
      return str;
    }

    for (node <- nodes) {
      str += node + "_";
    }
    str = str.substring(0, str.length - 1);

    return str;
  }
}