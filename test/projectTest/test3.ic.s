  # Compiled by icc from test/projectTest/test3.ic
  # At Sun May 15 10:56:49 EDT 2016

.data
  # string literals
    .align 8
    .quad 0
__ic_string_lit_0:
    .ascii""

    .align 8
    .quad 5
__ic_string_lit_1:
    .ascii"Hello"

    .align 8
    .quad 7
__ic_string_lit_2:
    .ascii"Goodbye"

    .align 8
    .quad 29
__ic_string_lit_3:
    .ascii"Project test 3: AnonFunctions"

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

  # vtable for class PARAMS__int_int__RETURN__string_Template
    .align 8
__PARAMS__int_int__RETURN__string_Template_vtable:
    .quad __method_PARAMS__int_int__RETURN__string_Template.call
  # vtable for class AnonFunctions_main_anon0_Closure
    .align 8
__AnonFunctions_main_anon0_Closure_vtable:
    .quad __method_AnonFunctions_main_anon0_Closure.call
    .quad __method_AnonFunctions_main_anon0_Closure.create
  # vtable for class AnonFunctions_main_anon1_Closure
    .align 8
__AnonFunctions_main_anon1_Closure_vtable:
    .quad __method_AnonFunctions_main_anon1_Closure.call
    .quad __method_AnonFunctions_main_anon1_Closure.create
  # vtable for class AnonFunctions
    .align 8
__AnonFunctions_vtable:
    .quad __method_AnonFunctions.main

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

__method_PARAMS__int_int__RETURN__string_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return ""
    leaq __ic_string_lit_0(%rip), %rax
    jmp __method_PARAMS__int_int__RETURN__string_Template.call_epilogue
__method_PARAMS__int_int__RETURN__string_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_AnonFunctions_main_anon0_Closure.create:
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
  # t1.f = f
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
  # t2.g = g
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # return t3
    movq -40(%rbp), %rax
    jmp __method_AnonFunctions_main_anon0_Closure.create_epilogue
__method_AnonFunctions_main_anon0_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_AnonFunctions_main_anon0_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return "Hello"
    leaq __ic_string_lit_1(%rip), %rax
    jmp __method_AnonFunctions_main_anon0_Closure.call_epilogue
__method_AnonFunctions_main_anon0_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_AnonFunctions_main_anon1_Closure.create:
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
  # t1.f = f
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
  # t2.g = g
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # return t3
    movq -40(%rbp), %rax
    jmp __method_AnonFunctions_main_anon1_Closure.create_epilogue
__method_AnonFunctions_main_anon1_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_AnonFunctions_main_anon1_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return "Goodbye"
    leaq __ic_string_lit_2(%rip), %rax
    jmp __method_AnonFunctions_main_anon1_Closure.call_epilogue
__method_AnonFunctions_main_anon1_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_AnonFunctions.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $64, %rsp
  # t1 = new AnonFunctions_main_anon0_Closure()
    movq $32, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __AnonFunctions_main_anon0_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -40(%rbp)
  # Null check: t1 != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(args, f, g)
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -32(%rbp)
  # f = t0
    movq -32(%rbp), %rax
    movq %rax, -8(%rbp)
  # t3 = new AnonFunctions_main_anon1_Closure()
    movq $32, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __AnonFunctions_main_anon1_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -56(%rbp)
  # Null check: t3 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = call t3.create(args, f, g)
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -56(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -48(%rbp)
  # g = t2
    movq -48(%rbp), %rax
    movq %rax, -16(%rbp)
  # call Library.println("Project test 3: AnonFunctions")
    leaq __ic_string_lit_3(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_AnonFunctions.main_epilogue:
    addq $64, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: AnonFunctions
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store AnonFunctions's vtable pointer in new object instance.
    leaq __AnonFunctions_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for AnonFunctions.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call AnonFunctions.main
    callq __method_AnonFunctions.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
