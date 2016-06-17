  # Compiled by icc from test/optTest/live9.ic
  # At Sun May 15 17:17:59 EDT 2016

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

  # vtable for class LiveWhile
    .align 8
__LiveWhile_vtable:
    .quad __method_LiveWhile.main

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

__method_LiveWhile.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: condition = true
  # DCE: Removed dead code: condition = true
  # ### DCE: Removed dead code: x = 0
  # DCE: Removed dead code: x = 0
  # label _beginWhileLiveWhile_main0
_beginWhileLiveWhile_main0:
  # ### DCE: Removed dead code: t0 = condition			#condition for while loop on line 5
  # DCE: Removed dead code: t0 = condition			#condition for while loop on line 5
  # ### DCE: Removed dead code: t1 = false
  # DCE: Removed dead code: t1 = false
  # cjump false label _endWhileLiveWhile_main0
    movq $0, %rax
    testq %rax, %rax
    jnz _endWhileLiveWhile_main0
  # ### DCE: Removed dead code: x = 3
  # DCE: Removed dead code: x = 3
  # jump label _beginWhileLiveWhile_main0
    jmp _beginWhileLiveWhile_main0
  # label _endWhileLiveWhile_main0
_endWhileLiveWhile_main0:
__method_LiveWhile.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: LiveWhile
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store LiveWhile's vtable pointer in new object instance.
    leaq __LiveWhile_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for LiveWhile.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call LiveWhile.main
    callq __method_LiveWhile.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
