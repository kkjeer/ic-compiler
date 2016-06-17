  # Compiled by icc from test/optTest/live4.ic
  # At Sun May 15 17:17:24 EDT 2016

.data
  # string literals
    .align 8
    .quad 5
__ic_string_lit_0:
    .ascii"Hello"

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

  # vtable for class LiveWithArrays
    .align 8
__LiveWithArrays_vtable:
    .quad __method_LiveWithArrays.main

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

__method_LiveWithArrays.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # Size check: 5 >= 0			
    movq $5, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [5]
    movq $5, %rdi
    callq __LIB_allocateArray
    movq %rax, -48(%rbp)
  # ### DCE: Removed dead code: a1 = t0
  # DCE: Removed dead code: a1 = t0
  # ### DCE: Removed dead code: x = 10
  # DCE: Removed dead code: x = 10
  # Size check: 10 >= 0			
    movq $10, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t1 = new [10]
    movq $10, %rdi
    callq __LIB_allocateArray
    movq %rax, -56(%rbp)
  # ### DCE: Removed dead code: a2 = t1
  # DCE: Removed dead code: a2 = t1
  # Null check: t1 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2= t1.length
    movq -56(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -64(%rbp)
  # Null check: t0 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < t0.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -48(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t0[0] = t2
    movq -48(%rbp), %rax
    movq $0, %r10
    movq -64(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # ### CSE: Eliminated Null check: a2 != Null
  # CSE: Eliminated Null check: a2 != Null
  # Bounds check:  0 <= 4 < t1.length
    movq $4, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -56(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t1[4] = "Hello"
    movq -56(%rbp), %rax
    movq $4, %r10
    leaq __ic_string_lit_0(%rip), %r11
    movq %r11, (%rax,%r10,8)
  # Size check: 3 >= 0			
    movq $3, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # ### DCE: Removed dead code: t3 = new [3]
  # DCE: Removed dead code: t3 = new [3]
  # ### DCE: Removed dead code: a3 = t3
  # DCE: Removed dead code: a3 = t3
__method_LiveWithArrays.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: LiveWithArrays
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store LiveWithArrays's vtable pointer in new object instance.
    leaq __LiveWithArrays_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for LiveWithArrays.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call LiveWithArrays.main
    callq __method_LiveWithArrays.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
