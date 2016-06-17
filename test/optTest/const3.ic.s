  # Compiled by icc from test/optTest/const3.ic
  # At Sun May 15 17:19:39 EDT 2016

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

  # vtable for class ConstFoldSimpleBools
    .align 8
__ConstFoldSimpleBools_vtable:
    .quad __method_ConstFoldSimpleBools.main

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

__method_ConstFoldSimpleBools.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: t0 = false
  # DCE: Removed dead code: t0 = false
  # ### DCE: Removed dead code: a = t0
  # DCE: Removed dead code: a = t0
  # ### DCE: Removed dead code: t1 = true
  # DCE: Removed dead code: t1 = true
  # ### DCE: Removed dead code: t2 = false
  # DCE: Removed dead code: t2 = false
  # cjump false label _endAndConstFoldSimpleBools_main0
    movq $0, %rax
    testq %rax, %rax
    jnz _endAndConstFoldSimpleBools_main0
  # ### DCE: Removed dead code: t1 = false
  # DCE: Removed dead code: t1 = false
  # label _endAndConstFoldSimpleBools_main0
_endAndConstFoldSimpleBools_main0:
  # ### DCE: Removed dead code: b = t1
  # DCE: Removed dead code: b = t1
  # ### DCE: Removed dead code: t3 = false
  # DCE: Removed dead code: t3 = false
  # cjump false label _endOrConstFoldSimpleBools_main0
    movq $0, %rax
    testq %rax, %rax
    jnz _endOrConstFoldSimpleBools_main0
  # ### DCE: Removed dead code: t3 = true
  # DCE: Removed dead code: t3 = true
  # label _endOrConstFoldSimpleBools_main0
_endOrConstFoldSimpleBools_main0:
  # ### DCE: Removed dead code: c = t3
  # DCE: Removed dead code: c = t3
__method_ConstFoldSimpleBools.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: ConstFoldSimpleBools
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store ConstFoldSimpleBools's vtable pointer in new object instance.
    leaq __ConstFoldSimpleBools_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for ConstFoldSimpleBools.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call ConstFoldSimpleBools.main
    callq __method_ConstFoldSimpleBools.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
