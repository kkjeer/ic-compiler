  # Compiled by icc from /Users/KKjeer/workspace/ic-compiler/icc/test/codegen-basic/stmts-3.ic
  # At Fri May 13 14:28:04 EDT 2016

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

  # vtable for class Test
    .align 8
__Test_vtable:
    .quad __method_Test.main

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

__method_Test.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # t1 = 2 < 1
    movq $2, %rax
    movq $1, %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -32(%rbp)
  # t0 = t1			#condition for if on line 4
    movq -32(%rbp), %rax
    movq %rax, -24(%rbp)
  # t2 = !t1
    movq -32(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -40(%rbp)
  # cjump t2 label _else0
    movq -40(%rbp), %rax
    testq %rax, %rax
    jnz _else0
  # call Library.printi(1)
    movq $1, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # jump label _endIf0
    jmp _endIf0
  # label _else0
_else0:
  # call Library.printi(2)
    movq $2, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # label _endIf0
_endIf0:
__method_Test.main_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: Test
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store Test's vtable pointer in new object instance.
    leaq __Test_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for Test.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call Test.main
    callq __method_Test.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
