  # Compiled by icc from test/projectTest/test10.ic
  # At Sun May 15 10:57:31 EDT 2016

.data
  # string literals
    .align 8
    .quad 9
__ic_string_lit_0:
    .ascii"calling f"

    .align 8
    .quad 22
__ic_string_lit_1:
    .ascii"creating result in map"

    .align 8
    .quad 1
__ic_string_lit_2:
    .ascii" "

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

  # vtable for class PARAMS__PARAMS__int__RETURN__int__RETURN__void_Template
    .align 8
__PARAMS__PARAMS__int__RETURN__int__RETURN__void_Template_vtable:
    .quad __method_PARAMS__PARAMS__int__RETURN__int__RETURN__void_Template.call
  # vtable for class PARAMS__int__RETURN__int_Template
    .align 8
__PARAMS__int__RETURN__int_Template_vtable:
    .quad __method_PARAMS__int__RETURN__int_Template.call
  # vtable for class PARAMS__int_array_int_PARAMS__int__RETURN__int__RETURN__int_array_Template
    .align 8
__PARAMS__int_array_int_PARAMS__int__RETURN__int__RETURN__int_array_Template_vtable:
    .quad __method_PARAMS__int_array_int_PARAMS__int__RETURN__int__RETURN__int_array_Template.call
  # vtable for class FunctionParam_main_f_Closure
    .align 8
__FunctionParam_main_f_Closure_vtable:
    .quad __method_FunctionParam_main_f_Closure.call
    .quad __method_FunctionParam_main_f_Closure.create
  # vtable for class FunctionParam_main_map_Closure
    .align 8
__FunctionParam_main_map_Closure_vtable:
    .quad __method_FunctionParam_main_map_Closure.call
    .quad __method_FunctionParam_main_map_Closure.create
  # vtable for class FunctionParam_main_anon0_Closure
    .align 8
__FunctionParam_main_anon0_Closure_vtable:
    .quad __method_FunctionParam_main_anon0_Closure.call
    .quad __method_FunctionParam_main_anon0_Closure.create
  # vtable for class FunctionParam_main_anon1_Closure
    .align 8
__FunctionParam_main_anon1_Closure_vtable:
    .quad __method_FunctionParam_main_anon1_Closure.call
    .quad __method_FunctionParam_main_anon1_Closure.create
  # vtable for class FunctionParam
    .align 8
__FunctionParam_vtable:
    .quad __method_FunctionParam.main

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

__method_PARAMS__PARAMS__int__RETURN__int__RETURN__void_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return
    jmp __method_PARAMS__PARAMS__int__RETURN__int__RETURN__void_Template.call_epilogue
__method_PARAMS__PARAMS__int__RETURN__int__RETURN__void_Template.call_epilogue:
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

__method_PARAMS__int_array_int_PARAMS__int__RETURN__int__RETURN__int_array_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return Null
    movq $0, %rax
    jmp __method_PARAMS__int_array_int_PARAMS__int__RETURN__int__RETURN__int_array_Template.call_epilogue
__method_PARAMS__int_array_int_PARAMS__int__RETURN__int__RETURN__int_array_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_FunctionParam_main_f_Closure.create:
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
  # t0.arrLength = arrLength
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
    jmp __method_FunctionParam_main_f_Closure.create_epilogue
__method_FunctionParam_main_f_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_FunctionParam_main_f_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # call Library.println("calling f")
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_FunctionParam_main_f_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_FunctionParam_main_map_Closure.create:
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
  # t0.arrLength = arrLength
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
    jmp __method_FunctionParam_main_map_Closure.create_epilogue
__method_FunctionParam_main_map_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_FunctionParam_main_map_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # i = 5
    movq $5, %rax
    movq %rax, -8(%rbp)
  # call Library.println("creating result in map")
    leaq __ic_string_lit_1(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # Size check: i >= 0			
    movq -8(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [i]
    movq -8(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -40(%rbp)
  # fakeArgs = t0
    movq -40(%rbp), %rax
    movq %rax, -24(%rbp)
  # Size check: i >= 0			
    movq -8(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t1 = new [i]
    movq -8(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -48(%rbp)
  # result = t1
    movq -48(%rbp), %rax
    movq %rax, -16(%rbp)
  # return result
    movq -16(%rbp), %rax
    jmp __method_FunctionParam_main_map_Closure.call_epilogue
__method_FunctionParam_main_map_Closure.call_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_FunctionParam_main_anon0_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $80, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.mapped = mapped
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
  # t1.len = len
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
  # t2.map = map
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
  # t3.i = i
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
  # t4.args = args
    movq -48(%rbp), %r10
    movq 56(%rbp), %rax
    movq %rax, 32(%r10)
  # t5 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # Null check: t5 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5.ints = ints
    movq -56(%rbp), %r10
    movq 64(%rbp), %rax
    movq %rax, 40(%r10)
  # t6 = this
    movq 16(%rbp), %rax
    movq %rax, -64(%rbp)
  # Null check: t6 != Null
    movq -64(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6.f = f
    movq -64(%rbp), %r10
    movq 72(%rbp), %rax
    movq %rax, 48(%r10)
  # t7 = this
    movq 16(%rbp), %rax
    movq %rax, -72(%rbp)
  # Null check: t7 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7.arrLength = arrLength
    movq -72(%rbp), %r10
    movq 80(%rbp), %rax
    movq %rax, 56(%r10)
  # t8 = this
    movq 16(%rbp), %rax
    movq %rax, -80(%rbp)
  # return t8
    movq -80(%rbp), %rax
    jmp __method_FunctionParam_main_anon0_Closure.create_epilogue
__method_FunctionParam_main_anon0_Closure.create_epilogue:
    addq $80, %rsp
    popq %rbp
    retq

__method_FunctionParam_main_anon0_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return 0
    movq $0, %rax
    jmp __method_FunctionParam_main_anon0_Closure.call_epilogue
__method_FunctionParam_main_anon0_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_FunctionParam_main_anon1_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $80, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.mapped = mapped
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
  # t1.len = len
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
  # t2.map = map
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
  # t3.i = i
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
  # t4.args = args
    movq -48(%rbp), %r10
    movq 56(%rbp), %rax
    movq %rax, 32(%r10)
  # t5 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # Null check: t5 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5.ints = ints
    movq -56(%rbp), %r10
    movq 64(%rbp), %rax
    movq %rax, 40(%r10)
  # t6 = this
    movq 16(%rbp), %rax
    movq %rax, -64(%rbp)
  # Null check: t6 != Null
    movq -64(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6.f = f
    movq -64(%rbp), %r10
    movq 72(%rbp), %rax
    movq %rax, 48(%r10)
  # t7 = this
    movq 16(%rbp), %rax
    movq %rax, -72(%rbp)
  # Null check: t7 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7.arrLength = arrLength
    movq -72(%rbp), %r10
    movq 80(%rbp), %rax
    movq %rax, 56(%r10)
  # t8 = this
    movq 16(%rbp), %rax
    movq %rax, -80(%rbp)
  # return t8
    movq -80(%rbp), %rax
    jmp __method_FunctionParam_main_anon1_Closure.create_epilogue
__method_FunctionParam_main_anon1_Closure.create_epilogue:
    addq $80, %rsp
    popq %rbp
    retq

__method_FunctionParam_main_anon1_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return 2
    movq $2, %rax
    jmp __method_FunctionParam_main_anon1_Closure.call_epilogue
__method_FunctionParam_main_anon1_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_FunctionParam.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $240, %rsp
  # t1 = new FunctionParam_main_f_Closure()
    movq $24, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __FunctionParam_main_f_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -72(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = this.arrLength
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -80(%rbp)
  # Null check: t1 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(t2, args)
    subq $8, %rsp
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
  # f = t0
    movq -64(%rbp), %rax
    movq %rax, -8(%rbp)
  # t4 = new FunctionParam_main_map_Closure()
    movq $24, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __FunctionParam_main_map_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -96(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5 = this.arrLength
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -104(%rbp)
  # Null check: t4 != Null
    movq -96(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = call t4.create(t5, args)
    subq $8, %rsp
    movq 24(%rbp), %rax
    pushq %rax
    movq -104(%rbp), %rax
    pushq %rax
    movq -96(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -88(%rbp)
  # map = t3
    movq -88(%rbp), %rax
    movq %rax, -16(%rbp)
  # i = 0
    movq $0, %rax
    movq %rax, -48(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.arrLength = 2
    movq 16(%rbp), %r10
    movq $2, %rax
    movq %rax, 0(%r10)
  # t8 = new FunctionParam_main_anon0_Closure()
    movq $72, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __FunctionParam_main_anon0_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -128(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t9 = this.arrLength
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -136(%rbp)
  # Null check: t8 != Null
    movq -128(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7 = call t8.create(mapped, len, map, i, args, ints, f, t9)
    subq $8, %rsp
    movq -136(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -128(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $80, %rsp
    movq %rax, -120(%rbp)
  # Null check: f != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call f.call(t7)
    movq -120(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
  # len = 2
    movq $2, %rax
    movq %rax, -40(%rbp)
  # Size check: 2 >= 0			
    movq $2, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t10 = new [2]
    movq $2, %rdi
    callq __LIB_allocateArray
    movq %rax, -144(%rbp)
  # ints = t10
    movq -144(%rbp), %rax
    movq %rax, -24(%rbp)
  # Null check: ints != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < ints.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # ints[0] = 3
    movq -24(%rbp), %rax
    movq $0, %r10
    movq $3, %r11
    movq %r11, (%rax,%r10,8)
  # Null check: ints != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t11= ints.length
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -152(%rbp)
  # len = t11
    movq -152(%rbp), %rax
    movq %rax, -40(%rbp)
  # t14 = new FunctionParam_main_anon1_Closure()
    movq $72, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __FunctionParam_main_anon1_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -176(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t15 = this.arrLength
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -184(%rbp)
  # Null check: t14 != Null
    movq -176(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t13 = call t14.create(mapped, len, map, i, args, ints, f, t15)
    subq $8, %rsp
    movq -184(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -176(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $80, %rsp
    movq %rax, -168(%rbp)
  # Null check: map != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t12 = call map.call(ints, 1, t13)
    movq -168(%rbp), %rax
    pushq %rax
    pushq $1
    movq -24(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -160(%rbp)
  # mapped = t12
    movq -160(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: mapped != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < mapped.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -32(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t16 = mapped[0]
    movq -32(%rbp), %rax
    movq $0, %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -192(%rbp)
  # call Library.printi(t16)
    movq -192(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # label _beginWhileFunctionParam_main0
_beginWhileFunctionParam_main0:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t19 = this.arrLength
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -216(%rbp)
  # t18 = i < t19
    movq -48(%rbp), %rax
    movq -216(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -208(%rbp)
  # t17 = t18			#condition for while loop on line 41
    movq -208(%rbp), %rax
    movq %rax, -200(%rbp)
  # t20 = !t18
    movq -208(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -224(%rbp)
  # cjump t20 label _endWhileFunctionParam_main0			#test for while loop on line 41
    movq -224(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileFunctionParam_main0
  # call Library.print(" ")
    leaq __ic_string_lit_2(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # t21 = i + 1
    movq -48(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -232(%rbp)
  # i = t21
    movq -232(%rbp), %rax
    movq %rax, -48(%rbp)
  # jump label _beginWhileFunctionParam_main0
    jmp _beginWhileFunctionParam_main0
  # label _endWhileFunctionParam_main0
_endWhileFunctionParam_main0:
  # call Library.println("")
    leaq __ic_string_lit_3(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_FunctionParam.main_epilogue:
    addq $240, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: FunctionParam
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store FunctionParam's vtable pointer in new object instance.
    leaq __FunctionParam_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for FunctionParam.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call FunctionParam.main
    callq __method_FunctionParam.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
