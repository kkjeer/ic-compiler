  # Compiled by icc from test/projectTest/test12.ic
  # At Sun May 15 10:57:43 EDT 2016

.data
  # string literals
    .align 8
    .quad 5
__ic_string_lit_0:
    .ascii"hello"

    .align 8
    .quad 33
__ic_string_lit_1:
    .ascii"Project test 12: TestMethodParams"

    .align 8
    .quad 5
__ic_string_lit_2:
    .ascii"len: "

    .align 8
    .quad 0
__ic_string_lit_3:
    .ascii""

    .align 8
    .quad 5
__ic_string_lit_4:
    .ascii"str: "

    .align 8
    .quad 0
__ic_string_lit_5:
    .ascii""

    .align 8
    .quad 2
__ic_string_lit_6:
    .ascii"hi"

    .align 8
    .quad 3
__ic_string_lit_7:
    .ascii"x: "

    .align 8
    .quad 0
__ic_string_lit_8:
    .ascii""

    .align 8
    .quad 3
__ic_string_lit_9:
    .ascii"s: "

    .align 8
    .quad 0
__ic_string_lit_10:
    .ascii""

    .align 8
    .quad 3
__ic_string_lit_11:
    .ascii"b: "

    .align 8
    .quad 0
__ic_string_lit_12:
    .ascii""

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

  # vtable for class TestMethodParams
    .align 8
__TestMethodParams_vtable:
    .quad __method_TestMethodParams.main
    .quad __method_TestMethodParams.intParam
    .quad __method_TestMethodParams.stringParam
    .quad __method_TestMethodParams.boolParam

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

__method_TestMethodParams.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # Null check: args != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0= args.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -32(%rbp)
  # len = t0
    movq -32(%rbp), %rax
    movq %rax, -8(%rbp)
  # str = "hello"
    leaq __ic_string_lit_0(%rip), %rax
    movq %rax, -16(%rbp)
  # call Library.println("Project test 12: TestMethodParams")
    leaq __ic_string_lit_1(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # call Library.print("len: ")
    leaq __ic_string_lit_2(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printi(len)
    movq -8(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_3(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # call Library.print("str: ")
    leaq __ic_string_lit_4(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.print(str)
    movq -16(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_5(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.intParam(2)
    pushq $2
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.stringParam("hi")
    leaq __ic_string_lit_6(%rip), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *16(%rax)
    addq $16, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.boolParam(true)
    pushq $1
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *24(%rax)
    addq $16, %rsp
__method_TestMethodParams.main_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: TestMethodParams
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store TestMethodParams's vtable pointer in new object instance.
    leaq __TestMethodParams_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for TestMethodParams.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call TestMethodParams.main
    callq __method_TestMethodParams.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret

__method_TestMethodParams.intParam:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # call Library.print("x: ")
    leaq __ic_string_lit_7(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printi(x)
    movq 24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_8(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_TestMethodParams.intParam_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_TestMethodParams.stringParam:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # call Library.print("s: ")
    leaq __ic_string_lit_9(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.print(s)
    movq 24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_10(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_TestMethodParams.stringParam_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_TestMethodParams.boolParam:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # call Library.print("b: ")
    leaq __ic_string_lit_11(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printb(b)
    movq 24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printb
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_12(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_TestMethodParams.boolParam_epilogue:
    addq $0, %rsp
    popq %rbp
    retq
