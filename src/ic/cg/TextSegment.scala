package ic.cg

import ic.Util
import ic.ast._
import ic.IndentingPrintStream
import ic.tac._

/**
 * This file contains code to generate the text (code) segment of the
 * assembly file by translating each method's TAC to x86.
 */
object TextSegment {

  /** Offset of an array's length field relative to its base address. */
  val LENGTH_OFFSET = -Asm.WORD_SIZE

  /**
   * Offset of an object's vtable pointer field relative to its base
   * address.
   */
  val VTABLE_OFFSET = -Asm.WORD_SIZE

  /**
   * Size of the x86-64 red zone available below %rsp between procedure
   * calls.
   */
  val REDZONE = 128

  /**
   * Generate all parts of the text segment for a Program p using the
   * assembly generator asm.
   */
  def apply(p: Program, asm: Asm): Unit = {
    // Begin the text section.
    asm.section(Text)
    // Ensure word alignment.
    asm.align(Asm.WORD_SIZE)
    // Emit code for runtime error handlers.
    emitErrors(asm)
    // Generate code for each method of each class.
    for (c <- p.classes) {
      for (m <- c.methods) {
        emitMethod(asm, c, m)
        // If this is the main method, also generate the wrapper __ic_main.
        if (m.id == "main") {
          emitMain(c, asm)
        }
      }
    }
  }

  /**
   * Generate all code for method m of class c.
   */
  def emitMethod(asm: Asm, c: ClassDecl, m: MethodDecl): Unit = {
    asm.newline
    // Create labels for the start and epilog (stack teardown and
    // return) of the method.
    Util.assertTrue(!m.qname.contains("=>"), "bad qname");
    val label = CodeGen.methodLabel(m.qname)
    val epilogLabel = label + "_epilogue"
    // Mark the start of the method.
    asm.label(label)
    // Allocate stack frame.
    asm.inst("pushq", Asm.STACK_ANCHOR)
    asm.inst("movq", "%rsp", Asm.STACK_ANCHOR)
    asm.inst("subq", m.getTacList.frameSize * 8, "%rsp")

    // Generate x86 code for each TAC instruction in order.
    for (inst <- m.tacList.tacInstructions) {
      emit(m, epilogLabel, inst, asm)
    }
    // Mark the end of the method body and emit code to tear down the
    // call stack and return.
    asm.label(epilogLabel)
    asm.inst("addq", m.getTacList.frameSize * 8, "%rsp")
    asm.inst("popq", Asm.STACK_ANCHOR)
    asm.inst("retq")
  }

  def off(v: TacVar): Int = {
    v match {
      case TempVar(_) =>  -v.offset * Asm.WORD_SIZE
      case TacLocal(decl) =>  if (decl.isParam) {
        (v.offset + 2) * Asm.WORD_SIZE // 2 depends on some detail of calc offsets.  expected 3 -bpw
      } else {
        -v.offset * Asm.WORD_SIZE
      }
      case TacThis(_) => 2 * Asm.WORD_SIZE
    }
  }
  def off(fm: Index): Int = {
    fm.index * Asm.WORD_SIZE
  }
  /**
   * Translate a TacLiteral to be used as an x86 instruction operand.
   */
  def lit(literal: TacLiteral, asm: Asm): String = {
    literal match {
      case str @ TacString(_) =>
        Util.assertTrue(false, "String literals not supported here.")
        return null;
      case TacInt(i)      => "$" + i.toString
      case TacBool(true)  => "$1"
      case TacBool(false) => "$0"
      case TacNull()      => "$0"
    }
  }

  /**
   * Given a TacOperand either:
   * - return its literal x86 representation; or
   * - emit an instruction to load its value into the given register,
   *   reg, and return that register description.
   */
  def getOp(x: TacOperand, reg: String, asm: Asm): String = {
    x match {
      case v: TacVar =>
        regOp(x, reg, asm)
        reg
      case s: TacString =>
        regOp(x, reg, asm)
        reg
      case l: TacLiteral =>
        // If the operand is any other literal, return the x86
        // representation of that literal.
        lit(l, asm)
    }
  }

  /**
   * Emit an instruction to load the given TacOperand into the given
   * register.
   */
  def regOp(x: TacOperand, reg: String, asm: Asm): Unit = {
    x match {
      case v: TacVar =>
        // If the operand is a variable, load from its stack offset.
        asm.loadStack(off(v), reg)
      case s: TacString =>
        // If the operand is a string literal, emit an instruction to
        // load its address into the given register.
        asm.inst("leaq", asm.stringLabel(s.id) + "(%rip)", reg)
      case l: TacLiteral =>
        // If the operand is any other literal, move the x86
        // representation of that literal into the given register.
        asm.inst("movq", lit(l, asm), reg)
    }
  }

  /**
   * Emit the code for TAC instruction i in the context of method m,
   * whose method epilogue code will appear at label endLabel.
   */
  def emit(m: MethodDecl, endLabel: String, i: TacInstr, asm: Asm): Unit = {
    // x86-64 register-based calling conventions.
    val arg0 = "%rdi"
    val arg1 = "%rsi"
    val arg2 = "%rdx"
    val arg3 = "%rcx"
    val arg4 = "%r8"
    val arg5 = "%r9"
    val methodArgRegs = Array(arg0, arg1, arg2, arg3, arg4, arg5)
    // Some variables to refer to a few caller-svae registers that are
    // good temporary registers.
    val r1 = "%rax"
    val ret = r1
    val r2 = "%r10"
    val r3 = "%r11"
    val rsp = "%rsp"
    // Registers used for larger operands (e.g., for division)
    val upper = arg2
    val lower = r1
    val divResult = lower
    val modResult = upper

    // Comment the x86 with the TAC instruction from which it is generated.
    asm.comment(i.toString())

    // Emit the proper x86 template for the given TAC instruction.
    i match {
      // Fill in many more cases ...

      case TacBinInstr(dest, left, op @ (Div(_) | Mod(_)), right) =>
        // Divide and Mod operations.
        // Depending on which, find the result in different register.
        val resultReg = op match {
          case Div(_) => divResult
          case Mod(_) => modResult
        }
        // Use helper method to load the left operand into the
        // register used for the lower bits of the dividend.
        regOp(left, lower, asm)
        // Extend this dividend into the register used for the upper
        // dividend bits.
        asm.inst("cqto")
        // Use helper method to either:
        // - get the x86 representation of the literal, or
        // - load the non-literal into register r2
        // and return either the literal or the register, respectively.
        regOp(right, r2, asm)
        // Divide by the divisor.
        asm.inst("idivq", r2)
        // Store the result in the stack at the relevant offset for
        // the destination variable.
        asm.storeStack(resultReg, off(dest))

      case TacBinInstr(dest, left, Plus(_), right) => {
        regOp(left, r1, asm);
        regOp(right, r2, asm);
        asm.inst("addq", r1, r2); //r2 = r2 + r1
        asm.storeStack(r2, off(dest));
      }

      case TacBinInstr(dest, left, Minus(_), right) => {
        regOp(left, r1, asm);
        regOp(right, r2, asm);
        asm.inst("subq", r2, r1); //r1 = r1 - r2
        asm.storeStack(r1, off(dest));
      }

      case TacBinInstr(dest, left, Mult(_), right) => {
        regOp(left, r1, asm);
        regOp(right, r2, asm);
        asm.inst("imulq", r1, r2); //r2 = r2 * r1
        asm.storeStack(r2, off(dest));
      }
/*
      case TacBinInstr(dest, left, And(_), right) => {
        regOp(left, r1, asm);
        regOp(right, r2, asm);
        asm.inst("andq", r1, r2); //r2 = r2 && r1
        asm.storeStack(r2, off(dest));
      }

      case TacBinInstr(dest, left, Or(_), right) => {
        regOp(left, r1, asm);
        regOp(right, r2, asm);
        asm.inst("orq", r1, r2); //r2 = r2 || r1
        asm.storeStack(r2, off(dest));
      }
 */
      case TacBinInstr(dest, left, op, right) => {
        regOp(left, r1, asm);
        regOp(right, r2, asm);
        asm.inst("cmpq", r2, r1); //compare r1 OP r2
        asm.inst((op match {
          case Less(_) => "setl"
          case LessEq(_) => "setle"
          case Greater(_) => "setg"
          case GreaterEq(_) => "setge"
          case Equal(_) => "sete"
          case NotEqual(_) => "setne"
        }), "%al");
        asm.inst("movzbq", "%al", r1);
        asm.storeStack(r1, off(dest));
      }

      case TacUnInstr(dest, Not(_), src) =>
        // Boolean not.
        regOp(src, r1, asm)
        // Test the operand and set rax to 1 if operand is zero or 0
        // if operand is nonzero (1).
        asm.inst("testq", r1, r1)
        asm.inst("sete", "%al")
        asm.inst("movsbq", "%al", r1)
        asm.storeStack(r1, off(dest))

      case TacUnInstr(dest, Negative(_), src) => {
        regOp(src, r1, asm);
        asm.inst("negq", r1);
        asm.storeStack(r1, off(dest));
      }

      case TacCopy(dest, src) => {
        regOp(src, r1, asm);
        asm.storeStack(r1, off(dest));
      }

      case TacArrayLoad(dest, array, index) => {
        regOp(array, r1, asm);
        regOp(index, r2, asm);
        asm.loadIndex(r1, r2, Asm.WORD_SIZE, r3); //store array[index] into r3
        asm.storeStack(r3, off(dest));
      }

      case TacArrayStore(array, index, src) => {
        regOp(array, r1, asm);
        regOp(index, r2, asm);
        regOp(src, r3, asm);
        asm.storeIndex(r3, r1, r2, Asm.WORD_SIZE);
      }

      case TacArrayCreation(dest, size) => {
        regOp(size, arg0, asm)

        // Call.
        asm.inst("callq", CodeGen.libLabel("allocateArray"))
        
        //sore result pointer back to the destination
        asm.storeStack(ret, off(dest))
      }

      case TacLengthLoad(dest, array) =>
        regOp(array, r1, asm)
        asm.load(r1, LENGTH_OFFSET, r1);
        asm.storeStack(r1, off(dest));

      case TacFieldLoad(dest, fieldObj, fieldDecl) => {
        // Load the field reference into the r1 register:
        regOp(fieldObj, r1, asm);
        
        //With that reference, load the field contents into the register: 
        asm.load(r1, off(fieldDecl), r1);
        
        //Finally, field contents on the  stack at the offset from the stack's base pointer:
        asm.storeStack(r1, off(dest))
      }

      case TacFieldStore(fieldObj, fieldDecl, src) => {
        // Load the target object reference
        regOp(fieldObj, r2, asm);
        
        // Load the value to write
        regOp(src, r1, asm);
        
        // Store the value of r2 into Memory[ object + field offset ]
        asm.store(r1, r2, off(fieldDecl))
      }

      case TacLabel(name) => {
        // print label and a ":"
        asm.label(name);
      }
      case TacJump(target) =>
        asm.inst("jmp", target.name)

      case TacCJump(cond, target) => // Jump if true
        regOp(cond, r1, asm)
        asm.inst("testq", r1, r1)
        asm.inst("jnz", target.name)

      case TacLibCall(method, args) =>
        // Library Call
        // Unlike normal IC methods, the x86 code for Library methods
        // follows the normal x86-64 calling convention, so arguments
        // must be passed in registers instead of on the stack.
        Util.assertTrue(args.size <= 6,
          "Too many arguments for current implementation.")
        // Load arguments into registers.
        for ((a, i) <- args.zipWithIndex) {
          val reg = methodArgRegs(i)
          asm.inst("movq", getOp(a, reg, asm), reg)
        }
        // Call.
        asm.inst("subq", Asm.WORD_SIZE, rsp)
        asm.inst("callq", CodeGen.libLabel(method))
        asm.inst("addq", Asm.WORD_SIZE, rsp)


      case TacLibCallResult(dest, method, args) =>
        // Library Call
        // Unlike normal IC methods, the x86 code for Library methods
        // follows the normal x86-64 calling convention, so arguments
        // must be passed in registers instead of on the stack.
        Util.assertTrue(args.size <= 6,
          "Too many arguments for current implementation.")
        // Load arguments into registers.
        for ((a, i) <- args.zipWithIndex) {
          val reg = methodArgRegs(i)
          asm.inst("movq", getOp(a, reg, asm), reg)
        }
        // Call.
        asm.inst("subq", Asm.WORD_SIZE, rsp)
        asm.inst("callq", CodeGen.libLabel(method))
        asm.inst("addq", Asm.WORD_SIZE, rsp)
        asm.storeStack(ret, off(dest))


      case TacVirtualCall(receiver, method, args) =>
        if ((args.size % 2) == 0) {
          asm.inst("subq", "$" + Asm.WORD_SIZE, rsp) // keep aligned
        }
        for(a <- args.reverse) {
          asm.inst("pushq", getOp(a, r1, asm))
        }
        regOp(receiver, r1, asm)
	    asm.inst("pushq", r1)
        asm.load(r1, VTABLE_OFFSET, r1)
        asm.inst("callq", "*" + off(method) + "(" + r1 + ")")
        asm.inst("addq", "$" + ((args.size + 1 + 1) & ~1) * Asm.WORD_SIZE, rsp) // keep aligned
      case TacVirtualCallResult(dest, receiver, method, args) =>
        if ((args.size % 2) == 0) {
          asm.inst("subq", "$8", rsp)
        }
        for(a <- args.reverse) {
          asm.inst("pushq", getOp(a, r1, asm))
        }
        regOp(receiver, r1, asm)
	    asm.inst("pushq", r1)
        asm.load(r1, VTABLE_OFFSET, r1)
        asm.inst("callq", "*" + off(method) + "(" + r1 + ")")
        asm.inst("addq", "$" + ((args.size + 1 + 1) & ~1) * Asm.WORD_SIZE, rsp) // keep aligned
        asm.storeStack(ret, off(dest))
    

      case TacNewObject(dest, classDecl) => {
        // one extra for the vTable pointer
        val objectSize = Asm.WORD_SIZE * (classDecl.payloadSize + 1)
        
        // Call lib call to allocate the object. rax (r1) will hold
        // pointer to start of object after execution:
        asm.inst("movq", "$" + objectSize, arg0)
        asm.inst("callq", CodeGen.libLabel( "allocateObject" ))
        asm.inst("addq", -VTABLE_OFFSET, ret);
        asm.inst("leaq", CodeGen.vtableLabel(classDecl) + "(%rip)", r2)
        asm.store(r2, ret, VTABLE_OFFSET)
        asm.storeStack(ret, off(dest));
      }


      case TacReturnValue(src) =>
        // A return instruction must load its operand (if any) into
        // the return value register, then jump to the eiplogue code.
        regOp(src, ret, asm)
        asm.inst("jmp", endLabel)

      case TacReturn() => {
        asm.inst("jmp", endLabel);
      }

      case TacNullCheck(src) => {
        regOp(src, r1, asm);
        asm.inst("cmpq", 0, r1);
        asm.inst("je", NULL_ERROR);
      }

      case TacBoundsCheck(index, array) =>
        regOp(index, r2, asm)
        asm.inst("cmpq", 0, r2)
        asm.inst("jl", BOUNDS_ERROR)
        regOp(array, r1, asm)
        asm.load(r1, LENGTH_OFFSET, r1)
        asm.inst("cmpq", r2, r1)
        asm.inst("jle", BOUNDS_ERROR)

      case TacSizeCheck(size) =>
        // An array size check checks for a valid non-negative array
        // size before array construction.
        regOp(size, r1, asm)
        asm.inst("cmpq", 0, r1)
        asm.inst("jl", SIZE_ERROR)

      case TacZeroCheck(divisor) =>
        // A divisor check checks for a valid non-zero divisor before
        // divide and mod operations.
        regOp(divisor, r1, asm)
        asm.inst("testq", r1, r1)
        asm.inst("je", DIV_ERROR)

      case TacComment(comment) =>
        asm.comment(comment)

    }
  }

  /**
   * Emit a wrapper procedure, __ic_main, that will construct an
   * instance of the given main class and call its entry point main
   * method.
   */
  def emitMain(mainClass: ClassDecl, asm: Asm): Unit = {
    asm.newline()
    asm.comment("Entry point, set up for main method.")
    // Make this label globally visible.
    asm.global("__ic_main")
    asm.label("__ic_main")

    //asm.inst("subq", Asm.WORD_SIZE, "%rsp")
    asm.comment("Push args array reference to stack.")
    asm.inst("pushq", "%rdi")

    asm.comment("Allocate instance of main class: " + mainClass.classId)
    asm.inst("movq", Asm.WORD_SIZE + mainClass.payloadSize * Asm.WORD_SIZE, "%rdi")
    asm.inst("callq", CodeGen.libLabel("allocateObject"))
    asm.inst("addq", -VTABLE_OFFSET, "%rax")

    asm.comment("Store " + mainClass.classId + "'s vtable pointer in new object instance.")
    asm.inst("leaq", CodeGen.vtableLabel(mainClass) + "(%rip)", "%r10")
    asm.store("%r10", "%rax", VTABLE_OFFSET)

    asm.comment("Set up args for " + mainClass.classId + ".main")
    asm.comment("Original args array, pushed earlier, is now on top of stack.")
    asm.comment("Push object to become this.")
    asm.inst("pushq", "%rax")

    asm.comment("Call " + mainClass.classId + ".main")
    asm.inst("callq", CodeGen.methodLabel(mainClass.classId + ".main"))

    asm.comment("Cleanup: pop main object and args array")
    asm.inst("addq", "$" + (2 * Asm.WORD_SIZE), "%rsp")
    asm.inst("ret")
  }

  /*
    * Labels of code for error handlers.
    */
  val BOUNDS_ERROR = "__ic_error_handler_bounds"
  val NULL_ERROR = "__ic_error_handler_null"
  val SIZE_ERROR = "__ic_error_handler_size"
  val DIV_ERROR = "__ic_error_handler_div"

  /**
   * Emit code for all error handlers.
   */
  def emitErrors(asm: Asm): Unit = {
    asm.newline()
    asm.comment("Error handler for null dereference.")
    for (
      (handlerLabel, messageLabel) <- List(
        (BOUNDS_ERROR, DataSegment.BOUNDS_ERROR_LABEL),
        (NULL_ERROR, DataSegment.NULL_ERROR_LABEL),
        (SIZE_ERROR, DataSegment.SIZE_ERROR_LABEL),
        (DIV_ERROR, DataSegment.DIV_ERROR_LABEL))
    ) {
      // Label the handler code.
      asm.label(handlerLabel)
      asm.inst("subq", Asm.WORD_SIZE, "%rsp")
      // Load the string literal for the error message as an argument.
      asm.inst("leaq", messageLabel + "(%rip)", "%rdi")
      // Print the error message.
      asm.inst("callq", "__LIB_println")
      // Give an error exit code.
      asm.inst("movq", 1, "%rdi")
      // Exit the program.
      asm.inst("callq", "__LIB_exit")
      asm.inst("addq", Asm.WORD_SIZE, "%rsp")
    }
  }
}
