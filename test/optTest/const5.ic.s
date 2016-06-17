  # Compiled by icc from test/optTest/const5.ic
  # At Sun May 15 17:19:52 EDT 2016

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

  # vtable for class ComplicatedConstants
    .align 8
__ComplicatedConstants_vtable:
    .quad __method_ComplicatedConstants.main

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

__method_ComplicatedConstants.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: t1 = 3
  # DCE: Removed dead code: t1 = 3
  # Zero check: 7 != 0
    movq $7, %rax
    testq %rax, %rax
    je __ic_error_handler_div
  # Zero check: 6 != 0
    movq $6, %rax
    testq %rax, %rax
    je __ic_error_handler_div
  # ### DCE: Removed dead code: t4 = 0
  # DCE: Removed dead code: t4 = 0
  # ### DCE: Removed dead code: t3 = 0
  # DCE: Removed dead code: t3 = 0
  # ### DCE: Removed dead code: t2 = 0 % 7			#CPP: Replaced t2 = t3 % 7
  # DCE: Removed dead code: t2 = 0 % 7			#CPP: Replaced t2 = t3 % 7
  # ### DCE: Removed dead code: t0 = 3 - t2			#CPP: Replaced t0 = t1 - t2
  # DCE: Removed dead code: t0 = 3 - t2			#CPP: Replaced t0 = t1 - t2
  # ### DCE: Removed dead code: x = t0
  # DCE: Removed dead code: x = t0
  # ### DCE: Removed dead code: t7 = true
  # DCE: Removed dead code: t7 = true
  # t6 = true
    movq $1, %rax
    movq %rax, -80(%rbp)
  # cjump true label _endOrComplicatedConstants_main0
    movq $1, %rax
    testq %rax, %rax
    jnz _endOrComplicatedConstants_main0
  # ### DCE: Removed dead code: t9 = 16
  # DCE: Removed dead code: t9 = 16
  # ### DCE: Removed dead code: t8 = false
  # DCE: Removed dead code: t8 = false
  # t6 = false
    movq $0, %rax
    movq %rax, -80(%rbp)
  # label _endOrComplicatedConstants_main0
_endOrComplicatedConstants_main0:
  # ### DCE: Removed dead code: t5 = t6
  # DCE: Removed dead code: t5 = t6
  # t10 = !t6
    movq -80(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -112(%rbp)
  # cjump t10 label _endAndComplicatedConstants_main0
    movq -112(%rbp), %rax
    testq %rax, %rax
    jnz _endAndComplicatedConstants_main0
  # ### DCE: Removed dead code: t12 = false
  # DCE: Removed dead code: t12 = false
  # ### DCE: Removed dead code: t11 = true
  # DCE: Removed dead code: t11 = true
  # ### DCE: Removed dead code: t5 = t11
  # DCE: Removed dead code: t5 = t11
  # label _endAndComplicatedConstants_main0
_endAndComplicatedConstants_main0:
  # ### DCE: Removed dead code: b = t5
  # DCE: Removed dead code: b = t5
__method_ComplicatedConstants.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: ComplicatedConstants
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store ComplicatedConstants's vtable pointer in new object instance.
    leaq __ComplicatedConstants_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for ComplicatedConstants.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call ComplicatedConstants.main
    callq __method_ComplicatedConstants.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
