  # Compiled by icc from test/optTest/avail5.ic
  # At Sun May 15 17:19:03 EDT 2016

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

  # vtable for class AvailArrayLength
    .align 8
__AvailArrayLength_vtable:
    .quad __method_AvailArrayLength.main

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

__method_AvailArrayLength.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # Size check: 6 >= 0			
    movq $6, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [6]
    movq $6, %rdi
    callq __LIB_allocateArray
    movq %rax, -48(%rbp)
  # ### DCE: Removed dead code: a = t0
  # DCE: Removed dead code: a = t0
  # Null check: t0 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # ### DCE: Removed dead code: t1= t0.length
  # DCE: Removed dead code: t1= t0.length
  # ### DCE: Removed dead code: x = t1
  # DCE: Removed dead code: x = t1
  # ### CSE: Eliminated Null check: a != Null
  # CSE: Eliminated Null check: a != Null
  # ### DCE: Removed dead code: t2 = t1
  # DCE: Removed dead code: t2 = t1
  # ### DCE: Removed dead code: y = t2
  # DCE: Removed dead code: y = t2
  # ### CSE: Eliminated Null check: a != Null
  # CSE: Eliminated Null check: a != Null
  # Bounds check:  0 <= 2 < t0.length
    movq $2, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -48(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t0[2] = 25
    movq -48(%rbp), %rax
    movq $2, %r10
    movq $25, %r11
    movq %r11, (%rax,%r10,8)
  # Null check: t0 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # ### DCE: Removed dead code: t3= t0.length			#CPP: Replaced t3= a.length
  # DCE: Removed dead code: t3= t0.length			#CPP: Replaced t3= a.length
  # ### DCE: Removed dead code: z = t3
  # DCE: Removed dead code: z = t3
__method_AvailArrayLength.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: AvailArrayLength
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store AvailArrayLength's vtable pointer in new object instance.
    leaq __AvailArrayLength_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for AvailArrayLength.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call AvailArrayLength.main
    callq __method_AvailArrayLength.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
