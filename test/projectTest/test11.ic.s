  # Compiled by icc from test/projectTest/test11.ic
  # At Sun May 15 10:57:36 EDT 2016

.data
  # string literals
    .align 8
    .quad 3
__ic_string_lit_0:
    .ascii"i: "

    .align 8
    .quad 0
__ic_string_lit_1:
    .ascii""

    .align 8
    .quad 29
__ic_string_lit_2:
    .ascii"Project test 11: ReallySimple"

    .align 8
    .quad 2
__ic_string_lit_3:
    .ascii"hi"

    .align 8
    .quad 3
__ic_string_lit_4:
    .ascii"x: "

    .align 8
    .quad 0
__ic_string_lit_5:
    .ascii""

    .align 8
    .quad 3
__ic_string_lit_6:
    .ascii"s: "

    .align 8
    .quad 0
__ic_string_lit_7:
    .ascii""

    .align 8
    .quad 23
__ic_error_string_bounds:
    .ascii"Array bounds violation."

    .align 8
    .quad 23
__ic_error_string_null:
    .ascii"Null pointer violation."

    .align 8
    .quad 21
__ic_error_string_size:
    .ascii"Array size violation."

    .align 8
    .quad 22
__ic_error_string_div:
    .ascii"Divide by 0 violation."

  # vtable for class PARAMS__int__RETURN__void_Template
    .align 8
__PARAMS__int__RETURN__void_Template_vtable:
    .quad __method_PARAMS__int__RETURN__void_Template.call
  # vtable for class ReallySimple_main_f_Closure
    .align 8
__ReallySimple_main_f_Closure_vtable:
    .quad __method_ReallySimple_main_f_Closure.call
    .quad __method_ReallySimple_main_f_Closure.create
  # vtable for class ReallySimple
    .align 8
__ReallySimple_vtable:
    .quad __method_ReallySimple.main
    .quad __method_ReallySimple.otherMethod

.text
    .align 8

  # Error handler for null dereference.
__ic_error_handler_bounds:
    subq $8, %rsp
    leaq __ic_error_string_bounds(%rip), %rdi
    callq __LIB_println
    movq $1, %rdi
    callq __LIB_exit
    addq $8, %rsp
__ic_error_handler_null:
    subq $8, %rsp
    leaq __ic_error_string_null(%rip), %rdi
    callq __LIB_println
    movq $1, %rdi
    callq __LIB_exit
    addq $8, %rsp
__ic_error_handler_size:
    subq $8, %rsp
    leaq __ic_error_string_size(%rip), %rdi
    callq __LIB_println
    movq $1, %rdi
    callq __LIB_exit
    addq $8, %rsp
__ic_error_handler_div:
    subq $8, %rsp
    leaq __ic_error_string_div(%rip), %rdi
    callq __LIB_println
    movq $1, %rdi
    callq __LIB_exit
    addq $8, %rsp

__method_PARAMS__int__RETURN__void_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return
    jmp __method_PARAMS__int__RETURN__void_Template.call_epilogue
__method_PARAMS__int__RETURN__void_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_ReallySimple_main_f_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.args = args
    movq -16(%rbp), %r10
    movq 24(%rbp), %rax
    movq %rax, 0(%r10)
  # t1 = this
    movq 16(%rbp), %rax
    movq %rax, -24(%rbp)
  # return t1
    movq -24(%rbp), %rax
    jmp __method_ReallySimple_main_f_Closure.create_epilogue
__method_ReallySimple_main_f_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_ReallySimple_main_f_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # call Library.print("i: ")
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printi(i)
    movq 24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_1(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_ReallySimple_main_f_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_ReallySimple.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # t1 = new ReallySimple_main_f_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __ReallySimple_main_f_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -32(%rbp)
  # Null check: t1 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(args)
    movq 24(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -24(%rbp)
  # f = t0
    movq -24(%rbp), %rax
    movq %rax, -8(%rbp)
  # call Library.println("Project test 11: ReallySimple")
    leaq __ic_string_lit_2(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # Null check: f != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call f.call(6)
    pushq $6
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.otherMethod(8, "hi")
    subq $8, %rsp
    leaq __ic_string_lit_3(%rip), %rax
    pushq %rax
    pushq $8
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
__method_ReallySimple.main_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: ReallySimple
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store ReallySimple's vtable pointer in new object instance.
    leaq __ReallySimple_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for ReallySimple.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call ReallySimple.main
    callq __method_ReallySimple.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret

__method_ReallySimple.otherMethod:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # call Library.print("x: ")
    leaq __ic_string_lit_4(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printi(x)
    movq 24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_5(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # call Library.print("s: ")
    leaq __ic_string_lit_6(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.print(s)
    movq 32(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_7(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_ReallySimple.otherMethod_epilogue:
    addq $0, %rsp
    popq %rbp
    retq
