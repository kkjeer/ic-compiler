  # Compiled by icc from /Users/KKjeer/workspace/ic-compiler/icc/test/codegen-basic/runtime-checks-8.ic
  # At Fri May 13 14:27:59 EDT 2016

.data
  # string literals
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

  # vtable for class Main
    .align 8
__Main_vtable:
    .quad __method_Main.main

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

__method_Main.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # x = Null
    movq $0, %rax
    movq %rax, -16(%rbp)
  # Null check: x != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 1 < x.length
    movq $1, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -16(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # x[1] = 1
    movq -16(%rbp), %rax
    movq $1, %r10
    movq $1, %r11
    movq %r11, (%rax,%r10,8)
__method_Main.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: Main
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store Main's vtable pointer in new object instance.
    leaq __Main_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for Main.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call Main.main
    callq __method_Main.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
