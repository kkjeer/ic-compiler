  # Compiled by icc from /Users/KKjeer/workspace/ic-compiler/icc/test/codegen-basic/locals-2.ic
  # At Fri May 13 14:27:40 EDT 2016

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
  # x = 1
    movq $1, %rax
    movq %rax, -16(%rbp)
  # y = 2
    movq $2, %rax
    movq %rax, -24(%rbp)
  # t0 = x > y
    movq -16(%rbp), %rax
    movq -24(%rbp), %r10
    cmpq %r10, %rax
    setg %al
    movzbq %al, %rax
    movq %rax, -40(%rbp)
  # call Library.printb(t0)
    movq -40(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printb
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
