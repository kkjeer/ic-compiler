  # Compiled by icc from /Users/KKjeer/workspace/ic-compiler/icc/test/codegen-basic/params-1.ic
  # At Fri May 13 14:27:48 EDT 2016

.data
  # string literals
    .align 8
    .quad 3
__ic_string_lit_0:
    .ascii"moo"

    .align 8
    .quad 2
__ic_string_lit_1:
    .ascii"33"

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
    subq $80, %rsp
  # call Library.printi(x)
    movq 24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.printb(b)
    movq 32(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printb
    addq $8, %rsp
  # call Library.print(c)
    movq 40(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # t0 = call Library.itos(x)
    movq 24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_itos
    addq $8, %rsp
    movq %rax, -40(%rbp)
  # call Library.print(t0)
    movq -40(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # t2 = -11
    movq $11, %rax
    negq %rax
    movq %rax, -56(%rbp)
  # t1 = call Library.stoi(c, t2)
    movq 40(%rbp), %rdi
    movq %rdi, %rdi
    movq -56(%rbp), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stoi
    addq $8, %rsp
    movq %rax, -48(%rbp)
  # call Library.printi(t1)
    movq -48(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # t4 = -11
    movq $11, %rax
    negq %rax
    movq %rax, -72(%rbp)
  # t3 = call Library.stoi("moo", t4)
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    movq -72(%rbp), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stoi
    addq $8, %rsp
    movq %rax, -64(%rbp)
  # call Library.printi(t3)
    movq -64(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
__method_Test.f_epilogue:
    addq $80, %rsp
    popq %rbp
    retq

__method_Test.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.f(1, false, "33")
    leaq __ic_string_lit_1(%rip), %rax
    pushq %rax
    pushq $0
    pushq $1
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
__method_Test.main_epilogue:
    addq $0, %rsp
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
