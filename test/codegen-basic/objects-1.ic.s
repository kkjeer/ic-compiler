  # Compiled by icc from /Users/KKjeer/workspace/ic-compiler/icc/test/codegen-basic/objects-1.ic
  # At Fri May 13 14:27:42 EDT 2016

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
    .quad __method_Test.f
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

__method_Test.f:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # t1 = this
    movq 16(%rbp), %rax
    movq %rax, -24(%rbp)
  # Null check: t1 != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = t1.x
    movq -24(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_Test.f_epilogue
__method_Test.f_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_Test.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # t0 = new Test()
    movq $24, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __Test_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -24(%rbp)
  # t = t0
    movq -24(%rbp), %rax
    movq %rax, -8(%rbp)
  # Null check: t != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t.x = 10
    movq -8(%rbp), %r10
    movq $10, %rax
    movq %rax, 0(%r10)
  # Null check: t != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1 = t.x
    movq -8(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -32(%rbp)
  # call Library.printi(t1)
    movq -32(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # Null check: t != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t.y = 13
    movq -8(%rbp), %r10
    movq $13, %rax
    movq %rax, 8(%r10)
  # Null check: t != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = t.y
    movq -8(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -40(%rbp)
  # call Library.printi(t2)
    movq -40(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
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
    movq $24, %rdi
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
