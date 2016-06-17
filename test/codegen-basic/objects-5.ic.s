  # Compiled by icc from /Users/KKjeer/workspace/ic-compiler/icc/test/codegen-basic/objects-5.ic
  # At Fri May 13 14:27:47 EDT 2016

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

  # vtable for class Super
    .align 8
__Super_vtable:
    .quad __method_Super.f
  # vtable for class Test
    .align 8
__Test_vtable:
    .quad __method_Super.f
    .quad __method_Test.g
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

__method_Super.f:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # t0 = -99
    movq $99, %rax
    negq %rax
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_Super.f_epilogue
__method_Super.f_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_Test.g:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return 11
    movq $11, %rax
    jmp __method_Test.g_epilogue
__method_Test.g_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_Test.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call this.g()
    subq $8, %rsp
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -16(%rbp)
  # call Library.printi(t0)
    movq -16(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1 = call this.f()
    subq $8, %rsp
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -24(%rbp)
  # call Library.printi(t1)
    movq -24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
__method_Test.main_epilogue:
    addq $32, %rsp
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
