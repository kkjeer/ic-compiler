  # Compiled by icc from test/optTest/avail3.ic
  # At Sun May 15 17:18:52 EDT 2016

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

  # vtable for class AvailSimpleArrayLoad
    .align 8
__AvailSimpleArrayLoad_vtable:
    .quad __method_AvailSimpleArrayLoad.main

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

__method_AvailSimpleArrayLoad.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # Size check: 3 >= 0			
    movq $3, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [3]
    movq $3, %rdi
    callq __LIB_allocateArray
    movq %rax, -40(%rbp)
  # ### DCE: Removed dead code: a = t0
  # DCE: Removed dead code: a = t0
  # Null check: t0 != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < t0.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -40(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # ### DCE: Removed dead code: t1 = t0[0]
  # DCE: Removed dead code: t1 = t0[0]
  # ### DCE: Removed dead code: x = t1
  # DCE: Removed dead code: x = t1
  # ### CSE: Eliminated Null check: a != Null
  # CSE: Eliminated Null check: a != Null
  # ### CSE: Eliminated Bounds check:  0 <= 0 < a.length
  # CSE: Eliminated Bounds check:  0 <= 0 < a.length
  # ### DCE: Removed dead code: t2 = t1
  # DCE: Removed dead code: t2 = t1
  # ### DCE: Removed dead code: y = t2
  # DCE: Removed dead code: y = t2
__method_AvailSimpleArrayLoad.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: AvailSimpleArrayLoad
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store AvailSimpleArrayLoad's vtable pointer in new object instance.
    leaq __AvailSimpleArrayLoad_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for AvailSimpleArrayLoad.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call AvailSimpleArrayLoad.main
    callq __method_AvailSimpleArrayLoad.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
