  # Compiled by icc from test/projectTest/test7.ic
  # At Sun May 15 10:57:13 EDT 2016

.data
  # string literals
    .align 8
    .quad 0
__ic_string_lit_0:
    .ascii""

    .align 8
    .quad 2
__ic_string_lit_1:
    .ascii"Hi"

    .align 8
    .quad 3
__ic_string_lit_2:
    .ascii"Bye"

    .align 8
    .quad 31
__ic_string_lit_3:
    .ascii"Project test 7: NestedFunctions"

    .align 8
    .quad 0
__ic_string_lit_4:
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

  # vtable for class PARAMS__int_int__RETURN__int_Template
    .align 8
__PARAMS__int_int__RETURN__int_Template_vtable:
    .quad __method_PARAMS__int_int__RETURN__int_Template.call
  # vtable for class PARAMS__boolean__RETURN__int_Template
    .align 8
__PARAMS__boolean__RETURN__int_Template_vtable:
    .quad __method_PARAMS__boolean__RETURN__int_Template.call
  # vtable for class PARAMS__boolean__RETURN__string_Template
    .align 8
__PARAMS__boolean__RETURN__string_Template_vtable:
    .quad __method_PARAMS__boolean__RETURN__string_Template.call
  # vtable for class NestedFunctions_main_f_Closure
    .align 8
__NestedFunctions_main_f_Closure_vtable:
    .quad __method_NestedFunctions_main_f_Closure.call
    .quad __method_NestedFunctions_main_f_Closure.create
  # vtable for class NestedFunctions_main_f_g_Closure
    .align 8
__NestedFunctions_main_f_g_Closure_vtable:
    .quad __method_NestedFunctions_main_f_g_Closure.call
    .quad __method_NestedFunctions_main_f_g_Closure.create
  # vtable for class NestedFunctions_main_f_h_Closure
    .align 8
__NestedFunctions_main_f_h_Closure_vtable:
    .quad __method_NestedFunctions_main_f_h_Closure.call
    .quad __method_NestedFunctions_main_f_h_Closure.create
  # vtable for class NestedFunctions_main_g_Closure
    .align 8
__NestedFunctions_main_g_Closure_vtable:
    .quad __method_NestedFunctions_main_g_Closure.call
    .quad __method_NestedFunctions_main_g_Closure.create
  # vtable for class NestedFunctions_main_anon0_Closure
    .align 8
__NestedFunctions_main_anon0_Closure_vtable:
    .quad __method_NestedFunctions_main_anon0_Closure.call
    .quad __method_NestedFunctions_main_anon0_Closure.create
  # vtable for class NestedFunctions
    .align 8
__NestedFunctions_vtable:
    .quad __method_NestedFunctions.main

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

__method_PARAMS__boolean__RETURN__int_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return 0
    movq $0, %rax
    jmp __method_PARAMS__boolean__RETURN__int_Template.call_epilogue
__method_PARAMS__boolean__RETURN__int_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__boolean__RETURN__string_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return ""
    leaq __ic_string_lit_0(%rip), %rax
    jmp __method_PARAMS__boolean__RETURN__string_Template.call_epilogue
__method_PARAMS__boolean__RETURN__string_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_NestedFunctions_main_f_Closure.create:
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
    jmp __method_NestedFunctions_main_f_Closure.create_epilogue
__method_NestedFunctions_main_f_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_NestedFunctions_main_f_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $96, %rsp
  # fLocal = "Hi"
    leaq __ic_string_lit_1(%rip), %rax
    movq %rax, -8(%rbp)
  # t1 = new NestedFunctions_main_f_g_Closure()
    movq $32, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __NestedFunctions_main_f_g_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -48(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = this.args
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -56(%rbp)
  # Null check: t1 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(t2, x, y)
    movq 32(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -56(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -40(%rbp)
  # g = t0
    movq -40(%rbp), %rax
    movq %rax, -16(%rbp)
  # t4 = new NestedFunctions_main_f_h_Closure()
    movq $32, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __NestedFunctions_main_f_h_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -72(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5 = this.args
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -80(%rbp)
  # Null check: t4 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = call t4.create(t5, x, y)
    movq 32(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -80(%rbp), %rax
    pushq %rax
    movq -72(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -64(%rbp)
  # h = t3
    movq -64(%rbp), %rax
    movq %rax, -24(%rbp)
  # t6 = x + y
    movq 24(%rbp), %rax
    movq 32(%rbp), %r10
    addq %rax, %r10
    movq %r10, -88(%rbp)
  # return t6
    movq -88(%rbp), %rax
    jmp __method_NestedFunctions_main_f_Closure.call_epilogue
__method_NestedFunctions_main_f_Closure.call_epilogue:
    addq $96, %rsp
    popq %rbp
    retq

__method_NestedFunctions_main_f_g_Closure.create:
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
  # t2.y = y
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # return t3
    movq -40(%rbp), %rax
    jmp __method_NestedFunctions_main_f_g_Closure.create_epilogue
__method_NestedFunctions_main_f_g_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_NestedFunctions_main_f_g_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = this.x
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_NestedFunctions_main_f_g_Closure.call_epilogue
__method_NestedFunctions_main_f_g_Closure.call_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_NestedFunctions_main_f_h_Closure.create:
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
  # t2.y = y
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # return t3
    movq -40(%rbp), %rax
    jmp __method_NestedFunctions_main_f_h_Closure.create_epilogue
__method_NestedFunctions_main_f_h_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_NestedFunctions_main_f_h_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = this.y
    movq 16(%rbp), %rax
    movq 16(%rax), %rax
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_NestedFunctions_main_f_h_Closure.call_epilogue
__method_NestedFunctions_main_f_h_Closure.call_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_NestedFunctions_main_g_Closure.create:
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
    jmp __method_NestedFunctions_main_g_Closure.create_epilogue
__method_NestedFunctions_main_g_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_NestedFunctions_main_g_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return "Bye"
    leaq __ic_string_lit_2(%rip), %rax
    jmp __method_NestedFunctions_main_g_Closure.call_epilogue
__method_NestedFunctions_main_g_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_NestedFunctions_main_anon0_Closure.create:
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
    jmp __method_NestedFunctions_main_anon0_Closure.create_epilogue
__method_NestedFunctions_main_anon0_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_NestedFunctions_main_anon0_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # t0 = x - y
    movq 24(%rbp), %rax
    movq 32(%rbp), %r10
    subq %r10, %rax
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_NestedFunctions_main_anon0_Closure.call_epilogue
__method_NestedFunctions_main_anon0_Closure.call_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_NestedFunctions.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $128, %rsp
  # t1 = new NestedFunctions_main_f_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __NestedFunctions_main_f_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -64(%rbp)
  # Null check: t1 != Null
    movq -64(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(args)
    movq 24(%rbp), %rax
    pushq %rax
    movq -64(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -56(%rbp)
  # f = t0
    movq -56(%rbp), %rax
    movq %rax, -8(%rbp)
  # t3 = new NestedFunctions_main_g_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __NestedFunctions_main_g_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -80(%rbp)
  # Null check: t3 != Null
    movq -80(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = call t3.create(args)
    movq 24(%rbp), %rax
    pushq %rax
    movq -80(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -72(%rbp)
  # g = t2
    movq -72(%rbp), %rax
    movq %rax, -16(%rbp)
  # t6 = new NestedFunctions_main_anon0_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __NestedFunctions_main_anon0_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -104(%rbp)
  # Null check: t6 != Null
    movq -104(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5 = call t6.create(args)
    movq 24(%rbp), %rax
    pushq %rax
    movq -104(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -96(%rbp)
  # Null check: t5 != Null
    movq -96(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = call t5.call(4, 2)
    subq $8, %rsp
    pushq $2
    pushq $4
    movq -96(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -88(%rbp)
  # i_Later = t4
    movq -88(%rbp), %rax
    movq %rax, -24(%rbp)
  # Null check: f != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7 = call f.call(5, 8)
    subq $8, %rsp
    pushq $8
    pushq $5
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -112(%rbp)
  # j_Later = t7
    movq -112(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: g != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8 = call g.call(true)
    pushq $1
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -120(%rbp)
  # str_Later = t8
    movq -120(%rbp), %rax
    movq %rax, -40(%rbp)
  # call Library.println("Project test 7: NestedFunctions")
    leaq __ic_string_lit_3(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # call Library.printi(i_Later)
    movq -24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_4(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # call Library.println(str_Later)
    movq -40(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_NestedFunctions.main_epilogue:
    addq $128, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: NestedFunctions
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store NestedFunctions's vtable pointer in new object instance.
    leaq __NestedFunctions_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for NestedFunctions.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call NestedFunctions.main
    callq __method_NestedFunctions.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
