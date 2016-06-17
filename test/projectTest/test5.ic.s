  # Compiled by icc from test/projectTest/test5.ic
  # At Sun May 15 10:57:02 EDT 2016

.data
  # string literals
    .align 8
    .quad 37
__ic_string_lit_0:
    .ascii"Calling function f with argument i = "

    .align 8
    .quad 0
__ic_string_lit_1:
    .ascii""

    .align 8
    .quad 29
__ic_string_lit_2:
    .ascii"Project test 5: FunctionCalls"

    .align 8
    .quad 0
__ic_string_lit_3:
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

  # vtable for class PARAMS__int__RETURN__int_Template
    .align 8
__PARAMS__int__RETURN__int_Template_vtable:
    .quad __method_PARAMS__int__RETURN__int_Template.call
  # vtable for class PARAMS__string__RETURN__void_Template
    .align 8
__PARAMS__string__RETURN__void_Template_vtable:
    .quad __method_PARAMS__string__RETURN__void_Template.call
  # vtable for class FunctionCalls_main_g_Closure
    .align 8
__FunctionCalls_main_g_Closure_vtable:
    .quad __method_FunctionCalls_main_g_Closure.call
    .quad __method_FunctionCalls_main_g_Closure.create
  # vtable for class FunctionCalls_main_anon0_Closure
    .align 8
__FunctionCalls_main_anon0_Closure_vtable:
    .quad __method_FunctionCalls_main_anon0_Closure.call
    .quad __method_FunctionCalls_main_anon0_Closure.create
  # vtable for class FunctionCalls
    .align 8
__FunctionCalls_vtable:
    .quad __method_FunctionCalls.main

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

__method_PARAMS__int__RETURN__int_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return 0
    movq $0, %rax
    jmp __method_PARAMS__int__RETURN__int_Template.call_epilogue
__method_PARAMS__int__RETURN__int_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__string__RETURN__void_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return
    jmp __method_PARAMS__string__RETURN__void_Template.call_epilogue
__method_PARAMS__string__RETURN__void_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_FunctionCalls_main_g_Closure.create:
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
    jmp __method_FunctionCalls_main_g_Closure.create_epilogue
__method_FunctionCalls_main_g_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_FunctionCalls_main_g_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
__method_FunctionCalls_main_g_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_FunctionCalls_main_anon0_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
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
  # Null check: t1 != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1.x = x
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: t2 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.f = f
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # Null check: t3 != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3.g = g
    movq -40(%rbp), %r10
    movq 48(%rbp), %rax
    movq %rax, 24(%r10)
  # t4 = this
    movq 16(%rbp), %rax
    movq %rax, -48(%rbp)
  # return t4
    movq -48(%rbp), %rax
    jmp __method_FunctionCalls_main_anon0_Closure.create_epilogue
__method_FunctionCalls_main_anon0_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_FunctionCalls_main_anon0_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # call Library.print("Calling function f with argument i = ")
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
  # t0 = i + 1
    movq 24(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_FunctionCalls_main_anon0_Closure.call_epilogue
__method_FunctionCalls_main_anon0_Closure.call_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_FunctionCalls.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $80, %rsp
  # t1 = new FunctionCalls_main_g_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __FunctionCalls_main_g_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -48(%rbp)
  # Null check: t1 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(args)
    movq 24(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -40(%rbp)
  # g = t0
    movq -40(%rbp), %rax
    movq %rax, -24(%rbp)
  # t3 = new FunctionCalls_main_anon0_Closure()
    movq $40, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __FunctionCalls_main_anon0_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -64(%rbp)
  # Null check: t3 != Null
    movq -64(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = call t3.create(args, x, f, g)
    subq $8, %rsp
    movq -24(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -64(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $48, %rsp
    movq %rax, -56(%rbp)
  # f = t2
    movq -56(%rbp), %rax
    movq %rax, -16(%rbp)
  # call Library.println("Project test 5: FunctionCalls")
    leaq __ic_string_lit_2(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # Null check: f != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = call f.call(1)
    pushq $1
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -72(%rbp)
  # x = t4
    movq -72(%rbp), %rax
    movq %rax, -8(%rbp)
  # call Library.printi(x)
    movq -8(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_3(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_FunctionCalls.main_epilogue:
    addq $80, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: FunctionCalls
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store FunctionCalls's vtable pointer in new object instance.
    leaq __FunctionCalls_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for FunctionCalls.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call FunctionCalls.main
    callq __method_FunctionCalls.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
