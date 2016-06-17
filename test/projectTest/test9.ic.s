  # Compiled by icc from test/projectTest/test9.ic
  # At Sun May 15 10:57:25 EDT 2016

.data
  # string literals
    .align 8
    .quad 0
__ic_string_lit_0:
    .ascii""

    .align 8
    .quad 4
__ic_string_lit_1:
    .ascii"Hi f"

    .align 8
    .quad 28
__ic_string_lit_2:
    .ascii"Project test 9: ReallyNested"

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

  # vtable for class PARAMS__boolean__RETURN__string_Template
    .align 8
__PARAMS__boolean__RETURN__string_Template_vtable:
    .quad __method_PARAMS__boolean__RETURN__string_Template.call
  # vtable for class PARAMS__int_int__RETURN__int_Template
    .align 8
__PARAMS__int_int__RETURN__int_Template_vtable:
    .quad __method_PARAMS__int_int__RETURN__int_Template.call
  # vtable for class PARAMS__int__RETURN__int_Template
    .align 8
__PARAMS__int__RETURN__int_Template_vtable:
    .quad __method_PARAMS__int__RETURN__int_Template.call
  # vtable for class ReallyNested_main_f_Closure
    .align 8
__ReallyNested_main_f_Closure_vtable:
    .quad __method_ReallyNested_main_f_Closure.call
    .quad __method_ReallyNested_main_f_Closure.create
  # vtable for class ReallyNested_main_f_gInF_Closure
    .align 8
__ReallyNested_main_f_gInF_Closure_vtable:
    .quad __method_ReallyNested_main_f_gInF_Closure.call
    .quad __method_ReallyNested_main_f_gInF_Closure.create
  # vtable for class ReallyNested_main_f_gInF_hInG_Closure
    .align 8
__ReallyNested_main_f_gInF_hInG_Closure_vtable:
    .quad __method_ReallyNested_main_f_gInF_hInG_Closure.call
    .quad __method_ReallyNested_main_f_gInF_hInG_Closure.create
  # vtable for class ReallyNested_main_f_anon0_Closure
    .align 8
__ReallyNested_main_f_anon0_Closure_vtable:
    .quad __method_ReallyNested_main_f_anon0_Closure.call
    .quad __method_ReallyNested_main_f_anon0_Closure.create
  # vtable for class ReallyNested
    .align 8
__ReallyNested_vtable:
    .quad __method_ReallyNested.main

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

__method_ReallyNested_main_f_Closure.create:
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
  # t0.nestedField = nestedField
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
  # t1.args = args
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # return t2
    movq -32(%rbp), %rax
    jmp __method_ReallyNested_main_f_Closure.create_epilogue
__method_ReallyNested_main_f_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_ReallyNested_main_f_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $96, %rsp
  # fLocal = 5
    movq $5, %rax
    movq %rax, -8(%rbp)
  # t1 = new ReallyNested_main_f_gInF_Closure()
    movq $32, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __ReallyNested_main_f_gInF_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -40(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = this.nestedField
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -48(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = this.args
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -56(%rbp)
  # Null check: t1 != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(t2, t3, b)
    movq 24(%rbp), %rax
    pushq %rax
    movq -56(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -32(%rbp)
  # gInF = t0
    movq -32(%rbp), %rax
    movq %rax, -16(%rbp)
  # t5 = new ReallyNested_main_f_anon0_Closure()
    movq $48, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __ReallyNested_main_f_anon0_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -72(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6 = this.args
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -80(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7 = this.nestedField
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -88(%rbp)
  # Null check: t5 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = call t5.create(t6, t7, fLocal, b, gInF)
    movq -16(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -88(%rbp), %rax
    pushq %rax
    movq -80(%rbp), %rax
    pushq %rax
    movq -72(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $48, %rsp
    movq %rax, -64(%rbp)
  # gInF = t4
    movq -64(%rbp), %rax
    movq %rax, -16(%rbp)
  # call Library.printi(fLocal)
    movq -8(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # return "Hi f"
    leaq __ic_string_lit_1(%rip), %rax
    jmp __method_ReallyNested_main_f_Closure.call_epilogue
__method_ReallyNested_main_f_Closure.call_epilogue:
    addq $96, %rsp
    popq %rbp
    retq

__method_ReallyNested_main_f_gInF_Closure.create:
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
  # t0.nestedField = nestedField
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
  # t1.args = args
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
  # t2.b = b
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # return t3
    movq -40(%rbp), %rax
    jmp __method_ReallyNested_main_f_gInF_Closure.create_epilogue
__method_ReallyNested_main_f_gInF_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_ReallyNested_main_f_gInF_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $80, %rsp
  # t1 = new ReallyNested_main_f_gInF_hInG_Closure()
    movq $48, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __ReallyNested_main_f_gInF_hInG_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -32(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = this.args
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -40(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = this.nestedField
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -48(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = this.b
    movq 16(%rbp), %rax
    movq 16(%rax), %rax
    movq %rax, -56(%rbp)
  # Null check: t1 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(t2, t3, y, x, t4)
    movq -56(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $48, %rsp
    movq %rax, -24(%rbp)
  # hInG = t0
    movq -24(%rbp), %rax
    movq %rax, -8(%rbp)
  # t6 = x + y
    movq 24(%rbp), %rax
    movq 32(%rbp), %r10
    addq %rax, %r10
    movq %r10, -72(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7 = this.nestedField
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -80(%rbp)
  # t5 = t6 + t7
    movq -72(%rbp), %rax
    movq -80(%rbp), %r10
    addq %rax, %r10
    movq %r10, -64(%rbp)
  # return t5
    movq -64(%rbp), %rax
    jmp __method_ReallyNested_main_f_gInF_Closure.call_epilogue
__method_ReallyNested_main_f_gInF_Closure.call_epilogue:
    addq $80, %rsp
    popq %rbp
    retq

__method_ReallyNested_main_f_gInF_hInG_Closure.create:
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
  # t1.nestedField = nestedField
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
  # Null check: t3 != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3.x = x
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
  # t4.b = b
    movq -48(%rbp), %r10
    movq 56(%rbp), %rax
    movq %rax, 32(%r10)
  # t5 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # return t5
    movq -56(%rbp), %rax
    jmp __method_ReallyNested_main_f_gInF_hInG_Closure.create_epilogue
__method_ReallyNested_main_f_gInF_hInG_Closure.create_epilogue:
    addq $64, %rsp
    popq %rbp
    retq

__method_ReallyNested_main_f_gInF_hInG_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = this.x
    movq 16(%rbp), %rax
    movq 24(%rax), %rax
    movq %rax, -32(%rbp)
  # t1 = hInt + t2
    movq 24(%rbp), %rax
    movq -32(%rbp), %r10
    addq %rax, %r10
    movq %r10, -24(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = this.y
    movq 16(%rbp), %rax
    movq 16(%rax), %rax
    movq %rax, -40(%rbp)
  # t0 = t1 - t3
    movq -24(%rbp), %rax
    movq -40(%rbp), %r10
    subq %r10, %rax
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_ReallyNested_main_f_gInF_hInG_Closure.call_epilogue
__method_ReallyNested_main_f_gInF_hInG_Closure.call_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_ReallyNested_main_f_anon0_Closure.create:
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
  # t1.nestedField = nestedField
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
  # t2.fLocal = fLocal
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
  # t3.b = b
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
  # t4.gInF = gInF
    movq -48(%rbp), %r10
    movq 56(%rbp), %rax
    movq %rax, 32(%r10)
  # t5 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # return t5
    movq -56(%rbp), %rax
    jmp __method_ReallyNested_main_f_anon0_Closure.create_epilogue
__method_ReallyNested_main_f_anon0_Closure.create_epilogue:
    addq $64, %rsp
    popq %rbp
    retq

__method_ReallyNested_main_f_anon0_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = this.fLocal
    movq 16(%rbp), %rax
    movq 16(%rax), %rax
    movq %rax, -32(%rbp)
  # t1 = t2 * i
    movq -32(%rbp), %rax
    movq 24(%rbp), %r10
    imulq %rax, %r10
    movq %r10, -24(%rbp)
  # t0 = t1 + j
    movq -24(%rbp), %rax
    movq 32(%rbp), %r10
    addq %rax, %r10
    movq %r10, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_ReallyNested_main_f_anon0_Closure.call_epilogue
__method_ReallyNested_main_f_anon0_Closure.call_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_ReallyNested.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $64, %rsp
  # t1 = new ReallyNested_main_f_Closure()
    movq $24, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __ReallyNested_main_f_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -40(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = this.nestedField
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -48(%rbp)
  # Null check: t1 != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(t2, args)
    subq $8, %rsp
    movq 24(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
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
  # call Library.println("Project test 9: ReallyNested")
    leaq __ic_string_lit_2(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # Null check: f != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = call f.call(true)
    pushq $1
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -56(%rbp)
  # str = t3
    movq -56(%rbp), %rax
    movq %rax, -16(%rbp)
  # call Library.println(str)
    movq -16(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_ReallyNested.main_epilogue:
    addq $64, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: ReallyNested
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store ReallyNested's vtable pointer in new object instance.
    leaq __ReallyNested_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for ReallyNested.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call ReallyNested.main
    callq __method_ReallyNested.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
