  # Compiled by icc from test/projectTest/test2.ic
  # At Sun May 15 10:56:44 EDT 2016

.data
  # string literals
    .align 8
    .quad 36
__ic_string_lit_0:
    .ascii"Project test 2: FunctionDeclarations"

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

  # vtable for class PARAMS__int_int__RETURN__int_Template
    .align 8
__PARAMS__int_int__RETURN__int_Template_vtable:
    .quad __method_PARAMS__int_int__RETURN__int_Template.call
  # vtable for class FunctionDeclarations_main_f_Closure
    .align 8
__FunctionDeclarations_main_f_Closure_vtable:
    .quad __method_FunctionDeclarations_main_f_Closure.call
    .quad __method_FunctionDeclarations_main_f_Closure.create
  # vtable for class FunctionDeclarations
    .align 8
__FunctionDeclarations_vtable:
    .quad __method_FunctionDeclarations.main

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

__method_PARAMS__int_int__RETURN__int_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return 0
    movq $0, %rax
    jmp __method_PARAMS__int_int__RETURN__int_Template.call_epilogue
__method_PARAMS__int_int__RETURN__int_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_FunctionDeclarations_main_f_Closure.create:
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
    jmp __method_FunctionDeclarations_main_f_Closure.create_epilogue
__method_FunctionDeclarations_main_f_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_FunctionDeclarations_main_f_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # t0 = x + y
    movq 24(%rbp), %rax
    movq 32(%rbp), %r10
    addq %rax, %r10
    movq %r10, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_FunctionDeclarations_main_f_Closure.call_epilogue
__method_FunctionDeclarations_main_f_Closure.call_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_FunctionDeclarations.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # t1 = new FunctionDeclarations_main_f_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __FunctionDeclarations_main_f_Closure_vtable(%rip), %r10
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
  # call Library.println("Project test 2: FunctionDeclarations")
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_FunctionDeclarations.main_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: FunctionDeclarations
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store FunctionDeclarations's vtable pointer in new object instance.
    leaq __FunctionDeclarations_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for FunctionDeclarations.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call FunctionDeclarations.main
    callq __method_FunctionDeclarations.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
