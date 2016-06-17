  # Compiled by icc from test/optTest/const1.ic
  # At Sun May 15 17:19:27 EDT 2016

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

  # vtable for class ConstFoldSimpleInts
    .align 8
__ConstFoldSimpleInts_vtable:
    .quad __method_ConstFoldSimpleInts.main

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

__method_ConstFoldSimpleInts.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: t0 = -1
  # DCE: Removed dead code: t0 = -1
  # ### DCE: Removed dead code: a = t0
  # DCE: Removed dead code: a = t0
  # ### DCE: Removed dead code: t1 = 9
  # DCE: Removed dead code: t1 = 9
  # ### DCE: Removed dead code: b = t1
  # DCE: Removed dead code: b = t1
  # ### DCE: Removed dead code: t2 = 1
  # DCE: Removed dead code: t2 = 1
  # ### DCE: Removed dead code: c = t2
  # DCE: Removed dead code: c = t2
  # ### DCE: Removed dead code: t3 = 32
  # DCE: Removed dead code: t3 = 32
  # ### DCE: Removed dead code: d = t3
  # DCE: Removed dead code: d = t3
  # Zero check: 2 != 0
    movq $2, %rax
    testq %rax, %rax
    je __ic_error_handler_div
  # ### DCE: Removed dead code: t4 = 2
  # DCE: Removed dead code: t4 = 2
  # ### DCE: Removed dead code: e = t4
  # DCE: Removed dead code: e = t4
  # Zero check: 5 != 0
    movq $5, %rax
    testq %rax, %rax
    je __ic_error_handler_div
  # ### DCE: Removed dead code: t5 = 3
  # DCE: Removed dead code: t5 = 3
  # ### DCE: Removed dead code: f = t5
  # DCE: Removed dead code: f = t5
__method_ConstFoldSimpleInts.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: ConstFoldSimpleInts
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store ConstFoldSimpleInts's vtable pointer in new object instance.
    leaq __ConstFoldSimpleInts_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for ConstFoldSimpleInts.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call ConstFoldSimpleInts.main
    callq __method_ConstFoldSimpleInts.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
