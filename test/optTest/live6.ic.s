  # Compiled by icc from test/optTest/live6.ic
  # At Sun May 15 17:17:38 EDT 2016

.data
  # string literals
    .align 8
    .quad 4
__ic_string_lit_0:
    .ascii"Live"

    .align 8
    .quad 4
__ic_string_lit_1:
    .ascii"Dead"

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

  # vtable for class LiveWithBinExprs
    .align 8
__LiveWithBinExprs_vtable:
    .quad __method_LiveWithBinExprs.main

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

__method_LiveWithBinExprs.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: x = 5
  # DCE: Removed dead code: x = 5
  # ### DCE: Removed dead code: t0 = 15
  # DCE: Removed dead code: t0 = 15
  # ### DCE: Removed dead code: y = t0
  # DCE: Removed dead code: y = t0
  # ### DCE: Removed dead code: t2 = 5 - 15			#CPP: Replaced t2 = 5 - t0			#CPP: Replaced t2 = x - y
  # DCE: Removed dead code: t2 = 5 - 15			#CPP: Replaced t2 = 5 - t0			#CPP: Replaced t2 = x - y
  # ### DCE: Removed dead code: t3 = 12
  # DCE: Removed dead code: t3 = 12
  # ### DCE: Removed dead code: t1 = t2 + 12			#CPP: Replaced t1 = t2 + t3
  # DCE: Removed dead code: t1 = t2 + 12			#CPP: Replaced t1 = t2 + t3
  # ### DCE: Removed dead code: z = t1
  # DCE: Removed dead code: z = t1
  # ### DCE: Removed dead code: s1 = "Live"
  # DCE: Removed dead code: s1 = "Live"
  # t4 = call Library.stringCat("Live", "Dead")
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    leaq __ic_string_lit_1(%rip), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -88(%rbp)
  # ### DCE: Removed dead code: s2 = t4
  # DCE: Removed dead code: s2 = t4
  # ### DCE: Removed dead code: t5 = 20
  # DCE: Removed dead code: t5 = 20
  # call Library.printi(20)
    movq $20, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.println("Live")
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_LiveWithBinExprs.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: LiveWithBinExprs
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store LiveWithBinExprs's vtable pointer in new object instance.
    leaq __LiveWithBinExprs_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for LiveWithBinExprs.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call LiveWithBinExprs.main
    callq __method_LiveWithBinExprs.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
