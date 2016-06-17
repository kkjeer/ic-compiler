  # Compiled by icc from test/projectTest/test16.ic
  # At Sun May 15 10:58:08 EDT 2016

.data
  # string literals
    .align 8
    .quad 26
__ic_string_lit_0:
    .ascii"Project test 16: MapMethod"

    .align 8
    .quad 11
__ic_string_lit_1:
    .ascii"mapped[0]: "

    .align 8
    .quad 0
__ic_string_lit_2:
    .ascii""

    .align 8
    .quad 11
__ic_string_lit_3:
    .ascii"mapped[1]: "

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

  # vtable for class PARAMS__int__RETURN__int_Template
    .align 8
__PARAMS__int__RETURN__int_Template_vtable:
    .quad __method_PARAMS__int__RETURN__int_Template.call
  # vtable for class MapMethod_main_anon0_Closure
    .align 8
__MapMethod_main_anon0_Closure_vtable:
    .quad __method_MapMethod_main_anon0_Closure.call
    .quad __method_MapMethod_main_anon0_Closure.create
  # vtable for class MapMethod
    .align 8
__MapMethod_vtable:
    .quad __method_MapMethod.main
    .quad __method_MapMethod.map

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

__method_MapMethod_main_anon0_Closure.create:
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
  # t1.mapped = mapped
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
  # t3.ints = ints
    movq -40(%rbp), %r10
    movq 48(%rbp), %rax
    movq %rax, 24(%r10)
  # t4 = this
    movq 16(%rbp), %rax
    movq %rax, -48(%rbp)
  # return t4
    movq -48(%rbp), %rax
    jmp __method_MapMethod_main_anon0_Closure.create_epilogue
__method_MapMethod_main_anon0_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_MapMethod_main_anon0_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # t0 = i + 1
    movq 24(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_MapMethod_main_anon0_Closure.call_epilogue
__method_MapMethod_main_anon0_Closure.call_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_MapMethod.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $80, %rsp
  # Size check: 2 >= 0			
    movq $2, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [2]
    movq $2, %rdi
    callq __LIB_allocateArray
    movq %rax, -40(%rbp)
  # ints = t0
    movq -40(%rbp), %rax
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
  # ints[0] = 0
    movq -24(%rbp), %rax
    movq $0, %r10
    movq $0, %r11
    movq %r11, (%rax,%r10,8)
  # Null check: ints != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 1 < ints.length
    movq $1, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # ints[1] = 1
    movq -24(%rbp), %rax
    movq $1, %r10
    movq $1, %r11
    movq %r11, (%rax,%r10,8)
  # t2 = new MapMethod_main_anon0_Closure()
    movq $40, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapMethod_main_anon0_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -56(%rbp)
  # Null check: t2 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1 = call t2.create(args, mapped, f, ints)
    subq $8, %rsp
    movq -24(%rbp), %rax
    pushq %rax
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
    addq $48, %rsp
    movq %rax, -48(%rbp)
  # f = t1
    movq -48(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = call this.map(ints, f)
    subq $8, %rsp
    movq -16(%rbp), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -64(%rbp)
  # mapped = t3
    movq -64(%rbp), %rax
    movq %rax, -8(%rbp)
  # call Library.println("Project test 16: MapMethod")
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # call Library.print("mapped[0]: ")
    leaq __ic_string_lit_1(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: mapped != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < mapped.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t4 = mapped[0]
    movq -8(%rbp), %rax
    movq $0, %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -72(%rbp)
  # call Library.printi(t4)
    movq -72(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_2(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # call Library.print("mapped[1]: ")
    leaq __ic_string_lit_3(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: mapped != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 1 < mapped.length
    movq $1, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t5 = mapped[1]
    movq -8(%rbp), %rax
    movq $1, %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -80(%rbp)
  # call Library.printi(t5)
    movq -80(%rbp), %rdi
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
__method_MapMethod.main_epilogue:
    addq $80, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: MapMethod
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store MapMethod's vtable pointer in new object instance.
    leaq __MapMethod_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for MapMethod.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call MapMethod.main
    callq __method_MapMethod.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret

__method_MapMethod.map:
    pushq %rbp
    movq %rsp, %rbp
    subq $80, %rsp
  # Size check: 2 >= 0			
    movq $2, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [2]
    movq $2, %rdi
    callq __LIB_allocateArray
    movq %rax, -40(%rbp)
  # result = t0
    movq -40(%rbp), %rax
    movq %rax, -8(%rbp)
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < arr.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t2 = arr[0]
    movq 24(%rbp), %rax
    movq $0, %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -56(%rbp)
  # Null check: fcn != Null
    movq 32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1 = call fcn.call(t2)
    movq -56(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -48(%rbp)
  # i = t1
    movq -48(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 1 < arr.length
    movq $1, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t4 = arr[1]
    movq 24(%rbp), %rax
    movq $1, %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -72(%rbp)
  # Null check: fcn != Null
    movq 32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = call fcn.call(t4)
    movq -72(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -64(%rbp)
  # j = t3
    movq -64(%rbp), %rax
    movq %rax, -24(%rbp)
  # Null check: result != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < result.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # result[0] = i
    movq -8(%rbp), %rax
    movq $0, %r10
    movq -16(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # Null check: result != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 1 < result.length
    movq $1, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # result[1] = j
    movq -8(%rbp), %rax
    movq $1, %r10
    movq -24(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # return result
    movq -8(%rbp), %rax
    jmp __method_MapMethod.map_epilogue
__method_MapMethod.map_epilogue:
    addq $80, %rsp
    popq %rbp
    retq
