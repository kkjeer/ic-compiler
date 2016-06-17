  # Compiled by icc from test/projectTest/test1.ic
  # At Sun May 15 10:56:38 EDT 2016

.data
  # string literals
    .align 8
    .quad 0
__ic_string_lit_0:
    .ascii""

    .align 8
    .quad 0
__ic_string_lit_1:
    .ascii""

    .align 8
    .quad 0
__ic_string_lit_2:
    .ascii""

    .align 8
    .quad 32
__ic_string_lit_3:
    .ascii"Project test 1: FunctionTypeTest"

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

  # vtable for class PARAMS__int_int_boolean_string_array__RETURN__string_Template
    .align 8
__PARAMS__int_int_boolean_string_array__RETURN__string_Template_vtable:
    .quad __method_PARAMS__int_int_boolean_string_array__RETURN__string_Template.call
  # vtable for class PARAMS__int_array_PARAMS__int__RETURN__string__RETURN__boolean_Template
    .align 8
__PARAMS__int_array_PARAMS__int__RETURN__string__RETURN__boolean_Template_vtable:
    .quad __method_PARAMS__int_array_PARAMS__int__RETURN__string__RETURN__boolean_Template.call
  # vtable for class PARAMS__int__RETURN__string_Template
    .align 8
__PARAMS__int__RETURN__string_Template_vtable:
    .quad __method_PARAMS__int__RETURN__string_Template.call
  # vtable for class PARAMS____RETURN__PARAMS__int_int__RETURN__string_Template
    .align 8
__PARAMS____RETURN__PARAMS__int_int__RETURN__string_Template_vtable:
    .quad __method_PARAMS____RETURN__PARAMS__int_int__RETURN__string_Template.call
  # vtable for class PARAMS__int_int__RETURN__string_Template
    .align 8
__PARAMS__int_int__RETURN__string_Template_vtable:
    .quad __method_PARAMS__int_int__RETURN__string_Template.call
  # vtable for class PARAMS__boolean__RETURN__void_Template
    .align 8
__PARAMS__boolean__RETURN__void_Template_vtable:
    .quad __method_PARAMS__boolean__RETURN__void_Template.call
  # vtable for class FunctionTypeTest
    .align 8
__FunctionTypeTest_vtable:
    .quad __method_FunctionTypeTest.main

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

__method_PARAMS__int_int_boolean_string_array__RETURN__string_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return ""
    leaq __ic_string_lit_0(%rip), %rax
    jmp __method_PARAMS__int_int_boolean_string_array__RETURN__string_Template.call_epilogue
__method_PARAMS__int_int_boolean_string_array__RETURN__string_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__int_array_PARAMS__int__RETURN__string__RETURN__boolean_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return true
    movq $1, %rax
    jmp __method_PARAMS__int_array_PARAMS__int__RETURN__string__RETURN__boolean_Template.call_epilogue
__method_PARAMS__int_array_PARAMS__int__RETURN__string__RETURN__boolean_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__int__RETURN__string_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return ""
    leaq __ic_string_lit_1(%rip), %rax
    jmp __method_PARAMS__int__RETURN__string_Template.call_epilogue
__method_PARAMS__int__RETURN__string_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS____RETURN__PARAMS__int_int__RETURN__string_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return Null
    movq $0, %rax
    jmp __method_PARAMS____RETURN__PARAMS__int_int__RETURN__string_Template.call_epilogue
__method_PARAMS____RETURN__PARAMS__int_int__RETURN__string_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__int_int__RETURN__string_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return ""
    leaq __ic_string_lit_2(%rip), %rax
    jmp __method_PARAMS__int_int__RETURN__string_Template.call_epilogue
__method_PARAMS__int_int__RETURN__string_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__boolean__RETURN__void_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return
    jmp __method_PARAMS__boolean__RETURN__void_Template.call_epilogue
__method_PARAMS__boolean__RETURN__void_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_FunctionTypeTest.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # call Library.println("Project test 1: FunctionTypeTest")
    leaq __ic_string_lit_3(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_FunctionTypeTest.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: FunctionTypeTest
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store FunctionTypeTest's vtable pointer in new object instance.
    leaq __FunctionTypeTest_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for FunctionTypeTest.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call FunctionTypeTest.main
    callq __method_FunctionTypeTest.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
