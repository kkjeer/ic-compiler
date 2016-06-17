  # Compiled by icc from test/projectTest/test14.ic
  # At Sun May 15 10:57:57 EDT 2016

.data
  # string literals
    .align 8
    .quad 21
__ic_string_lit_0:
    .ascii"done with while loop!"

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

  # vtable for class SimpleWhile
    .align 8
__SimpleWhile_vtable:
    .quad __method_SimpleWhile.main

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

__method_SimpleWhile.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # label _beginWhileSimpleWhile_main0
_beginWhileSimpleWhile_main0:
  # t1 = i < 5
    movq -8(%rbp), %rax
    movq $5, %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -32(%rbp)
  # t0 = t1			#condition for while loop on line 4
    movq -32(%rbp), %rax
    movq %rax, -24(%rbp)
  # t2 = !t1
    movq -32(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -40(%rbp)
  # cjump t2 label _endWhileSimpleWhile_main0			#test for while loop on line 4
    movq -40(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileSimpleWhile_main0
  # t3 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -48(%rbp)
  # i = t3
    movq -48(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileSimpleWhile_main0
    jmp _beginWhileSimpleWhile_main0
  # label _endWhileSimpleWhile_main0
_endWhileSimpleWhile_main0:
  # call Library.println("done with while loop!")
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_SimpleWhile.main_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: SimpleWhile
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store SimpleWhile's vtable pointer in new object instance.
    leaq __SimpleWhile_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for SimpleWhile.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call SimpleWhile.main
    callq __method_SimpleWhile.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
