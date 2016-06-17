  # Compiled by icc from test/optTest/live8.ic
  # At Sun May 15 17:17:52 EDT 2016

.data
  # string literals
    .align 8
    .quad 3
__ic_string_lit_0:
    .ascii"Yes"

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

  # vtable for class LiveIf
    .align 8
__LiveIf_vtable:
    .quad __method_LiveIf.main

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

__method_LiveIf.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: test = true
  # DCE: Removed dead code: test = true
  # ### DCE: Removed dead code: dead = false
  # DCE: Removed dead code: dead = false
  # ### DCE: Removed dead code: t0 = test			#condition for if on line 5
  # DCE: Removed dead code: t0 = test			#condition for if on line 5
  # ### DCE: Removed dead code: t1 = false
  # DCE: Removed dead code: t1 = false
  # cjump false label _elseLiveIf_main0
    movq $0, %rax
    testq %rax, %rax
    jnz _elseLiveIf_main0
  # call Library.println("Yes")
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # jump label _endIfLiveIf_main0
    jmp _endIfLiveIf_main0
  # label _elseLiveIf_main0
_elseLiveIf_main0:
  # ### DCE: Removed dead code: t2 = !false			#CPP: Replaced t2 = !dead
  # DCE: Removed dead code: t2 = !false			#CPP: Replaced t2 = !dead
  # ### DCE: Removed dead code: dead = t2
  # DCE: Removed dead code: dead = t2
  # label _endIfLiveIf_main0
_endIfLiveIf_main0:
__method_LiveIf.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: LiveIf
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store LiveIf's vtable pointer in new object instance.
    leaq __LiveIf_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for LiveIf.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call LiveIf.main
    callq __method_LiveIf.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
