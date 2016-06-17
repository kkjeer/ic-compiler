  # Compiled by icc from test/optTest/avail6.ic
  # At Sun May 15 17:19:10 EDT 2016

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

  # vtable for class MyObject
    .align 8
__MyObject_vtable:
    .quad __method_MyObject.changeInts
  # vtable for class AvailFields
    .align 8
__AvailFields_vtable:
    .quad __method_AvailFields.main

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

__method_MyObject.changeInts:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.objX = 0
    movq 16(%rbp), %r10
    movq $0, %rax
    movq %rax, 0(%r10)
  # ### CSE: Eliminated Null check: this != Null
  # CSE: Eliminated Null check: this != Null
  # this.objY = 1
    movq 16(%rbp), %r10
    movq $1, %rax
    movq %rax, 8(%r10)
__method_MyObject.changeInts_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_AvailFields.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # t0 = new MyObject()
    movq $24, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MyObject_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -48(%rbp)
  # ### DCE: Removed dead code: myObj = t0
  # DCE: Removed dead code: myObj = t0
  # Null check: t0 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1 = t0.objX
    movq -48(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -56(%rbp)
  # ### DCE: Removed dead code: x = t1
  # DCE: Removed dead code: x = t1
  # ### CSE: Eliminated Null check: myObj != Null
  # CSE: Eliminated Null check: myObj != Null
  # ### DCE: Removed dead code: t2 = t1
  # DCE: Removed dead code: t2 = t1
  # ### DCE: Removed dead code: y = t2
  # DCE: Removed dead code: y = t2
  # ### CSE: Eliminated Null check: myObj != Null
  # CSE: Eliminated Null check: myObj != Null
  # t0.objY = t1
    movq -48(%rbp), %r10
    movq -56(%rbp), %rax
    movq %rax, 8(%r10)
  # ### CSE: Eliminated Null check: myObj != Null
  # CSE: Eliminated Null check: myObj != Null
  # ### DCE: Removed dead code: t3 = t1			#CPP: Replaced t3 = x			#CSE: Replaced t3 = myObj.objY
  # DCE: Removed dead code: t3 = t1			#CPP: Replaced t3 = x			#CSE: Replaced t3 = myObj.objY
  # ### DCE: Removed dead code: z = t3
  # DCE: Removed dead code: z = t3
  # ### CSE: Eliminated Null check: myObj != Null
  # CSE: Eliminated Null check: myObj != Null
  # call t0.changeInts()
    subq $8, %rsp
    movq -48(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
  # Null check: t0 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = t0.objX
    movq -48(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -80(%rbp)
  # ### DCE: Removed dead code: z = t4
  # DCE: Removed dead code: z = t4
  # call Library.printi(t4)
    movq -80(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
__method_AvailFields.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: AvailFields
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store AvailFields's vtable pointer in new object instance.
    leaq __AvailFields_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for AvailFields.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call AvailFields.main
    callq __method_AvailFields.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
