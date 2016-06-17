package ic.symtab;

import ic.ast._;
import java.io;

object printSymTabs {
  
  def startPrintSymTabs(program: ic.ast.Program){
    
    val out = new java.io.PrintWriter("symTabsOutput.txt")

    for (classDec <- program.classes){
      printSymTab(classDec, out)

      for (field <- classDec.fields){
        printSymTab(field, out)
      }

      for (method <- classDec.methods){
        printSymTab(method, out)

        method match {
          case VoidMethod(methodId, methodFormals, block, methodLine) => {
            for (VarDecl <- methodFormals){
              printSymTab(VarDecl, out)

              //VarDecl.expr match {
              //  case Some(e) => {
              //    printSymTab(e)
                  // TODO: do we want to print sub-symTabs for the lower children???
              //  }
              //  case None => {}
              //}
              
            }
            printSymTab(block, out)
          }
          case FruitfulMethod(returnType, methodId, methodFormals, block, methodLine) => {
            for (VarDecl <- methodFormals){
              printSymTab(VarDecl, out)

              /*VarDecl.expr match {
                case Some(e) => {
                  printSymTab(e)
                  // TODO: do we want to print sub-symTabs for the lower children???
                }
                case None => {}
              }*/
            }
            printSymTab(block, out)
          }
        }
        
      }
    }
    out.close()
  }


  def printSymTab(node: ic.ast.ASTNode, out: java.io.PrintWriter){
    //val out = new java.io.PrintWriter("symTabsOutput.txt")
    out.println(node.symtab.toString())
    // println("    Index of "+node.UID+" is: "+node.index)
  }

}
