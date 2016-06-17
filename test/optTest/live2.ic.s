  # Compiled by icc from test/optTest/live2.ic
  # At Sun May 15 17:17:06 EDT 2016

.data
  # string literals
    .align 8
    .quad 8
__ic_string_lit_0:
    .ascii"Not Live"

    .align 8
    .quad 4
__ic_string_lit_1:
    .ascii"Main"

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

  # vtable for class LiveReturn
    .align 8
__LiveReturn_vtable:
    .quad __method_LiveReturn.main
    .quad __method_LiveReturn.returnInt

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

__method_LiveReturn.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: dead = "Not Live"
  # DCE: Removed dead code: dead = "Not Live"
  # call Library.println("Main")
    leaq __ic_string_lit_1(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_LiveReturn.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: LiveReturn
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store LiveReturn's vtable pointer in new object instance.
    leaq __LiveReturn_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for LiveReturn.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call LiveReturn.main
    callq __method_LiveReturn.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret

__method_LiveReturn.returnInt:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: y = 1
  # DCE: Removed dead code: y = 1
  # x = 0
    movq $0, %rax
    movq %rax, -16(%rbp)
  # return 0			#CPP: Replaced return x
    movq $0, %rax
    jmp __method_LiveReturn.returnInt_epilogue
__method_LiveReturn.returnInt_epilogue:
    addq $0, %rsp
    popq %rbp
    retq
