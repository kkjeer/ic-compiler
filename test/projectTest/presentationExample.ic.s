  # Compiled by icc from test/projectTest/presentationExample.ic
  # At Fri May 13 19:39:31 EDT 2016

.data
  # string literals
    .align 8
    .quad 6
__ic_string_lit_0:
    .ascii"cond: "

    .align 8
    .quad 0
__ic_string_lit_1:
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

  # vtable for class PARAMS__int__RETURN__boolean_Template
    .align 8
__PARAMS__int__RETURN__boolean_Template_vtable:
    .quad __method_PARAMS__int__RETURN__boolean_Template.call
  # vtable for class PARAMS__string__RETURN__boolean_Template
    .align 8
__PARAMS__string__RETURN__boolean_Template_vtable:
    .quad __method_PARAMS__string__RETURN__boolean_Template.call
  # vtable for class PARAMS__int__RETURN__int_Template
    .align 8
__PARAMS__int__RETURN__int_Template_vtable:
    .quad __method_PARAMS__int__RETURN__int_Template.call
  # vtable for class Example_main_anon0_Closure
    .align 8
__Example_main_anon0_Closure_vtable:
    .quad __method_Example_main_anon0_Closure.call
    .quad __method_Example_main_anon0_Closure.create
  # vtable for class Example_main_anon1_Closure
    .align 8
__Example_main_anon1_Closure_vtable:
    .quad __method_Example_main_anon1_Closure.call
    .quad __method_Example_main_anon1_Closure.create
  # vtable for class Example_main_anon1_anon1_Closure
    .align 8
__Example_main_anon1_anon1_Closure_vtable:
    .quad __method_Example_main_anon1_anon1_Closure.call
    .quad __method_Example_main_anon1_anon1_Closure.create
  # vtable for class Example
    .align 8
__Example_vtable:
    .quad __method_Example.main

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

__method_PARAMS__string__RETURN__boolean_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return true
    movq $1, %rax
    jmp __method_PARAMS__string__RETURN__boolean_Template.call_epilogue
__method_PARAMS__string__RETURN__boolean_Template.call_epilogue:
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

__method_Example_main_anon0_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $80, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -48(%rbp)
  # Null check: t0 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.fcnField = fcnField
    movq -48(%rbp), %r10
    movq 24(%rbp), %rax
    movq %rax, 0(%r10)
  # t1 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # Null check: t1 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1.args = args
    movq -56(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -64(%rbp)
  # Null check: t2 != Null
    movq -64(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.f = f
    movq -64(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -72(%rbp)
  # Null check: t3 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3.cond = cond
    movq -72(%rbp), %r10
    movq 48(%rbp), %rax
    movq %rax, 24(%r10)
  # t4 = this
    movq 16(%rbp), %rax
    movq %rax, -80(%rbp)
  # return t4
    movq -80(%rbp), %rax
    jmp __method_Example_main_anon0_Closure.create_epilogue
__method_Example_main_anon0_Closure.create_epilogue:
    addq $80, %rsp
    popq %rbp
    retq

__method_Example_main_anon0_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return true
    movq $1, %rax
    jmp __method_Example_main_anon0_Closure.call_epilogue
__method_Example_main_anon0_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_Example_main_anon1_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $80, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -48(%rbp)
  # Null check: t0 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.fcnField = fcnField
    movq -48(%rbp), %r10
    movq 24(%rbp), %rax
    movq %rax, 0(%r10)
  # t1 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # Null check: t1 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1.args = args
    movq -56(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -64(%rbp)
  # Null check: t2 != Null
    movq -64(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.f = f
    movq -64(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -72(%rbp)
  # Null check: t3 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3.cond = cond
    movq -72(%rbp), %r10
    movq 48(%rbp), %rax
    movq %rax, 24(%r10)
  # t4 = this
    movq 16(%rbp), %rax
    movq %rax, -80(%rbp)
  # return t4
    movq -80(%rbp), %rax
    jmp __method_Example_main_anon1_Closure.create_epilogue
__method_Example_main_anon1_Closure.create_epilogue:
    addq $80, %rsp
    popq %rbp
    retq

__method_Example_main_anon1_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $144, %rsp
  # fLocal = 3
    movq $3, %rax
    movq %rax, -8(%rbp)
  # t1 = new Example_main_anon1_anon1_Closure()
    movq $64, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __Example_main_anon1_anon1_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -40(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = this.args
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -48(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = this.cond
    movq 16(%rbp), %rax
    movq 24(%rax), %rax
    movq %rax, -56(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = this.fcnField
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -64(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5 = this.f
    movq 16(%rbp), %rax
    movq 16(%rax), %rax
    movq %rax, -72(%rbp)
  # Null check: t1 != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(fParam, t2, g, fLocal, t3, t4, t5)
    movq -72(%rbp), %rax
    pushq %rax
    movq -64(%rbp), %rax
    pushq %rax
    movq -56(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $64, %rsp
    movq %rax, -32(%rbp)
  # g = t0
    movq -32(%rbp), %rax
    movq %rax, -16(%rbp)
  # t9 = fParam + 10
    movq 16(%rbp), %rax
    movq $10, %r10
    addq %rax, %r10
    movq %r10, -104(%rbp)
  # Null check: g != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8 = call g.call(t9)
    movq -104(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -96(%rbp)
  # t7 = t8 > 0
    movq -96(%rbp), %rax
    movq $0, %r10
    cmpq %r10, %rax
    setg %al
    movzbq %al, %rax
    movq %rax, -88(%rbp)
  # t6 = t7
    movq -88(%rbp), %rax
    movq %rax, -80(%rbp)
  # t10 = !t6
    movq -80(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -112(%rbp)
  # cjump t10 label _endAndExample_main_anon1_Closure_call0
    movq -112(%rbp), %rax
    testq %rax, %rax
    jnz _endAndExample_main_anon1_Closure_call0
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t12 = this.fcnField
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -128(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t14 = this.args
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -144(%rbp)
  # Null check: t14 != Null
    movq -144(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < t14.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -144(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t13 = t14[0]
    movq -144(%rbp), %rax
    movq $0, %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -136(%rbp)
  # Null check: t12 != Null
    movq -128(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t11 = call t12.call(t13)
    movq -136(%rbp), %rax
    pushq %rax
    movq -128(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -120(%rbp)
  # t6 = t11
    movq -120(%rbp), %rax
    movq %rax, -80(%rbp)
  # label _endAndExample_main_anon1_Closure_call0
_endAndExample_main_anon1_Closure_call0:
  # return t6
    movq -80(%rbp), %rax
    jmp __method_Example_main_anon1_Closure.call_epilogue
__method_Example_main_anon1_Closure.call_epilogue:
    addq $144, %rsp
    popq %rbp
    retq

__method_Example_main_anon1_anon1_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $128, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -72(%rbp)
  # Null check: t0 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.fParam = fParam
    movq -72(%rbp), %r10
    movq 24(%rbp), %rax
    movq %rax, 0(%r10)
  # t1 = this
    movq 16(%rbp), %rax
    movq %rax, -80(%rbp)
  # Null check: t1 != Null
    movq -80(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1.args = args
    movq -80(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -88(%rbp)
  # Null check: t2 != Null
    movq -88(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.g = g
    movq -88(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -96(%rbp)
  # Null check: t3 != Null
    movq -96(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3.fLocal = fLocal
    movq -96(%rbp), %r10
    movq 48(%rbp), %rax
    movq %rax, 24(%r10)
  # t4 = this
    movq 16(%rbp), %rax
    movq %rax, -104(%rbp)
  # Null check: t4 != Null
    movq -104(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4.cond = cond
    movq -104(%rbp), %r10
    movq 56(%rbp), %rax
    movq %rax, 32(%r10)
  # t5 = this
    movq 16(%rbp), %rax
    movq %rax, -112(%rbp)
  # Null check: t5 != Null
    movq -112(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5.fcnField = fcnField
    movq -112(%rbp), %r10
    movq 64(%rbp), %rax
    movq %rax, 40(%r10)
  # t6 = this
    movq 16(%rbp), %rax
    movq %rax, -120(%rbp)
  # Null check: t6 != Null
    movq -120(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6.f = f
    movq -120(%rbp), %r10
    movq 72(%rbp), %rax
    movq %rax, 48(%r10)
  # t7 = this
    movq 16(%rbp), %rax
    movq %rax, -128(%rbp)
  # return t7
    movq -128(%rbp), %rax
    jmp __method_Example_main_anon1_anon1_Closure.create_epilogue
__method_Example_main_anon1_anon1_Closure.create_epilogue:
    addq $128, %rsp
    popq %rbp
    retq

__method_Example_main_anon1_anon1_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1 = this.fLocal
    movq 16(%rbp), %rax
    movq 24(%rax), %rax
    movq %rax, -24(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = this.fParam
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -40(%rbp)
  # t2 = t3 * gParam
    movq -40(%rbp), %rax
    movq 16(%rbp), %r10
    imulq %rax, %r10
    movq %r10, -32(%rbp)
  # t0 = t1 + t2
    movq -24(%rbp), %rax
    movq -32(%rbp), %r10
    addq %rax, %r10
    movq %r10, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_Example_main_anon1_anon1_Closure.call_epilogue
__method_Example_main_anon1_anon1_Closure.call_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_Example.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $96, %rsp
  # t1 = new Example_main_anon0_Closure()
    movq $40, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __Example_main_anon0_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -48(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = this.fcnField
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -56(%rbp)
  # Null check: t1 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(t2, args, f, cond)
    subq $8, %rsp
    movq -24(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -56(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $48, %rsp
    movq %rax, -40(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.fcnField = t0
    movq 16(%rbp), %r10
    movq -40(%rbp), %rax
    movq %rax, 0(%r10)
  # t5 = new Example_main_anon1_Closure()
    movq $40, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __Example_main_anon1_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -80(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6 = this.fcnField
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -88(%rbp)
  # Null check: t5 != Null
    movq -80(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = call t5.create(t6, args, f, cond)
    subq $8, %rsp
    movq -24(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -88(%rbp), %rax
    pushq %rax
    movq -80(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $48, %rsp
    movq %rax, -72(%rbp)
  # f = t4
    movq -72(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: f != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7 = call f.call(5)
    pushq $5
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -96(%rbp)
  # cond = t7
    movq -96(%rbp), %rax
    movq %rax, -24(%rbp)
  # call Library.print("cond: ")
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printb(cond)
    movq -24(%rbp), %rdi
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
__method_Example.main_epilogue:
    addq $96, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: Example
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store Example's vtable pointer in new object instance.
    leaq __Example_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for Example.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call Example.main
    callq __method_Example.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
