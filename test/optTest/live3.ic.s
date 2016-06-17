  # Compiled by icc from test/optTest/live3.ic
  # At Sun May 15 17:17:17 EDT 2016

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

  # vtable for class LiveThenDead
    .align 8
__LiveThenDead_vtable:
    .quad __method_LiveThenDead.main

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

__method_LiveThenDead.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: x = 0
  # DCE: Removed dead code: x = 0
  # ### DCE: Removed dead code: t0 = 1
  # DCE: Removed dead code: t0 = 1
  # ### DCE: Removed dead code: y = t0
  # DCE: Removed dead code: y = t0
  # Zero check: 6 != 0
    movq $6, %rax
    testq %rax, %rax
    je __ic_error_handler_div
  # ### DCE: Removed dead code: t1 = 0
  # DCE: Removed dead code: t1 = 0
  # ### DCE: Removed dead code: x = t1
  # DCE: Removed dead code: x = t1
  # ### DCE: Removed dead code: t2 = 2
  # DCE: Removed dead code: t2 = 2
  # ### DCE: Removed dead code: z = t2
  # DCE: Removed dead code: z = t2
  # ### DCE: Removed dead code: t3 = t0 + 1			#CPP: Replaced t3 = y + 1
  # DCE: Removed dead code: t3 = t0 + 1			#CPP: Replaced t3 = y + 1
  # ### DCE: Removed dead code: y = t3
  # DCE: Removed dead code: y = t3
  # call Library.printi(2)
    movq $2, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # ### DCE: Removed dead code: z = 5
  # DCE: Removed dead code: z = 5
__method_LiveThenDead.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: LiveThenDead
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store LiveThenDead's vtable pointer in new object instance.
    leaq __LiveThenDead_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for LiveThenDead.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call LiveThenDead.main
    callq __method_LiveThenDead.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
