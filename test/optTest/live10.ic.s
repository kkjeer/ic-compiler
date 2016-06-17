  # Compiled by icc from test/optTest/live10.ic
  # At Fri Apr 22 23:26:40 EDT 2016

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
  # vtable for class LiveWithFields
    .align 8
__LiveWithFields_vtable:

.text
    .align 8

  # Error handler for null dereference.
__ic_error_handler_bounds:
    leaq __ic_error_string_bounds(%rip), %rdi
    callq __LIB_println
    movq $1, %rdi
    callq __LIB_exit
__ic_error_handler_null:
    leaq __ic_error_string_null(%rip), %rdi
    callq __LIB_println
    movq $1, %rdi
    callq __LIB_exit
__ic_error_handler_size:
    leaq __ic_error_string_size(%rip), %rdi
    callq __LIB_println
    movq $1, %rdi
    callq __LIB_exit
__ic_error_handler_div:
    leaq __ic_error_string_div(%rip), %rdi
    callq __LIB_println
    movq $1, %rdi
    callq __LIB_exit

__method_LiveWithFields=>main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # t0 = new Test()			
    callq __LIB_allocateObject(32)
    .set %r11, 1000
    addq %r11, %rax
    movq %r10, 5(%rbp)
  # Store Test's vtable pointer in new object instance.
    leaq __Test_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, 40(%rbp)
  # myTest = t0			
    movq 5(%rbp), %rax
    movq %rax, 2(%rbp)
  # Null check: myTest != Null			
    movq 2(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_null
  # ### DCE: Removed dead code: t1 = myTest.x			#field access of x on line 12
  # ### DCE: Removed dead code: myInt = t1			
  # Null check: myTest != Null			
    movq 2(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_null
  # myTest.s = "Hello"			
    movq 2(%rbp), %r10
    movq 0(%rbp), %rax
    movq %rax, 8(%r10)
  # Null check: myTest != Null			
    movq 2(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_null
  # myTest.b = true			
    movq 2(%rbp), %r10
    movq 0(%rbp), %rax
    movq %rax, 16(%r10)
__method_LiveWithFields=>main_epilogue:
    addq $0, %rsp
    ret

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: LiveWithFields
    movq $8, %rdi
    callq __LIB_allocateObject
  # Store LiveWithFields's vtable pointer in new object instance.
    leaq __LiveWithFields_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for LiveWithFields.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call LiveWithFields.main
    callq __method_LiveWithFields.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
