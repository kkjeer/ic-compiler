package ic.computeOffsets

import ic.Util
import ic.ast._
import ic.tc._
import ic.dot._
import ic.error._

import scala.collection.immutable._

object calcOffsets {

  /* 
   * Recursively traverse AST's program nodes to calculate offsets for:
   * *fields, 
   * *methods, and 
   * *variable declarations
   * 
   * We also traverse statements because they can have variable declarations inside them, 
   * but they don't get their own offset. 
   * */
  def computeOffsets(program: Program) {
    for (cDecl <- program.classes) {
      Util.debug("\n\n***Calculating offsets for class: " + cDecl.classId + "***");

      // Initialize indexes for f(ields), m(ethods), and v(ariables):
      var fIndex = 0;
      var mIndex = 0;

      // Initialize vectors for available methods in parent and current classes:
      var parentMethods = Vector[String]()
      var currentClassAvailMethods = Vector[String]()

      /*
      * Check if the class extends another class.
      * If it does, get the class 
      */
      cDecl.extendsId match {
        case Some(ext) => {
          //Get the class object which the current class extends: 
          val extendsClass = cDecl.symtab.get.getClassDecl(ext)
          extendsClass match {
            case Some(classE) => {
              // Get the length of parent class' fields and methods so we can offset the current class' correctly
              fIndex = classE.fields.length
              mIndex = classE.methods.length

              // Add method IDs to the Vector of parent methods:
              for (method <- classE.methods) {
                parentMethods = parentMethods :+ method.id
                cDecl.vTable = cDecl.vTable :+ method
              }
            }
            case None => {}
          }
        }
        case None => {}
      }
      
       

      // Index the fields following the parent class' field offset:
      for (field <- cDecl.fields) {
        field.setIndex(fIndex);
        fIndex = fIndex + 1
      }
      cDecl.maxFieldIndex = Some(fIndex);
      cDecl.payloadSize = fIndex;

      // Index the methods following the parent class' offset: 
      for (method <- cDecl.methods) {
        var vIndex = 1
        Util.debug("\n\t---Calculating offsets for method: " + method.id + "---");

        // Only use a new index if the method hasn't been overridden from the parent class:
        if (parentMethods contains method.id) {
          method.setIndex(cDecl.symtab.get.parent.get.getMethodDecl(method.id).get.index);
          Util.debug("\tDefined method index is: " + method.index);
          cDecl.vTable = cDecl.vTable.updated(method.index, method);
          
        } 
        
        //If method hasn't been overridden, give it a new index and increment the index counter: 
        else {
          method.setIndex(mIndex);
          mIndex = mIndex + 1;
          currentClassAvailMethods = currentClassAvailMethods :+ method.id;
          cDecl.vTable = cDecl.vTable :+ method; 
        }

        // Expand the methods to give the VarDecls an offset:
        method match {
          case VoidMethod(methodId, methodFormals, methodBlock, methodLine) => {

            // Increment the varDecl offset for the method's varDecls:
            for ((varDecl,i) <- methodFormals.zipWithIndex) {
              //TODO: should method formals start at 0 or 1?
              varDecl.setIndex(i + 1);
              Util.debug("\tClass " + cDecl.classId + " Method " + methodId + " formal " + varDecl.id + " index: " + varDecl.index);
            }

            // Offset varDecls in the Block Statement: 
            vIndex = offsetVarsFromStmt(vIndex, methodBlock, method);

            // Recursurvly traverse all statements and sub-statements in the block method:
            for (stmt <- methodBlock.stmts) {
              vIndex = offsetVarsFromStmt(vIndex, stmt, method);
            }
          }

          case FruitfulMethod(returnType, methodId, methodFormals, methodBlock, methodLine) => {

            // Increment the varDecl offset for the method's varDecls:
            for ((varDecl,i) <- methodFormals.zipWithIndex) {
              //TODO: should method formals start at 0 or 1?
              varDecl.setIndex(i + 1);
              Util.debug("\tClass " + cDecl.classId + " Method " + methodId + " formal " + varDecl.id + " index: " + varDecl.index);
            }

            // Offset varDecls in the Block Statement:
            Util.assertTrue(vIndex != 0, "0 vindex")
            vIndex = offsetVarsFromStmt(vIndex, methodBlock, method);
          }
        }

        //Set the maxVarIndex field for easy access in TAC code. 
        //This is the largest offset for the method's variable declarations
        method.maxVarIndex = Some(vIndex)
        //For classes, it's rather meaningless, but it's the largest offset within one of its child classes
        cDecl.maxVarIndex = Some(vIndex)

        Util.debug("\tMethod name: " + method.id + " has maxVarOffset of: " + method.maxVarIndex)
      }
    }
  }

  /* 
   * Recursively traverse ALL THE STATEMENTS to make the offset calculations for any var decls they have.
   * Only compute a offset for the varDecls inside if it's an ifStmt, WhileStmt, or BlockStmt, as these 
   * are the only statements which can contain varDecls. 
   * */
  def offsetVarsFromStmt(i: Int, stmt: Stmt, parentMethod: MethodDecl): Int = {
    var currentIndex = i;
    Util.assertTrue(currentIndex != 0, "offsset 0")

    stmt match {
      case IfStmt(cond: Expr, then: Stmt, elseStmt: Option[Stmt], line) => {
        // Index varDecls in then statement and increment index by one when done: 
        currentIndex = offsetVarsFromStmt(currentIndex, then, parentMethod);

        // If there's an else statement, index it and increment current index by one:
        elseStmt match {
          case Some(s) => {
            currentIndex = offsetVarsFromStmt(currentIndex, s, parentMethod);
          }
          case None => {}
        }
        Util.assertTrue(currentIndex != 0, "offsset 0")
        return currentIndex;
      }

      case WhileStmt(expr: Expr, stmt: Stmt, line: Int) => {
        currentIndex = offsetVarsFromStmt(currentIndex, stmt, parentMethod);
        Util.assertTrue(currentIndex != 0, "offsset 0")
        return currentIndex;
      }

      case BlockStmt(vars: Seq[VarDecl], stmts: Seq[Stmt], line: Int) => {
        for (varDecl <- vars) {
          varDecl.setIndex(currentIndex);
          currentIndex = currentIndex + 1;
          Util.debug("\t" + varDecl.id + " Index of: " + varDecl.index)
          parentMethod.varTable = parentMethod.varTable :+ varDecl.id; 
        }

        for (stmt <- stmts) {
          currentIndex = offsetVarsFromStmt(currentIndex, stmt, parentMethod);
        }
        Util.assertTrue(currentIndex != 0, "offsset 0")
        return currentIndex;
      }

      case _ => {
        Util.assertTrue(currentIndex != 0, "offsset 0")
        return currentIndex;
      }
    }
  }

  /* 
   * Traverse TAC instruction lists and assign offsets to the TAC temporary variables. 
   * These are generated during TAC code creation.
   * */
  def setTempVarOffsets(program: Program) {
    var slotSize = 1; //using a size of one so it's easy to change sizes later
    for (cDecl <- program.classes) {
      for (mDecl <- cDecl.methods) {
        var tacList = mDecl.getTacList();
        var maxLocalVarOffset = mDecl.maxVarIndex.get;
        for (temp <- tacList.temps) {
          var i = Integer.parseInt(temp.id.substring(temp.id.indexOf("t") + "t".length, temp.id.length));
          var offset = maxLocalVarOffset + (i + 1) * slotSize;
          temp.setOffset(offset);
        }
        tacList.frameSize = ((tacList.temps.length match{
          case 0 => {
            0
          }
          case _ => {
            tacList.temps(tacList.temps.length - 1).offset;
          }
        }) + slotSize) & ~(slotSize * 2 - 1) // align to multiple of 2 slots (16 bytes)
        
      }
    }
  }

}
