  # Compiled by icc from test/optTest/copy2.ic
  # At Sun May 15 17:20:06 EDT 2016

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

  # vtable for class CopyArrays
    .align 8
__CopyArrays_vtable:
    .quad __method_CopyArrays.main

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

__method_CopyArrays.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: x = 7
  # DCE: Removed dead code: x = 7
  # Size check: 7 >= 0			
    movq $7, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [7]
    movq $7, %rdi
    callq __LIB_allocateArray
    movq %rax, -56(%rbp)
  # ### DCE: Removed dead code: a = t0
  # DCE: Removed dead code: a = t0
  # ### DCE: Removed dead code: y = 5
  # DCE: Removed dead code: y = 5
  # ### DCE: Removed dead code: z = 2
  # DCE: Removed dead code: z = 2
  # Null check: t0 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 5 < t0.length
    movq $5, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -56(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t0[5] = 2
    movq -56(%rbp), %rax
    movq $5, %r10
    movq $2, %r11
    movq %r11, (%rax,%r10,8)
  # Null check: t0 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1= t0.length
    movq -56(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -64(%rbp)
  # ### DCE: Removed dead code: w = t1
  # DCE: Removed dead code: w = t1
  # ### CSE: Eliminated Null check: a != Null
  # CSE: Eliminated Null check: a != Null
  # Bounds check:  0 <= 3 < t0.length
    movq $3, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -56(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t2 = t0[3]
    movq -56(%rbp), %rax
    movq $3, %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -72(%rbp)
  # ### DCE: Removed dead code: z = t2
  # DCE: Removed dead code: z = t2
  # call Library.printi(t1)
    movq -64(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.printi(t2)
    movq -72(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
__method_CopyArrays.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: CopyArrays
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store CopyArrays's vtable pointer in new object instance.
    leaq __CopyArrays_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for CopyArrays.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call CopyArrays.main
    callq __method_CopyArrays.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
