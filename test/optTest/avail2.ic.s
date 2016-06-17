  # Compiled by icc from test/optTest/avail2.ic
  # At Sun May 15 17:18:46 EDT 2016

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

  # vtable for class AvailIf
    .align 8
__AvailIf_vtable:
    .quad __method_AvailIf.main

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

__method_AvailIf.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: t0 = true			#condition for if on line 4
  # DCE: Removed dead code: t0 = true			#condition for if on line 4
  # ### DCE: Removed dead code: t1 = false
  # DCE: Removed dead code: t1 = false
  # cjump false label _elseAvailIf_main0
    movq $0, %rax
    testq %rax, %rax
    jnz _elseAvailIf_main0
  # ### DCE: Removed dead code: t2 = 3
  # DCE: Removed dead code: t2 = 3
  # ### DCE: Removed dead code: x = t2
  # DCE: Removed dead code: x = t2
  # jump label _endIfAvailIf_main0
    jmp _endIfAvailIf_main0
  # label _elseAvailIf_main0
_elseAvailIf_main0:
  # ### DCE: Removed dead code: t3 = 3
  # DCE: Removed dead code: t3 = 3
  # ### DCE: Removed dead code: y = t3
  # DCE: Removed dead code: y = t3
  # label _endIfAvailIf_main0
_endIfAvailIf_main0:
  # ### DCE: Removed dead code: t4 = 3
  # DCE: Removed dead code: t4 = 3
  # ### DCE: Removed dead code: z = 3			#CPP: Replaced z = t4
  # DCE: Removed dead code: z = 3			#CPP: Replaced z = t4
  # call Library.printi(3)
    movq $3, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
__method_AvailIf.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: AvailIf
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store AvailIf's vtable pointer in new object instance.
    leaq __AvailIf_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for AvailIf.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call AvailIf.main
    callq __method_AvailIf.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
