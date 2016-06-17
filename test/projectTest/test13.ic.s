  # Compiled by icc from test/projectTest/test13.ic
  # At Sun May 15 10:57:49 EDT 2016

.data
  # string literals
    .align 8
    .quad 3
__ic_string_lit_0:
    .ascii"b: "

    .align 8
    .quad 0
__ic_string_lit_1:
    .ascii""

    .align 8
    .quad 3
__ic_string_lit_2:
    .ascii"x: "

    .align 8
    .quad 0
__ic_string_lit_3:
    .ascii""

    .align 8
    .quad 3
__ic_string_lit_4:
    .ascii"s: "

    .align 8
    .quad 0
__ic_string_lit_5:
    .ascii""

    .align 8
    .quad 10
__ic_string_lit_6:
    .ascii"conds[0]: "

    .align 8
    .quad 0
__ic_string_lit_7:
    .ascii""

    .align 8
    .quad 11
__ic_string_lit_8:
    .ascii"pConds[0]: "

    .align 8
    .quad 0
__ic_string_lit_9:
    .ascii""

    .align 8
    .quad 10
__ic_string_lit_10:
    .ascii"condsLen: "

    .align 8
    .quad 0
__ic_string_lit_11:
    .ascii""

    .align 8
    .quad 5
__ic_string_lit_12:
    .ascii"len: "

    .align 8
    .quad 0
__ic_string_lit_13:
    .ascii""

    .align 8
    .quad 35
__ic_string_lit_14:
    .ascii"Project test 13: TestFunctionParams"

    .align 8
    .quad 2
__ic_string_lit_15:
    .ascii"hi"

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

  # vtable for class PARAMS__boolean__RETURN__void_Template
    .align 8
__PARAMS__boolean__RETURN__void_Template_vtable:
    .quad __method_PARAMS__boolean__RETURN__void_Template.call
  # vtable for class PARAMS__int__RETURN__void_Template
    .align 8
__PARAMS__int__RETURN__void_Template_vtable:
    .quad __method_PARAMS__int__RETURN__void_Template.call
  # vtable for class PARAMS__string__RETURN__void_Template
    .align 8
__PARAMS__string__RETURN__void_Template_vtable:
    .quad __method_PARAMS__string__RETURN__void_Template.call
  # vtable for class PARAMS__boolean_array__RETURN__void_Template
    .align 8
__PARAMS__boolean_array__RETURN__void_Template_vtable:
    .quad __method_PARAMS__boolean_array__RETURN__void_Template.call
  # vtable for class PARAMS__int_array__RETURN__void_Template
    .align 8
__PARAMS__int_array__RETURN__void_Template_vtable:
    .quad __method_PARAMS__int_array__RETURN__void_Template.call
  # vtable for class TestFunctionParams_main_f_Closure
    .align 8
__TestFunctionParams_main_f_Closure_vtable:
    .quad __method_TestFunctionParams_main_f_Closure.call
    .quad __method_TestFunctionParams_main_f_Closure.create
  # vtable for class TestFunctionParams_main_g_Closure
    .align 8
__TestFunctionParams_main_g_Closure_vtable:
    .quad __method_TestFunctionParams_main_g_Closure.call
    .quad __method_TestFunctionParams_main_g_Closure.create
  # vtable for class TestFunctionParams_main_h_Closure
    .align 8
__TestFunctionParams_main_h_Closure_vtable:
    .quad __method_TestFunctionParams_main_h_Closure.call
    .quad __method_TestFunctionParams_main_h_Closure.create
  # vtable for class TestFunctionParams_main_p_Closure
    .align 8
__TestFunctionParams_main_p_Closure_vtable:
    .quad __method_TestFunctionParams_main_p_Closure.call
    .quad __method_TestFunctionParams_main_p_Closure.create
  # vtable for class TestFunctionParams_main_q_Closure
    .align 8
__TestFunctionParams_main_q_Closure_vtable:
    .quad __method_TestFunctionParams_main_q_Closure.call
    .quad __method_TestFunctionParams_main_q_Closure.create
  # vtable for class TestFunctionParams
    .align 8
__TestFunctionParams_vtable:
    .quad __method_TestFunctionParams.main

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

__method_PARAMS__boolean__RETURN__void_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return
    jmp __method_PARAMS__boolean__RETURN__void_Template.call_epilogue
__method_PARAMS__boolean__RETURN__void_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

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

__method_PARAMS__boolean_array__RETURN__void_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return
    jmp __method_PARAMS__boolean_array__RETURN__void_Template.call_epilogue
__method_PARAMS__boolean_array__RETURN__void_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__int_array__RETURN__void_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return
    jmp __method_PARAMS__int_array__RETURN__void_Template.call_epilogue
__method_PARAMS__int_array__RETURN__void_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_TestFunctionParams_main_f_Closure.create:
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
    jmp __method_TestFunctionParams_main_f_Closure.create_epilogue
__method_TestFunctionParams_main_f_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_TestFunctionParams_main_f_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # t0 = !b
    movq 24(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -24(%rbp)
  # fCond = t0
    movq -24(%rbp), %rax
    movq %rax, -8(%rbp)
  # call Library.print("b: ")
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printb(b)
    movq 24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printb
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_1(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_TestFunctionParams_main_f_Closure.call_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_TestFunctionParams_main_g_Closure.create:
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
    jmp __method_TestFunctionParams_main_g_Closure.create_epilogue
__method_TestFunctionParams_main_g_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_TestFunctionParams_main_g_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # t0 = x + 1
    movq 24(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -24(%rbp)
  # gInt = t0
    movq -24(%rbp), %rax
    movq %rax, -8(%rbp)
  # call Library.print("x: ")
    leaq __ic_string_lit_2(%rip), %rdi
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
    leaq __ic_string_lit_3(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_TestFunctionParams_main_g_Closure.call_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_TestFunctionParams_main_h_Closure.create:
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
    jmp __method_TestFunctionParams_main_h_Closure.create_epilogue
__method_TestFunctionParams_main_h_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_TestFunctionParams_main_h_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # call Library.print("s: ")
    leaq __ic_string_lit_4(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_5(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_TestFunctionParams_main_h_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_TestFunctionParams_main_p_Closure.create:
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
    jmp __method_TestFunctionParams_main_p_Closure.create_epilogue
__method_TestFunctionParams_main_p_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_TestFunctionParams_main_p_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # pConds = conds
    movq 24(%rbp), %rax
    movq %rax, -8(%rbp)
  # Null check: conds != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0= conds.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -32(%rbp)
  # condsLen = t0
    movq -32(%rbp), %rax
    movq %rax, -16(%rbp)
  # call Library.print("conds[0]: ")
    leaq __ic_string_lit_6(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: conds != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < conds.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t1 = conds[0]
    movq 24(%rbp), %rax
    movq $0, %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -40(%rbp)
  # call Library.printb(t1)
    movq -40(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printb
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_7(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # call Library.print("pConds[0]: ")
    leaq __ic_string_lit_8(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: pConds != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < pConds.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t2 = pConds[0]
    movq -8(%rbp), %rax
    movq $0, %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -48(%rbp)
  # call Library.printb(t2)
    movq -48(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printb
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_9(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # call Library.print("condsLen: ")
    leaq __ic_string_lit_10(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printi(condsLen)
    movq -16(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_11(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_TestFunctionParams_main_p_Closure.call_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_TestFunctionParams_main_q_Closure.create:
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
    jmp __method_TestFunctionParams_main_q_Closure.create_epilogue
__method_TestFunctionParams_main_q_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_TestFunctionParams_main_q_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -24(%rbp)
  # len = t0
    movq -24(%rbp), %rax
    movq %rax, -8(%rbp)
  # call Library.print("len: ")
    leaq __ic_string_lit_12(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printi(len)
    movq -8(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_13(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_TestFunctionParams_main_q_Closure.call_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_TestFunctionParams.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $160, %rsp
  # t1 = new TestFunctionParams_main_f_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __TestFunctionParams_main_f_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -80(%rbp)
  # Null check: t1 != Null
    movq -80(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(args)
    movq 24(%rbp), %rax
    pushq %rax
    movq -80(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -72(%rbp)
  # f = t0
    movq -72(%rbp), %rax
    movq %rax, -8(%rbp)
  # t3 = new TestFunctionParams_main_g_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __TestFunctionParams_main_g_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -96(%rbp)
  # Null check: t3 != Null
    movq -96(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = call t3.create(args)
    movq 24(%rbp), %rax
    pushq %rax
    movq -96(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -88(%rbp)
  # g = t2
    movq -88(%rbp), %rax
    movq %rax, -16(%rbp)
  # t5 = new TestFunctionParams_main_h_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __TestFunctionParams_main_h_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -112(%rbp)
  # Null check: t5 != Null
    movq -112(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = call t5.create(args)
    movq 24(%rbp), %rax
    pushq %rax
    movq -112(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -104(%rbp)
  # h = t4
    movq -104(%rbp), %rax
    movq %rax, -24(%rbp)
  # t7 = new TestFunctionParams_main_p_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __TestFunctionParams_main_p_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -128(%rbp)
  # Null check: t7 != Null
    movq -128(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6 = call t7.create(args)
    movq 24(%rbp), %rax
    pushq %rax
    movq -128(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -120(%rbp)
  # p = t6
    movq -120(%rbp), %rax
    movq %rax, -32(%rbp)
  # t9 = new TestFunctionParams_main_q_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __TestFunctionParams_main_q_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -144(%rbp)
  # Null check: t9 != Null
    movq -144(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8 = call t9.create(args)
    movq 24(%rbp), %rax
    pushq %rax
    movq -144(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -136(%rbp)
  # q = t8
    movq -136(%rbp), %rax
    movq %rax, -40(%rbp)
  # Size check: 2 >= 0			
    movq $2, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t10 = new [2]
    movq $2, %rdi
    callq __LIB_allocateArray
    movq %rax, -152(%rbp)
  # bs = t10
    movq -152(%rbp), %rax
    movq %rax, -48(%rbp)
  # Size check: 1 >= 0			
    movq $1, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t11 = new [1]
    movq $1, %rdi
    callq __LIB_allocateArray
    movq %rax, -160(%rbp)
  # ints = t11
    movq -160(%rbp), %rax
    movq %rax, -56(%rbp)
  # call Library.println("Project test 13: TestFunctionParams")
    leaq __ic_string_lit_14(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # Null check: f != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call f.call(true)
    pushq $1
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
  # Null check: g != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call g.call(4)
    pushq $4
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
  # Null check: h != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call h.call("hi")
    leaq __ic_string_lit_15(%rip), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
  # Null check: bs != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < bs.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -48(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # bs[0] = true
    movq -48(%rbp), %rax
    movq $0, %r10
    movq $1, %r11
    movq %r11, (%rax,%r10,8)
  # Null check: bs != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 1 < bs.length
    movq $1, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -48(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # bs[1] = false
    movq -48(%rbp), %rax
    movq $1, %r10
    movq $0, %r11
    movq %r11, (%rax,%r10,8)
  # Null check: p != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call p.call(bs)
    movq -48(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
  # Null check: ints != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < ints.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -56(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # ints[0] = 7
    movq -56(%rbp), %rax
    movq $0, %r10
    movq $7, %r11
    movq %r11, (%rax,%r10,8)
  # Null check: q != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call q.call(ints)
    movq -56(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
__method_TestFunctionParams.main_epilogue:
    addq $160, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: TestFunctionParams
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store TestFunctionParams's vtable pointer in new object instance.
    leaq __TestFunctionParams_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for TestFunctionParams.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call TestFunctionParams.main
    callq __method_TestFunctionParams.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
