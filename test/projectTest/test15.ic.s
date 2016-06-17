  # Compiled by icc from test/projectTest/test15.ic
  # At Sun May 15 10:58:02 EDT 2016

.data
  # string literals
    .align 8
    .quad 26
__ic_string_lit_0:
    .ascii"Project test 15: SimpleMap"

    .align 8
    .quad 3
__ic_string_lit_1:
    .ascii"m: "

    .align 8
    .quad 12
__ic_string_lit_2:
    .ascii" mapped[m]: "

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

  # vtable for class PARAMS__int_array_PARAMS__int__RETURN__int__RETURN__int_array_Template
    .align 8
__PARAMS__int_array_PARAMS__int__RETURN__int__RETURN__int_array_Template_vtable:
    .quad __method_PARAMS__int_array_PARAMS__int__RETURN__int__RETURN__int_array_Template.call
  # vtable for class PARAMS__int__RETURN__int_Template
    .align 8
__PARAMS__int__RETURN__int_Template_vtable:
    .quad __method_PARAMS__int__RETURN__int_Template.call
  # vtable for class SimpleMap_main_map_Closure
    .align 8
__SimpleMap_main_map_Closure_vtable:
    .quad __method_SimpleMap_main_map_Closure.call
    .quad __method_SimpleMap_main_map_Closure.create
  # vtable for class SimpleMap_main_anon0_Closure
    .align 8
__SimpleMap_main_anon0_Closure_vtable:
    .quad __method_SimpleMap_main_anon0_Closure.call
    .quad __method_SimpleMap_main_anon0_Closure.create
  # vtable for class SimpleMap
    .align 8
__SimpleMap_vtable:
    .quad __method_SimpleMap.main

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

__method_PARAMS__int_array_PARAMS__int__RETURN__int__RETURN__int_array_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return Null
    movq $0, %rax
    jmp __method_PARAMS__int_array_PARAMS__int__RETURN__int__RETURN__int_array_Template.call_epilogue
__method_PARAMS__int_array_PARAMS__int__RETURN__int__RETURN__int_array_Template.call_epilogue:
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

__method_SimpleMap_main_map_Closure.create:
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
    jmp __method_SimpleMap_main_map_Closure.create_epilogue
__method_SimpleMap_main_map_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_SimpleMap_main_map_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $80, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # Size check: 2 >= 0			
    movq $2, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [2]
    movq $2, %rdi
    callq __LIB_allocateArray
    movq %rax, -32(%rbp)
  # result = t0
    movq -32(%rbp), %rax
    movq %rax, -16(%rbp)
  # label _beginWhileSimpleMap_main_map_Closure_call0
_beginWhileSimpleMap_main_map_Closure_call0:
  # t2 = i < 2
    movq -8(%rbp), %rax
    movq $2, %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -48(%rbp)
  # t1 = t2			#condition for while loop on line 7
    movq -48(%rbp), %rax
    movq %rax, -40(%rbp)
  # t3 = !t2
    movq -48(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -56(%rbp)
  # cjump t3 label _endWhileSimpleMap_main_map_Closure_call0			#test for while loop on line 7
    movq -56(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileSimpleMap_main_map_Closure_call0
  # Null check: fcn != Null
    movq 32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = call fcn.call(i)
    movq -8(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -64(%rbp)
  # Null check: result != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < result.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -16(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # result[i] = t4
    movq -16(%rbp), %rax
    movq -8(%rbp), %r10
    movq -64(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t5 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -72(%rbp)
  # i = t5
    movq -72(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileSimpleMap_main_map_Closure_call0
    jmp _beginWhileSimpleMap_main_map_Closure_call0
  # label _endWhileSimpleMap_main_map_Closure_call0
_endWhileSimpleMap_main_map_Closure_call0:
  # return result
    movq -16(%rbp), %rax
    jmp __method_SimpleMap_main_map_Closure.call_epilogue
__method_SimpleMap_main_map_Closure.call_epilogue:
    addq $80, %rsp
    popq %rbp
    retq

__method_SimpleMap_main_anon0_Closure.create:
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
  # t0.ints = ints
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
  # t1.m = m
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
  # t2.mapped = mapped
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
  # t3.map = map
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
  # t5.f = f
    movq -56(%rbp), %r10
    movq 64(%rbp), %rax
    movq %rax, 40(%r10)
  # t6 = this
    movq 16(%rbp), %rax
    movq %rax, -64(%rbp)
  # return t6
    movq -64(%rbp), %rax
    jmp __method_SimpleMap_main_anon0_Closure.create_epilogue
__method_SimpleMap_main_anon0_Closure.create_epilogue:
    addq $64, %rsp
    popq %rbp
    retq

__method_SimpleMap_main_anon0_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # t0 = i + 3
    movq 24(%rbp), %rax
    movq $3, %r10
    addq %rax, %r10
    movq %r10, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_SimpleMap_main_anon0_Closure.call_epilogue
__method_SimpleMap_main_anon0_Closure.call_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_SimpleMap.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $144, %rsp
  # t1 = new SimpleMap_main_map_Closure()
    movq $16, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __SimpleMap_main_map_Closure_vtable(%rip), %r10
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
  # map = t0
    movq -56(%rbp), %rax
    movq %rax, -8(%rbp)
  # m = 0
    movq $0, %rax
    movq %rax, -32(%rbp)
  # Size check: 2 >= 0			
    movq $2, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t2 = new [2]
    movq $2, %rdi
    callq __LIB_allocateArray
    movq %rax, -72(%rbp)
  # ints = t2
    movq -72(%rbp), %rax
    movq %rax, -40(%rbp)
  # Null check: ints != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < ints.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -40(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # ints[0] = 0
    movq -40(%rbp), %rax
    movq $0, %r10
    movq $0, %r11
    movq %r11, (%rax,%r10,8)
  # Null check: ints != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 1 < ints.length
    movq $1, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -40(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # ints[1] = 1
    movq -40(%rbp), %rax
    movq $1, %r10
    movq $1, %r11
    movq %r11, (%rax,%r10,8)
  # t4 = new SimpleMap_main_anon0_Closure()
    movq $56, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __SimpleMap_main_anon0_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -88(%rbp)
  # Null check: t4 != Null
    movq -88(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = call t4.create(ints, m, mapped, map, args, f)
    subq $8, %rsp
    movq -16(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq -88(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $64, %rsp
    movq %rax, -80(%rbp)
  # f = t3
    movq -80(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: map != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5 = call map.call(ints, f)
    subq $8, %rsp
    movq -16(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -96(%rbp)
  # mapped = t5
    movq -96(%rbp), %rax
    movq %rax, -24(%rbp)
  # call Library.println("Project test 15: SimpleMap")
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # label _beginWhileSimpleMap_main0
_beginWhileSimpleMap_main0:
  # t7 = m < 2
    movq -32(%rbp), %rax
    movq $2, %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -112(%rbp)
  # t6 = t7			#condition for while loop on line 30
    movq -112(%rbp), %rax
    movq %rax, -104(%rbp)
  # t8 = !t7
    movq -112(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -120(%rbp)
  # cjump t8 label _endWhileSimpleMap_main0			#test for while loop on line 30
    movq -120(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileSimpleMap_main0
  # call Library.print("m: ")
    leaq __ic_string_lit_1(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printi(m)
    movq -32(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.print(" mapped[m]: ")
    leaq __ic_string_lit_2(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: mapped != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= m < mapped.length
    movq -32(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t9 = mapped[m]
    movq -24(%rbp), %rax
    movq -32(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -128(%rbp)
  # call Library.printi(t9)
    movq -128(%rbp), %rdi
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
  # t10 = m + 1
    movq -32(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -136(%rbp)
  # m = t10
    movq -136(%rbp), %rax
    movq %rax, -32(%rbp)
  # jump label _beginWhileSimpleMap_main0
    jmp _beginWhileSimpleMap_main0
  # label _endWhileSimpleMap_main0
_endWhileSimpleMap_main0:
__method_SimpleMap.main_epilogue:
    addq $144, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: SimpleMap
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store SimpleMap's vtable pointer in new object instance.
    leaq __SimpleMap_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for SimpleMap.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call SimpleMap.main
    callq __method_SimpleMap.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
