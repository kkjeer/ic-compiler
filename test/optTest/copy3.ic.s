  # Compiled by icc from test/optTest/copy3.ic
  # At Sun May 15 17:20:12 EDT 2016

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

  # vtable for class CopyIf
    .align 8
__CopyIf_vtable:
    .quad __method_CopyIf.main

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

__method_CopyIf.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: x = 2
  # DCE: Removed dead code: x = 2
  # ### DCE: Removed dead code: t1 = true
  # DCE: Removed dead code: t1 = true
  # ### DCE: Removed dead code: t0 = t1			#condition for if on line 6
  # DCE: Removed dead code: t0 = t1			#condition for if on line 6
  # ### DCE: Removed dead code: t2 = false
  # DCE: Removed dead code: t2 = false
  # cjump false label _elseCopyIf_main0
    movq $0, %rax
    testq %rax, %rax
    jnz _elseCopyIf_main0
  # y = 0
    movq $0, %rax
    movq %rax, -16(%rbp)
  # jump label _endIfCopyIf_main0
    jmp _endIfCopyIf_main0
  # label _elseCopyIf_main0
_elseCopyIf_main0:
  # y = 1
    movq $1, %rax
    movq %rax, -16(%rbp)
  # label _endIfCopyIf_main0
_endIfCopyIf_main0:
  # t3 = y + 1
    movq -16(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -64(%rbp)
  # ### DCE: Removed dead code: z = t3
  # DCE: Removed dead code: z = t3
  # call Library.printi(t3)
    movq -64(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
__method_CopyIf.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: CopyIf
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store CopyIf's vtable pointer in new object instance.
    leaq __CopyIf_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for CopyIf.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call CopyIf.main
    callq __method_CopyIf.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
