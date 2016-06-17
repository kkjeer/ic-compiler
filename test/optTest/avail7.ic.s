  # Compiled by icc from test/optTest/avail7.ic
  # At Sun May 15 17:19:16 EDT 2016

.data
  # string literals
    .align 8
    .quad 6
__ic_string_lit_0:
    .ascii"Hello "

    .align 8
    .quad 5
__ic_string_lit_1:
    .ascii"World"

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

  # vtable for class AvailMoreArrays
    .align 8
__AvailMoreArrays_vtable:
    .quad __method_AvailMoreArrays.main

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

__method_AvailMoreArrays.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # ### DCE: Removed dead code: t0 = 7
  # DCE: Removed dead code: t0 = 7
  # ### DCE: Removed dead code: x = t0
  # DCE: Removed dead code: x = t0
  # ### DCE: Removed dead code: t2 = 7
  # DCE: Removed dead code: t2 = 7
  # Size check: 7 >= 0			
    movq $7, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # ### DCE: Removed dead code: t1 = new [7]			#CPP: Replaced t1 = new [t2]
  # DCE: Removed dead code: t1 = new [7]			#CPP: Replaced t1 = new [t2]
  # ### DCE: Removed dead code: ints = t1
  # DCE: Removed dead code: ints = t1
  # ### DCE: Removed dead code: t4 = 7
  # DCE: Removed dead code: t4 = 7
  # ### CSE: Eliminated Size check: 7 >= 0						#CPP: Replaced Size check: t4 >= 0			
  # CSE: Eliminated Size check: 7 >= 0						#CPP: Replaced Size check: t4 >= 0			
  # t3 = new [7]
    movq $7, %rdi
    callq __LIB_allocateArray
    movq %rax, -120(%rbp)
  # ### DCE: Removed dead code: strings = t3
  # DCE: Removed dead code: strings = t3
  # t5 = call Library.stringCat("Hello ", "World")
    leaq __ic_string_lit_0(%rip), %rdi
    movq %rdi, %rdi
    leaq __ic_string_lit_1(%rip), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -136(%rbp)
  # ### DCE: Removed dead code: s = t5
  # DCE: Removed dead code: s = t5
  # Null check: t3 != Null
    movq -120(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < t3.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -120(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t3[0] = t5
    movq -120(%rbp), %rax
    movq $0, %r10
    movq -136(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # Null check: t3 != Null
    movq -120(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < t3.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -120(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # ### DCE: Removed dead code: t6 = t5			#CPP: Replaced t6 = s			#CSE: Replaced t6 = strings[0]
  # DCE: Removed dead code: t6 = t5			#CPP: Replaced t6 = s			#CSE: Replaced t6 = strings[0]
  # ### DCE: Removed dead code: w = t6
  # DCE: Removed dead code: w = t6
  # ### DCE: Removed dead code: t8 = 7
  # DCE: Removed dead code: t8 = 7
  # ### CSE: Eliminated Size check: 7 >= 0						#CPP: Replaced Size check: t8 >= 0			
  # CSE: Eliminated Size check: 7 >= 0						#CPP: Replaced Size check: t8 >= 0			
  # t7 = new [7]
    movq $7, %rdi
    callq __LIB_allocateArray
    movq %rax, -152(%rbp)
  # ### DCE: Removed dead code: bools = t7
  # DCE: Removed dead code: bools = t7
  # ### DCE: Removed dead code: a = true
  # DCE: Removed dead code: a = true
  # Null check: t7 != Null
    movq -152(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 5 < t7.length
    movq $5, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -152(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t7[5] = true
    movq -152(%rbp), %rax
    movq $5, %r10
    movq $1, %r11
    movq %r11, (%rax,%r10,8)
  # Null check: t7 != Null
    movq -152(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 5 < t7.length
    movq $5, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -152(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # ### DCE: Removed dead code: t10 = true
  # DCE: Removed dead code: t10 = true
  # ### DCE: Removed dead code: t9 = a			#CPP: Replaced t9 = t10
  # DCE: Removed dead code: t9 = a			#CPP: Replaced t9 = t10
  # ### DCE: Removed dead code: t11 = false
  # DCE: Removed dead code: t11 = false
  # cjump false label _endAndAvailMoreArrays_main0
    movq $0, %rax
    testq %rax, %rax
    jnz _endAndAvailMoreArrays_main0
  # ### DCE: Removed dead code: t9 = true
  # DCE: Removed dead code: t9 = true
  # label _endAndAvailMoreArrays_main0
_endAndAvailMoreArrays_main0:
  # ### DCE: Removed dead code: b = t9
  # DCE: Removed dead code: b = t9
__method_AvailMoreArrays.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: AvailMoreArrays
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store AvailMoreArrays's vtable pointer in new object instance.
    leaq __AvailMoreArrays_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for AvailMoreArrays.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call AvailMoreArrays.main
    callq __method_AvailMoreArrays.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret
