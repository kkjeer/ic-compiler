  # Compiled by icc from test/optTest/live7.ic
  # At Sun May 15 17:17:45 EDT 2016

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

  # vtable for class LiveWithBooleans
    .align 8
__LiveWithBooleans_vtable:
    .quad __method_LiveWithBooleans.main

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

__method_LiveWithBooleans.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: a = true
  # DCE: Removed dead code: a = true
  # t0 = true
    movq $1, %rax
    movq %rax, -40(%rbp)
  # cjump true label _endOrLiveWithBooleans_main0
    movq $1, %rax
    testq %rax, %rax
    jnz _endOrLiveWithBooleans_main0
  # t0 = false
    movq $0, %rax
    movq %rax, -40(%rbp)
  # label _endOrLiveWithBooleans_main0
_endOrLiveWithBooleans_main0:
  # ### DCE: Removed dead code: b = t0
  # DCE: Removed dead code: b = t0
  # ### DCE: Removed dead code: t1 = true			#CPP: Replaced t1 = a
  # DCE: Removed dead code: t1 = true			#CPP: Replaced t1 = a
  # ### DCE: Removed dead code: t2 = false
  # DCE: Removed dead code: t2 = false
  # cjump false label _endAndLiveWithBooleans_main0
    movq $0, %rax
    testq %rax, %rax
    jnz _endAndLiveWithBooleans_main0
  # ### DCE: Removed dead code: t1 = t0			#CPP: Replaced t1 = b
  # DCE: Removed dead code: t1 = t0			#CPP: Replaced t1 = b
  # label _endAndLiveWithBooleans_main0
_endAndLiveWithBooleans_main0:
  # ### DCE: Removed dead code: c = t1
  # DCE: Removed dead code: c = t1
  # call Library.printb(true)
    movq $1, %rdi
    subq $8, %rsp
    callq __LIB_printb
    addq $8, %rsp
  # call Library.printb(t0)
    movq -40(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printb
    addq $8, %rsp
__method_LiveWithBooleans.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: LiveWithBooleans
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store LiveWithBooleans's vtable pointer in new object instance.
    leaq __LiveWithBooleans_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for LiveWithBooleans.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call LiveWithBooleans.main
    callq __method_LiveWithBooleans.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
