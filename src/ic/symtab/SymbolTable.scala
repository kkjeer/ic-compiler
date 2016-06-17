/* Testing a file for Symbol Tables */

package ic.symtab

import ic.ast._
import ic.error._
import scala.collection.mutable._

class SymbolTable(val description: String, val parent: Option[SymbolTable], val owner: Option[ClassDecl]) {

  //instance variable maps to hold each type of declaration
  var classMap: Map[String, ClassDecl] = Map[String, ClassDecl]();
  var methodMap: Map[String, MethodDecl] = Map[String, MethodDecl]();
  var fieldMap: Map[String, FieldDecl] = Map[String, FieldDecl]();
  var varMap: Map[String, VarDecl] = Map[String, VarDecl]();

  /*Inserts each type of declaration into the scope */
  def add(name: String, d: ClassDecl) = {
    val currentClass = getClassDecl(name);
    currentClass match {
      case Some(cDecl) => {
        throw new ScopeError(d.line, "class " + name + " is already declared on line " + cDecl.line);
      }
      case None => {
        classMap(name) = d;
      }
    }
  }
  def add(name: String, d: MethodDecl) = {
    val currentMethod = methodMap.get(name);
    currentMethod match {
      case Some(mDecl) => {
        throw new ScopeError(d.line, "method " + name + " is already declared on line " + mDecl.line);
      }
      case None => {
        methodMap(name) = d;
      }
    }
  }
  def add(name: String, d: FieldDecl) = {
    val currentField = getFieldDecl(name);
    currentField match {
      case Some(fDecl) => {
        println(this);
        throw new ScopeError(d.line, "field " + name + " is already declared on line " + fDecl.line);
      }
      case None => {
        fieldMap(name) = d;
      }
    }
  }
  def add(name: String, d: VarDecl) = {
    //check for a variable already declared in the current scope
    val currentVar = varMap.get(name);
    currentVar match {
      //variable is already declared in current scope => error
      case Some(vDecl) => {
        throw new ScopeError(d.line, "variable " + name + " is already declared on line " + vDecl.line);
      }
      //not declared in current scope => search parent scopes for param declaration (check param shadowing)
      case None => {
        val currentVarAnywhere = getVarDecl(name);
        currentVarAnywhere match {
          //variable declared in some parent scope => check if it's a parameter
          case Some(vDecl) => {
            //attempting to shadow a param => error
            if (vDecl.isParam) {
              throw new ScopeError(d.line, "variable " + name + " is already declared on line " + vDecl.line);
            }
            //variable is declared in parent, but it's not a parameter => shadowing is okay
            varMap(name) = d;
          }
          //not declared in parent scope => okay
          case None => {
            varMap(name) = d;
          }
        }
      }
    }
  }

  /*Methods that return declarations*/

  /*
   * getClassDecl()
   * Returns the class declaration of the given name, or None if none exists
   * Recursively searches parent scopes
   */
  def getClassDecl(name: String): Option[ClassDecl] = {
    var thisClass = classMap.get(name);
    thisClass match {
      case foundClass: Some[ClassDecl] => {
        return foundClass;
      }
      case None => parent match {
        case Some(foundParent) => return foundParent.getClassDecl(name);
        case None              => return None;
      }
    }
  }

  /*
   * getMethodDecl()
   * Returns the method declaration of the given name, or None if none exists
   * Recursively searches parent scopes
   */
  def getMethodDecl(name: String): Option[MethodDecl] = {
    var thisMethod = methodMap.get(name);
    thisMethod match {
      case foundMethod: Some[MethodDecl] => return foundMethod;
      case None => parent match {
        case Some(foundParent) => return foundParent.getMethodDecl(name);
        case None              => return None;
      }
    }
  }

  /*
   * getFieldDecl()
   * Returns the field declaration of the given name, or None if none exists
   * Recursively searches parent scopes
   */
  def getFieldDecl(name: String): Option[FieldDecl] = {
    var thisField = fieldMap.get(name);
    thisField match {
      case foundField: Some[FieldDecl] => return foundField;
      case None => parent match {
        case Some(foundParent) => return foundParent.getFieldDecl(name);
        case None              => return None;
      }
    }
  }

  /*
   * getVarDecl()
   * Returns the variable declaration of the given name, or None if none exists
   * Recursively searches parent scopes
   */
  def getVarDecl(name: String): Option[VarDecl] = {
    var thisVar = varMap.get(name);
    thisVar match {
      case foundVar: Some[VarDecl] => return foundVar;
      case None => parent match {
        case Some(foundParent) => return foundParent.getVarDecl(name);
        case None              => return None;
      }
    }
  }

  /*
   * getThis()
   * Returns the class declaration of the class that contains the current scope, or None if none exists
   * Recursively searches parent scopes
   */
  def getThis(): Option[ClassDecl] = {
    owner match {
      case foundOwner: Some[ClassDecl] => return foundOwner;
      case None => parent match {
        case Some(foundParent) => return foundParent.getThis();
        case None              => return None;
      }
    }
  }

  /*
   * getOverriddenMethod()
   * Returns the method declaration of the method that the given method overrides, or None if none exists
   * Recursively searches parent scopes
   */
  def getOverriddenMethod(mDecl: MethodDecl): Option[MethodDecl] = {
    val thisClass = getThis();
    thisClass match {
      case Some(foundClass) => {
        foundClass.extendsId match {
          case Some(eId) => {
            return foundClass.symtab.get.parent.get.getMethodDecl(mDecl.id);
          }
          case None => {
            return None;
          }
        }
      }
      case None => {
        throw new ScopeError(mDecl.line, "method " + mDecl.id + " is not part of a class");
      }
    }
  }

  /*Methods that return symbol tables*/

  /*
   * getClassTable()
   * Returns the symbol table that contains the class declaration with the given name, or None if none exists
   * Recursively searches parent scopes
   */
  def getClassTable(name: String): Option[SymbolTable] = {
    var thisClass = classMap.get(name);
    thisClass match {
      case foundClass: Some[ClassDecl] => return Some(this);
      case None => parent match {
        case Some(foundParent) => return foundParent.getClassTable(name);
        case None              => return None;
      }
    }
  }

  /*
   * getClassParentTable()
   * Returns the symbol table that is the parent of the class that extends the class with the given name:
   * Either the table corresponding to the extended class, or this (global scope)
   */
  def getClassParentTable(name: Option[String], line: Int): Option[SymbolTable] = {
    val extendsTable = getExtendsTable(name, line);
    extendsTable match {
      case eTable: Some[SymbolTable] => {
        return eTable;
      }
      case None => {
        return Some(this);
      }
    }
  }

  /*
   * getExtendsTable()
   * Returns the symbol table of the class with the given optional name, or None if none exists
   */
  def getExtendsTable(name: Option[String], line: Int): Option[SymbolTable] = {
    name match {
      case None => return None;
      case Some(extendsName) => {
        var thisClass = classMap.get(extendsName);
        thisClass match {
          case Some(foundClassDecl) => return foundClassDecl.symtab;
          case None => {
            throw new ScopeError(line, "no class found for " + name);
          }
        }
      }
    }
  }

  /*
   * getMethodTable()
   * Returns the symbol table that contains the method declaration with the given name, or None if none exists
   * Recursively searches parent scopes
   */
  def getMethodTable(name: String): Option[SymbolTable] = {
    var thisMethod = methodMap.get(name);
    thisMethod match {
      case foundMethod: Some[MethodDecl] => return Some(this);
      case None => parent match {
        case Some(foundParent) => return foundParent.getMethodTable(name);
        case None              => return None;
      }
    }
  }

  /*
   * getFieldTable()
   * Returns the symbol table that contains the field declaration with the given name, or None if none exists
   * Recursively searches parent scopes
   */
  def getFieldTable(name: String): Option[SymbolTable] = {
    var thisField = fieldMap.get(name);
    thisField match {
      case foundField: Some[FieldDecl] => return Some(this);
      case None => parent match {
        case Some(foundParent) => return foundParent.getFieldTable(name);
        case None              => return None;
      }
    }
  }

  /*
   * getVarTable()
   * Returns the symbol table that contains the var declaration with the given name, or None if none exists
   * Recursively searches parent scopes
   */
  def getVarTable(name: String): Option[SymbolTable] = {
    var thisVar = varMap.get(name);
    thisVar match {
      case foundVar: Some[VarDecl] => return Some(this);
      case None => parent match {
        case Some(foundParent) => return foundParent.getVarTable(name);
        case None              => return None;
      }
    }
  }

  /*Additional methods*/

  /*
   * inheritsFrom()
   * Returns true iff the current scope inherits from the class with the given name
   * Used to check subclassing including subclassing
   * Recursively searches parent scopes
   */
  def inheritsFrom(aClassId: String): Boolean = {
    owner match {
      case Some(foundOwner) => {
        val thisClass = foundOwner.classId;
        if (thisClass == aClassId) {
          return true;
        }
        parent match {
          case Some(foundParent) => {
            return foundParent.inheritsFrom(aClassId);
          }
          case None => {
            return false;
          }
        }
      }
      case None => {
        return false;
      }
    }
  }

  /*
   * toString()
   * Returns a string representation of the symbol table
   */
  override def toString(): String = {
    var str = description + "\n";

    str += "CLASS DECLARATIONS\n";
    for (className <- classMap.keySet) {
      str += className + "\t" + classMap(className) + "\n";
    }

    str += "\nMETHOD DECLARATIONS\n";
    for (methodName <- methodMap.keySet) {
      str += methodName + "\t" + methodMap(methodName) + "\n";
    }

    str += "\nFIELD DECLARATIONS\n";
    for (fieldName <- fieldMap.keySet) {
      str += fieldName + "\t" + fieldMap(fieldName) + "\n";
    }

    str += "\nVARIABLE DECLARATIONS\n";
    for (varName <- varMap.keySet) {
      str += varName + "\t" + varMap(varName) + "\n";
    }

    return str;
  }

  /*
   * getParent()
   * Returns the parent of the symbol table, or None if none exists
   */
  def getParent(): Option[SymbolTable] = {
    return parent;
  }

}
