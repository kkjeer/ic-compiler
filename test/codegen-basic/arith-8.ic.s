  # Compiled by icc from /Users/KKjeer/workspace/ic-compiler/icc/test/codegen-basic/arith-8.ic
  # At Fri May 13 14:27:08 EDT 2016

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
    subq $32, %rsp
  # t1 = -100
    movq $100, %rax
    negq %rax
    movq %rax, -32(%rbp)
  # t0 = -t1
    movq -32(%rbp), %rax
    negq %rax
    movq %rax, -24(%rbp)
  # call Library.printi(t0)
    movq -24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
__method_Main.main_epilogue:
    addq $32, %rsp
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
