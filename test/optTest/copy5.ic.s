  # Compiled by icc from test/optTest/copy5.ic
  # At Sun May 15 17:20:24 EDT 2016

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

  # vtable for class CopyWhile
    .align 8
__CopyWhile_vtable:
    .quad __method_CopyWhile.main

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

__method_CopyWhile.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # label _beginWhileCopyWhile_main0
_beginWhileCopyWhile_main0:
  # t1 = i < 3
    movq -8(%rbp), %rax
    movq $3, %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -48(%rbp)
  # ### DCE: Removed dead code: t0 = t1			#condition for while loop on line 4
  # DCE: Removed dead code: t0 = t1			#condition for while loop on line 4
  # t2 = !t1
    movq -48(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -56(%rbp)
  # cjump t2 label _endWhileCopyWhile_main0
    movq -56(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileCopyWhile_main0
  # x = 2
    movq $2, %rax
    movq %rax, -16(%rbp)
  # t3 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -64(%rbp)
  # i = t3
    movq -64(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileCopyWhile_main0
    jmp _beginWhileCopyWhile_main0
  # label _endWhileCopyWhile_main0
_endWhileCopyWhile_main0:
  # t4 = x * 3
    movq -16(%rbp), %rax
    movq $3, %r10
    imulq %rax, %r10
    movq %r10, -72(%rbp)
  # ### DCE: Removed dead code: y = t4
  # DCE: Removed dead code: y = t4
  # call Library.printi(t4)
    movq -72(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
__method_CopyWhile.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: CopyWhile
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store CopyWhile's vtable pointer in new object instance.
    leaq __CopyWhile_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for CopyWhile.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call CopyWhile.main
    callq __method_CopyWhile.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
