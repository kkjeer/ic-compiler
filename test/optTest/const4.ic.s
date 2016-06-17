  # Compiled by icc from test/optTest/const4.ic
  # At Sun May 15 17:19:46 EDT 2016

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

  # vtable for class ConstFoldIf
    .align 8
__ConstFoldIf_vtable:
    .quad __method_ConstFoldIf.main

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

__method_ConstFoldIf.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # t0 = true
    movq $1, %rax
    movq %rax, -32(%rbp)
  # cjump true label _endOrConstFoldIf_main0
    movq $1, %rax
    testq %rax, %rax
    jnz _endOrConstFoldIf_main0
  # t0 = false
    movq $0, %rax
    movq %rax, -32(%rbp)
  # label _endOrConstFoldIf_main0
_endOrConstFoldIf_main0:
  # ### DCE: Removed dead code: condition = t0
  # DCE: Removed dead code: condition = t0
  # ### DCE: Removed dead code: t1 = condition			#condition for if on line 5
  # DCE: Removed dead code: t1 = condition			#condition for if on line 5
  # t2 = !t0
    movq -32(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -48(%rbp)
  # cjump t2 label _elseConstFoldIf_main0
    movq -48(%rbp), %rax
    testq %rax, %rax
    jnz _elseConstFoldIf_main0
  # ### DCE: Removed dead code: t3 = 3
  # DCE: Removed dead code: t3 = 3
  # ### DCE: Removed dead code: x = 3
  # DCE: Removed dead code: x = 3
  # jump label _endIfConstFoldIf_main0
    jmp _endIfConstFoldIf_main0
  # label _elseConstFoldIf_main0
_elseConstFoldIf_main0:
  # ### DCE: Removed dead code: t4 = 3
  # DCE: Removed dead code: t4 = 3
  # ### DCE: Removed dead code: x = 3
  # DCE: Removed dead code: x = 3
  # label _endIfConstFoldIf_main0
_endIfConstFoldIf_main0:
  # call Library.printi(3)
    movq $3, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
__method_ConstFoldIf.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: ConstFoldIf
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store ConstFoldIf's vtable pointer in new object instance.
    leaq __ConstFoldIf_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for ConstFoldIf.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call ConstFoldIf.main
    callq __method_ConstFoldIf.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
