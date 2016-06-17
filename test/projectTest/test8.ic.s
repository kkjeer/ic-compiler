  # Compiled by icc from test/projectTest/test8.ic
  # At Sun May 15 10:57:19 EDT 2016

.data
  # string literals
    .align 8
    .quad 11
__ic_string_lit_0:
    .ascii"Hello World"

    .align 8
    .quad 22
__ic_string_lit_1:
    .ascii"Project test 8: Simple"

    .align 8
    .quad 3
__ic_string_lit_2:
    .ascii"b: "

    .align 8
    .quad 0
__ic_string_lit_3:
    .ascii""

    .align 8
    .quad 3
__ic_string_lit_4:
    .ascii"b: "

    .align 8
    .quad 0
__ic_string_lit_5:
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

  # vtable for class PARAMS____RETURN__void_Template
    .align 8
__PARAMS____RETURN__void_Template_vtable:
    .quad __method_PARAMS____RETURN__void_Template.call
  # vtable for class PARAMS____RETURN__int_Template
    .align 8
__PARAMS____RETURN__int_Template_vtable:
    .quad __method_PARAMS____RETURN__int_Template.call
  # vtable for class PARAMS__int__RETURN__boolean_Template
    .align 8
__PARAMS__int__RETURN__boolean_Template_vtable:
    .quad __method_PARAMS__int__RETURN__boolean_Template.call
  # vtable for class Simple_main_f_Closure
    .align 8
__Simple_main_f_Closure_vtable:
    .quad __method_Simple_main_f_Closure.call
    .quad __method_Simple_main_f_Closure.create
  # vtable for class Simple_main_anon0_Closure
    .align 8
__Simple_main_anon0_Closure_vtable:
    .quad __method_Simple_main_anon0_Closure.call
    .quad __method_Simple_main_anon0_Closure.create
  # vtable for class Simple_main_anon1_Closure
    .align 8
__Simple_main_anon1_Closure_vtable:
    .quad __method_Simple_main_anon1_Closure.call
    .quad __method_Simple_main_anon1_Closure.create
  # vtable for class Simple_main_anon2_Closure
    .align 8
__Simple_main_anon2_Closure_vtable:
    .quad __method_Simple_main_anon2_Closure.call
    .quad __method_Simple_main_anon2_Closure.create
  # vtable for class Simple_main_anon3_Closure
    .align 8
__Simple_main_anon3_Closure_vtable:
    .quad __method_Simple_main_anon3_Closure.call
    .quad __method_Simple_main_anon3_Closure.create
  # vtable for class Simple
    .align 8
__Simple_vtable:
    .quad __method_Simple.main

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

__method_PARAMS____RETURN__void_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return
    jmp __method_PARAMS____RETURN__void_Template.call_epilogue
__method_PARAMS____RETURN__void_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS____RETURN__int_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return 0
    movq $0, %rax
    jmp __method_PARAMS____RETURN__int_Template.call_epilogue
__method_PARAMS____RETURN__int_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__int__RETURN__boolean_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return true
    movq $1, %rax
    jmp __method_PARAMS__int__RETURN__boolean_Template.call_epilogue
__method_PARAMS__int__RETURN__boolean_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_Simple_main_f_Closure.create:
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
    jmp __method_Simple_main_f_Closure.create_epilogue
__method_Simple_main_f_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_Simple_main_f_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # x = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # call Library.printi(x)
    movq -8(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
__method_Simple_main_f_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_Simple_main_anon0_Closure.create:
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
    jmp __method_Simple_main_anon0_Closure.create_epilogue
__method_Simple_main_anon0_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_Simple_main_anon0_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return 0
    movq $0, %rax
    jmp __method_Simple_main_anon0_Closure.call_epilogue
__method_Simple_main_anon0_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_Simple_main_anon1_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $64, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.b = b
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
  # t1.g = g
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
  # t2.args = args
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
  # t3.f = f
    movq -40(%rbp), %r10
    movq 48(%rbp), %rax
    movq %rax, 24(%r10)
  # t4 = this
    movq 16(%rbp), %rax
    movq %rax, -48(%rbp)
  # Null check: t4 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4.anonResult = anonResult
    movq -48(%rbp), %r10
    movq 56(%rbp), %rax
    movq %rax, 32(%r10)
  # t5 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # return t5
    movq -56(%rbp), %rax
    jmp __method_Simple_main_anon1_Closure.create_epilogue
__method_Simple_main_anon1_Closure.create_epilogue:
    addq $64, %rsp
    popq %rbp
    retq

__method_Simple_main_anon1_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return true
    movq $1, %rax
    jmp __method_Simple_main_anon1_Closure.call_epilogue
__method_Simple_main_anon1_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_Simple_main_anon2_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $64, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.b = b
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
  # t1.g = g
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
  # t2.args = args
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
  # t3.f = f
    movq -40(%rbp), %r10
    movq 48(%rbp), %rax
    movq %rax, 24(%r10)
  # t4 = this
    movq 16(%rbp), %rax
    movq %rax, -48(%rbp)
  # Null check: t4 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4.anonResult = anonResult
    movq -48(%rbp), %r10
    movq 56(%rbp), %rax
    movq %rax, 32(%r10)
  # t5 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # return t5
    movq -56(%rbp), %rax
    jmp __method_Simple_main_anon2_Closure.create_epilogue
__method_Simple_main_anon2_Closure.create_epilogue:
    addq $64, %rsp
    popq %rbp
    retq

__method_Simple_main_anon2_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return false
    movq $0, %rax
    jmp __method_Simple_main_anon2_Closure.call_epilogue
__method_Simple_main_anon2_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_Simple_main_anon3_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $64, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.b = b
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
  # t1.g = g
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
  # t2.args = args
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
  # t3.f = f
    movq -40(%rbp), %r10
    movq 48(%rbp), %rax
    movq %rax, 24(%r10)
  # t4 = this
    movq 16(%rbp), %rax
    movq %rax, -48(%rbp)
  # Null check: t4 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4.anonResult = anonResult
    movq -48(%rbp), %r10
    movq 56(%rbp), %rax
    movq %rax, 32(%r10)
  # t5 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # return t5
    movq -56(%rbp), %rax
    jmp __method_Simple_main_anon3_Closure.create_epilogue
__method_Simple_main_anon3_Closure.create_epilogue:
    addq $64, %rsp
    popq %rbp
    retq

__method_Simple_main_anon3_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # str = "Hello World"
    leaq __ic_string_lit_0(%rip), %rax
    movq %rax, -8(%rbp)
  # call Library.println(str)
    movq -8(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_Simple_main_anon3_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_Simple.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $144, %rsp
  # t1 = new Simple_main_f_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __Simple_main_f_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -56(%rbp)
  # Null check: t1 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(args)
    movq 24(%rbp), %rax
    pushq %rax
    movq -56(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -48(%rbp)
  # f = t0
    movq -48(%rbp), %rax
    movq %rax, -8(%rbp)
  # t4 = new Simple_main_anon0_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __Simple_main_anon0_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -80(%rbp)
  # Null check: t4 != Null
    movq -80(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = call t4.create(args)
    movq 24(%rbp), %rax
    pushq %rax
    movq -80(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -72(%rbp)
  # Null check: t3 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = call t3.call()
    subq $8, %rsp
    movq -72(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -64(%rbp)
  # anonResult = t2
    movq -64(%rbp), %rax
    movq %rax, -24(%rbp)
  # call Library.println("Project test 8: Simple")
    leaq __ic_string_lit_1(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # t6 = new Simple_main_anon1_Closure()
    movq $48, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __Simple_main_anon1_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -96(%rbp)
  # Null check: t6 != Null
    movq -96(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5 = call t6.create(b, g, args, f, anonResult)
    movq -24(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -96(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $48, %rsp
    movq %rax, -88(%rbp)
  # g = t5
    movq -88(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: g != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7 = call g.call(1)
    pushq $1
    movq -32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -104(%rbp)
  # b = t7
    movq -104(%rbp), %rax
    movq %rax, -16(%rbp)
  # call Library.print("b: ")
    leaq __ic_string_lit_2(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printb(b)
    movq -16(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printb
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_3(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # t9 = new Simple_main_anon2_Closure()
    movq $48, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __Simple_main_anon2_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -120(%rbp)
  # Null check: t9 != Null
    movq -120(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8 = call t9.create(b, g, args, f, anonResult)
    movq -24(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -120(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $48, %rsp
    movq %rax, -112(%rbp)
  # g = t8
    movq -112(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: g != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t10 = call g.call(2)
    pushq $2
    movq -32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -128(%rbp)
  # b = t10
    movq -128(%rbp), %rax
    movq %rax, -16(%rbp)
  # t12 = new Simple_main_anon3_Closure()
    movq $48, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __Simple_main_anon3_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -144(%rbp)
  # Null check: t12 != Null
    movq -144(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t11 = call t12.create(b, g, args, f, anonResult)
    movq -24(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -144(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $48, %rsp
    movq %rax, -136(%rbp)
  # f = t11
    movq -136(%rbp), %rax
    movq %rax, -8(%rbp)
  # Null check: f != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call f.call()
    subq $8, %rsp
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
  # call Library.print("b: ")
    leaq __ic_string_lit_4(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printb(b)
    movq -16(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printb
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_5(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_Simple.main_epilogue:
    addq $144, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: Simple
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store Simple's vtable pointer in new object instance.
    leaq __Simple_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for Simple.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call Simple.main
    callq __method_Simple.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
