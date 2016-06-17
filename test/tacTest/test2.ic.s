  # Compiled by icc from test/tacTest/test2.ic
  # At Fri May 13 16:29:44 EDT 2016

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

  # vtable for class BasicArithmetic
    .align 8
__BasicArithmetic_vtable:
    .quad __method_BasicArithmetic.main

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

__method_BasicArithmetic.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $64, %rsp
  # BasicArithmetic_mainTEMP_0 = 1 + 2
    movq $1, %rax
    movq $2, %r10
    addq %rax, %r10
    movq %r10, -48(%rbp)
  # x = BasicArithmetic_mainTEMP_0
    movq -48(%rbp), %rax
    movq %rax, -16(%rbp)
  # BasicArithmetic_mainTEMP_1 = 4 - 3
    movq $4, %rax
    movq $3, %r10
    subq %r10, %rax
    movq %rax, -56(%rbp)
  # y = BasicArithmetic_mainTEMP_1
    movq -56(%rbp), %rax
    movq %rax, -24(%rbp)
  # BasicArithmetic_mainTEMP_2 = 5 * 6
    movq $5, %rax
    movq $6, %r10
    imulq %rax, %r10
    movq %r10, -64(%rbp)
  # z = BasicArithmetic_mainTEMP_2
    movq -64(%rbp), %rax
    movq %rax, -32(%rbp)
  # call Library.printi(z)
    movq -32(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
__method_BasicArithmetic.main_epilogue:
    addq $64, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: BasicArithmetic
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store BasicArithmetic's vtable pointer in new object instance.
    leaq __BasicArithmetic_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for BasicArithmetic.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call BasicArithmetic.main
    callq __method_BasicArithmetic.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
