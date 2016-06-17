  # Compiled by icc from test/projectTest/GroupInt.ic
  # At Mon May 16 13:31:36 EDT 2016

.data
  # string literals
    .align 8
    .quad 21
__ic_string_lit_0:
    .ascii"Default Group of Ints"

    .align 8
    .quad 0
__ic_string_lit_1:
    .ascii""

    .align 8
    .quad 10
__ic_string_lit_2:
    .ascii"***Group: "

    .align 8
    .quad 3
__ic_string_lit_3:
    .ascii"***"

    .align 8
    .quad 10
__ic_string_lit_4:
    .ascii"Elements: "

    .align 8
    .quad 10
__ic_string_lit_5:
    .ascii"Identity: "

    .align 8
    .quad 10
__ic_string_lit_6:
    .ascii"Inverses: "

    .align 8
    .quad 0
__ic_string_lit_7:
    .ascii""

    .align 8
    .quad 13
__ic_string_lit_8:
    .ascii"Error: group "

    .align 8
    .quad 29
__ic_string_lit_9:
    .ascii" is not closed with elements "

    .align 8
    .quad 5
__ic_string_lit_10:
    .ascii" and "

    .align 8
    .quad 0
__ic_string_lit_11:
    .ascii""

    .align 8
    .quad 13
__ic_string_lit_12:
    .ascii"Error: group "

    .align 8
    .quad 20
__ic_string_lit_13:
    .ascii" is not associative."

    .align 8
    .quad 27
__ic_string_lit_14:
    .ascii"Error: no identity element."

    .align 8
    .quad 15
__ic_string_lit_15:
    .ascii"Error: element "

    .align 8
    .quad 16
__ic_string_lit_16:
    .ascii" has no inverse."

    .align 8
    .quad 0
__ic_string_lit_17:
    .ascii""

    .align 8
    .quad 0
__ic_string_lit_18:
    .ascii""

    .align 8
    .quad 2
__ic_string_lit_19:
    .ascii", "

    .align 8
    .quad 0
__ic_string_lit_20:
    .ascii""

    .align 8
    .quad 1
__ic_string_lit_21:
    .ascii"5"

    .align 8
    .quad 1
__ic_string_lit_22:
    .ascii"8"

    .align 8
    .quad 1
__ic_string_lit_23:
    .ascii"6"

    .align 8
    .quad 14
__ic_string_lit_24:
    .ascii"Testing group "

    .align 8
    .quad 7
__ic_string_lit_25:
    .ascii"Error: "

    .align 8
    .quad 33
__ic_string_lit_26:
    .ascii" is not a group. Group Elements: "

    .align 8
    .quad 0
__ic_string_lit_27:
    .ascii""

    .align 8
    .quad 12
__ic_string_lit_28:
    .ascii" is a group!"

    .align 8
    .quad 2
__ic_string_lit_29:
    .ascii"Z/"

    .align 8
    .quad 1
__ic_string_lit_30:
    .ascii"Z"

    .align 8
    .quad 12
__ic_string_lit_31:
    .ascii"Random size "

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

  # vtable for class PARAMS__int_int__RETURN__int_Template
    .align 8
__PARAMS__int_int__RETURN__int_Template_vtable:
    .quad __method_PARAMS__int_int__RETURN__int_Template.call
  # vtable for class GroupIntDriver_testZnZ_znzOp_Closure
    .align 8
__GroupIntDriver_testZnZ_znzOp_Closure_vtable:
    .quad __method_GroupIntDriver_testZnZ_znzOp_Closure.call
    .quad __method_GroupIntDriver_testZnZ_znzOp_Closure.create
  # vtable for class GroupIntDriver_testRandom_randOp_Closure
    .align 8
__GroupIntDriver_testRandom_randOp_Closure_vtable:
    .quad __method_GroupIntDriver_testRandom_randOp_Closure.call
    .quad __method_GroupIntDriver_testRandom_randOp_Closure.create
  # vtable for class GroupInt
    .align 8
__GroupInt_vtable:
    .quad __method_GroupInt.init
    .quad __method_GroupInt.setName
    .quad __method_GroupInt.printSelf
    .quad __method_GroupInt.isGroup
    .quad __method_GroupInt.isClosed
    .quad __method_GroupInt.isAssociative
    .quad __method_GroupInt.getIdentity
    .quad __method_GroupInt.checkInverses
    .quad __method_GroupInt.getInverse
    .quad __method_GroupInt.isElement
    .quad __method_GroupInt.printInt
    .quad __method_GroupInt.printInts
  # vtable for class GroupIntDriver
    .align 8
__GroupIntDriver_vtable:
    .quad __method_GroupIntDriver.main
    .quad __method_GroupIntDriver.testOneGroup
    .quad __method_GroupIntDriver.testZnZ
    .quad __method_GroupIntDriver.testRandom

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

__method_PARAMS__int_int__RETURN__int_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return 0
    movq $0, %rax
    jmp __method_PARAMS__int_int__RETURN__int_Template.call_epilogue
__method_PARAMS__int_int__RETURN__int_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_GroupIntDriver_testZnZ_znzOp_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.n = n
    movq -16(%rbp), %r10
    movq 24(%rbp), %rax
    movq %rax, 0(%r10)
  # t1 = this
    movq 16(%rbp), %rax
    movq %rax, -24(%rbp)
  # Null check: t1 != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1.nName = nName
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # return t2
    movq -32(%rbp), %rax
    jmp __method_GroupIntDriver_testZnZ_znzOp_Closure.create_epilogue
__method_GroupIntDriver_testZnZ_znzOp_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_GroupIntDriver_testZnZ_znzOp_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1 = this.n
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -24(%rbp)
  # Zero check: t1 != 0
    movq -24(%rbp), %rax
    testq %rax, %rax
    je __ic_error_handler_div
  # t2 = x + y
    movq 24(%rbp), %rax
    movq 32(%rbp), %r10
    addq %rax, %r10
    movq %r10, -32(%rbp)
  # t0 = t2 % t1
    movq -32(%rbp), %rax
    cqto
    movq -24(%rbp), %r10
    idivq %r10
    movq %rdx, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_GroupIntDriver_testZnZ_znzOp_Closure.call_epilogue
__method_GroupIntDriver_testZnZ_znzOp_Closure.call_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_GroupIntDriver_testRandom_randOp_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.n = n
    movq -16(%rbp), %r10
    movq 24(%rbp), %rax
    movq %rax, 0(%r10)
  # t1 = this
    movq 16(%rbp), %rax
    movq %rax, -24(%rbp)
  # Null check: t1 != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1.nName = nName
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # return t2
    movq -32(%rbp), %rax
    jmp __method_GroupIntDriver_testRandom_randOp_Closure.create_epilogue
__method_GroupIntDriver_testRandom_randOp_Closure.create_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_GroupIntDriver_testRandom_randOp_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # t2 = x + y
    movq 24(%rbp), %rax
    movq 32(%rbp), %r10
    addq %rax, %r10
    movq %r10, -32(%rbp)
  # t1 = t2 + 1
    movq -32(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -24(%rbp)
  # t0 = call Library.random(t1)
    movq -24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_random
    addq $8, %rsp
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_GroupIntDriver_testRandom_randOp_Closure.call_epilogue
__method_GroupIntDriver_testRandom_randOp_Closure.call_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_GroupInt.init:
    pushq %rbp
    movq %rsp, %rbp
    subq $160, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.elements = elts
    movq 16(%rbp), %r10
    movq 24(%rbp), %rax
    movq %rax, 0(%r10)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.operator = op
    movq 16(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.name = "Default Group of Ints"
    movq 16(%rbp), %r10
    leaq __ic_string_lit_0(%rip), %rax
    movq %rax, 16(%r10)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.hasIdentity = false
    movq 16(%rbp), %r10
    movq $0, %rax
    movq %rax, 32(%r10)
  # Null check: elts != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5= elts.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -64(%rbp)
  # Size check: t5 >= 0			
    movq -64(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t4 = new [t5]
    movq -64(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -56(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.inverses = t4
    movq 16(%rbp), %r10
    movq -56(%rbp), %rax
    movq %rax, 40(%r10)
  # Null check: elts != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8= elts.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -88(%rbp)
  # Size check: t8 >= 0			
    movq -88(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t7 = new [t8]
    movq -88(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -80(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.hasInverse = t7
    movq 16(%rbp), %r10
    movq -80(%rbp), %rax
    movq %rax, 48(%r10)
  # label _beginWhileGroupInt_init0
_beginWhileGroupInt_init0:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t13 = this.hasInverse
    movq 16(%rbp), %rax
    movq 48(%rax), %rax
    movq %rax, -128(%rbp)
  # Null check: t13 != Null
    movq -128(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t12= t13.length
    movq -128(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -120(%rbp)
  # t11 = i < t12
    movq -8(%rbp), %rax
    movq -120(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -112(%rbp)
  # t10 = t11			#condition for while loop on line 23
    movq -112(%rbp), %rax
    movq %rax, -104(%rbp)
  # t14 = !t11
    movq -112(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -136(%rbp)
  # cjump t14 label _endWhileGroupInt_init0			#test for while loop on line 23
    movq -136(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupInt_init0
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t15 = this.hasInverse
    movq 16(%rbp), %rax
    movq 48(%rax), %rax
    movq %rax, -144(%rbp)
  # Null check: t15 != Null
    movq -144(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t15.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -144(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t15[i] = true
    movq -144(%rbp), %rax
    movq -8(%rbp), %r10
    movq $1, %r11
    movq %r11, (%rax,%r10,8)
  # t16 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -152(%rbp)
  # i = t16
    movq -152(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileGroupInt_init0
    jmp _beginWhileGroupInt_init0
  # label _endWhileGroupInt_init0
_endWhileGroupInt_init0:
__method_GroupInt.init_epilogue:
    addq $160, %rsp
    popq %rbp
    retq

__method_GroupInt.setName:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.name = n
    movq 16(%rbp), %r10
    movq 24(%rbp), %rax
    movq %rax, 16(%r10)
__method_GroupInt.setName_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_GroupInt.printSelf:
    pushq %rbp
    movq %rsp, %rbp
    subq $64, %rsp
  # call Library.println("")
    leaq __ic_string_lit_1(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = this.name
    movq 16(%rbp), %rax
    movq 16(%rax), %rax
    movq %rax, -32(%rbp)
  # t1 = call Library.stringCat("***Group: ", t2)
    leaq __ic_string_lit_2(%rip), %rdi
    movq %rdi, %rdi
    movq -32(%rbp), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -24(%rbp)
  # t0 = call Library.stringCat(t1, "***")
    movq -24(%rbp), %rdi
    movq %rdi, %rdi
    leaq __ic_string_lit_3(%rip), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -16(%rbp)
  # call Library.println(t0)
    movq -16(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # call Library.print("Elements: ")
    leaq __ic_string_lit_4(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -40(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.printInts(t3)
    movq -40(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *88(%rax)
    addq $16, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = this.identity
    movq 16(%rbp), %rax
    movq 24(%rax), %rax
    movq %rax, -48(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.printInt("Identity: ", t4)
    subq $8, %rsp
    movq -48(%rbp), %rax
    pushq %rax
    leaq __ic_string_lit_5(%rip), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *80(%rax)
    addq $32, %rsp
  # call Library.print("Inverses: ")
    leaq __ic_string_lit_6(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5 = this.inverses
    movq 16(%rbp), %rax
    movq 40(%rax), %rax
    movq %rax, -56(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.printInts(t5)
    movq -56(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *88(%rax)
    addq $16, %rsp
  # call Library.println("")
    leaq __ic_string_lit_7(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_GroupInt.printSelf_epilogue:
    addq $64, %rsp
    popq %rbp
    retq

__method_GroupInt.isGroup:
    pushq %rbp
    movq %rsp, %rbp
    subq $128, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call this.isClosed()
    subq $8, %rsp
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *32(%rax)
    addq $16, %rsp
    movq %rax, -40(%rbp)
  # closed = t0
    movq -40(%rbp), %rax
    movq %rax, -8(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1 = call this.isAssociative()
    subq $8, %rsp
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *40(%rax)
    addq $16, %rsp
    movq %rax, -48(%rbp)
  # assoc = t1
    movq -48(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = call this.getIdentity()
    subq $8, %rsp
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *48(%rax)
    addq $16, %rsp
    movq %rax, -56(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.identity = t2
    movq 16(%rbp), %r10
    movq -56(%rbp), %rax
    movq %rax, 24(%r10)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = call this.checkInverses()
    subq $8, %rsp
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *56(%rax)
    addq $16, %rsp
    movq %rax, -72(%rbp)
  # allInverses = t4
    movq -72(%rbp), %rax
    movq %rax, -24(%rbp)
  # t7 = closed
    movq -8(%rbp), %rax
    movq %rax, -96(%rbp)
  # t8 = !t7
    movq -96(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -104(%rbp)
  # cjump t8 label _endAndGroupInt_isGroup0
    movq -104(%rbp), %rax
    testq %rax, %rax
    jnz _endAndGroupInt_isGroup0
  # t7 = assoc
    movq -16(%rbp), %rax
    movq %rax, -96(%rbp)
  # label _endAndGroupInt_isGroup0
_endAndGroupInt_isGroup0:
  # t6 = t7
    movq -96(%rbp), %rax
    movq %rax, -88(%rbp)
  # t9 = !t6
    movq -88(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -112(%rbp)
  # cjump t9 label _endAndGroupInt_isGroup1
    movq -112(%rbp), %rax
    testq %rax, %rax
    jnz _endAndGroupInt_isGroup1
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t10 = this.hasIdentity
    movq 16(%rbp), %rax
    movq 32(%rax), %rax
    movq %rax, -120(%rbp)
  # t6 = t10
    movq -120(%rbp), %rax
    movq %rax, -88(%rbp)
  # label _endAndGroupInt_isGroup1
_endAndGroupInt_isGroup1:
  # t5 = t6
    movq -88(%rbp), %rax
    movq %rax, -80(%rbp)
  # t11 = !t5
    movq -80(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -128(%rbp)
  # cjump t11 label _endAndGroupInt_isGroup2
    movq -128(%rbp), %rax
    testq %rax, %rax
    jnz _endAndGroupInt_isGroup2
  # t5 = allInverses
    movq -24(%rbp), %rax
    movq %rax, -80(%rbp)
  # label _endAndGroupInt_isGroup2
_endAndGroupInt_isGroup2:
  # return t5
    movq -80(%rbp), %rax
    jmp __method_GroupInt.isGroup_epilogue
__method_GroupInt.isGroup_epilogue:
    addq $128, %rsp
    popq %rbp
    retq

__method_GroupInt.isClosed:
    pushq %rbp
    movq %rsp, %rbp
    subq $288, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # j = 0
    movq $0, %rax
    movq %rax, -16(%rbp)
  # label _beginWhileGroupInt_isClosed0
_beginWhileGroupInt_isClosed0:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -72(%rbp)
  # Null check: t4 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3= t4.length
    movq -72(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -64(%rbp)
  # t2 = t3 - 1
    movq -64(%rbp), %rax
    movq $1, %r10
    subq %r10, %rax
    movq %rax, -56(%rbp)
  # t1 = i < t2
    movq -8(%rbp), %rax
    movq -56(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -48(%rbp)
  # t0 = t1			#condition for while loop on line 75
    movq -48(%rbp), %rax
    movq %rax, -40(%rbp)
  # t5 = !t1
    movq -48(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -80(%rbp)
  # cjump t5 label _endWhileGroupInt_isClosed0			#test for while loop on line 75
    movq -80(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupInt_isClosed0
  # t6 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -88(%rbp)
  # j = t6
    movq -88(%rbp), %rax
    movq %rax, -16(%rbp)
  # label _beginWhileGroupInt_isClosed1
_beginWhileGroupInt_isClosed1:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t10 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -120(%rbp)
  # Null check: t10 != Null
    movq -120(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t9= t10.length
    movq -120(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -112(%rbp)
  # t8 = j < t9
    movq -16(%rbp), %rax
    movq -112(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -104(%rbp)
  # t7 = t8			#condition for while loop on line 77
    movq -104(%rbp), %rax
    movq %rax, -96(%rbp)
  # t11 = !t8
    movq -104(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -128(%rbp)
  # cjump t11 label _endWhileGroupInt_isClosed1			#test for while loop on line 77
    movq -128(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupInt_isClosed1
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t13 = this.operator
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -144(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t15 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -160(%rbp)
  # Null check: t15 != Null
    movq -160(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t15.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -160(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t14 = t15[i]
    movq -160(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -152(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t17 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -176(%rbp)
  # Null check: t17 != Null
    movq -176(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= j < t17.length
    movq -16(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -176(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t16 = t17[j]
    movq -176(%rbp), %rax
    movq -16(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -168(%rbp)
  # Null check: t13 != Null
    movq -144(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t12 = call t13.call(t14, t16)
    subq $8, %rsp
    movq -168(%rbp), %rax
    pushq %rax
    movq -152(%rbp), %rax
    pushq %rax
    movq -144(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -136(%rbp)
  # eltOp = t12
    movq -136(%rbp), %rax
    movq %rax, -24(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t20 = call this.isElement(eltOp)
    movq -24(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *72(%rax)
    addq $16, %rsp
    movq %rax, -200(%rbp)
  # t19 = !t20
    movq -200(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -192(%rbp)
  # t18 = t19			#condition for if on line 79
    movq -192(%rbp), %rax
    movq %rax, -184(%rbp)
  # t21 = !t19
    movq -192(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -208(%rbp)
  # cjump t21 label _endIfGroupInt_isClosed0
    movq -208(%rbp), %rax
    testq %rax, %rax
    jnz _endIfGroupInt_isClosed0
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t24 = this.name
    movq 16(%rbp), %rax
    movq 16(%rax), %rax
    movq %rax, -232(%rbp)
  # t23 = call Library.stringCat("Error: group ", t24)
    leaq __ic_string_lit_8(%rip), %rdi
    movq %rdi, %rdi
    movq -232(%rbp), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -224(%rbp)
  # t22 = call Library.stringCat(t23, " is not closed with elements ")
    movq -224(%rbp), %rdi
    movq %rdi, %rdi
    leaq __ic_string_lit_9(%rip), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -216(%rbp)
  # call Library.print(t22)
    movq -216(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t26 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -248(%rbp)
  # Null check: t26 != Null
    movq -248(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t26.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -248(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t25 = t26[i]
    movq -248(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -240(%rbp)
  # call Library.printi(t25)
    movq -240(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.print(" and ")
    leaq __ic_string_lit_10(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t28 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -264(%rbp)
  # Null check: t28 != Null
    movq -264(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= j < t28.length
    movq -16(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -264(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t27 = t28[j]
    movq -264(%rbp), %rax
    movq -16(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -256(%rbp)
  # call Library.printi(t27)
    movq -256(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_11(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # return false
    movq $0, %rax
    jmp __method_GroupInt.isClosed_epilogue
  # label _endIfGroupInt_isClosed0
_endIfGroupInt_isClosed0:
  # t29 = j + 1
    movq -16(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -272(%rbp)
  # j = t29
    movq -272(%rbp), %rax
    movq %rax, -16(%rbp)
  # jump label _beginWhileGroupInt_isClosed1
    jmp _beginWhileGroupInt_isClosed1
  # label _endWhileGroupInt_isClosed1
_endWhileGroupInt_isClosed1:
  # t30 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -280(%rbp)
  # i = t30
    movq -280(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileGroupInt_isClosed0
    jmp _beginWhileGroupInt_isClosed0
  # label _endWhileGroupInt_isClosed0
_endWhileGroupInt_isClosed0:
  # return true
    movq $1, %rax
    jmp __method_GroupInt.isClosed_epilogue
__method_GroupInt.isClosed_epilogue:
    addq $288, %rsp
    popq %rbp
    retq

__method_GroupInt.isAssociative:
    pushq %rbp
    movq %rsp, %rbp
    subq $432, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # j = 0
    movq $0, %rax
    movq %rax, -16(%rbp)
  # k = 0
    movq $0, %rax
    movq %rax, -24(%rbp)
  # label _beginWhileGroupInt_isAssociative0
_beginWhileGroupInt_isAssociative0:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -88(%rbp)
  # Null check: t4 != Null
    movq -88(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3= t4.length
    movq -88(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -80(%rbp)
  # t2 = t3 - 2
    movq -80(%rbp), %rax
    movq $2, %r10
    subq %r10, %rax
    movq %rax, -72(%rbp)
  # t1 = i < t2
    movq -8(%rbp), %rax
    movq -72(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -64(%rbp)
  # t0 = t1			#condition for while loop on line 102
    movq -64(%rbp), %rax
    movq %rax, -56(%rbp)
  # t5 = !t1
    movq -64(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -96(%rbp)
  # cjump t5 label _endWhileGroupInt_isAssociative0			#test for while loop on line 102
    movq -96(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupInt_isAssociative0
  # t6 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -104(%rbp)
  # j = t6
    movq -104(%rbp), %rax
    movq %rax, -16(%rbp)
  # label _beginWhileGroupInt_isAssociative1
_beginWhileGroupInt_isAssociative1:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t11 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -144(%rbp)
  # Null check: t11 != Null
    movq -144(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t10= t11.length
    movq -144(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -136(%rbp)
  # t9 = t10 - 1
    movq -136(%rbp), %rax
    movq $1, %r10
    subq %r10, %rax
    movq %rax, -128(%rbp)
  # t8 = j < t9
    movq -16(%rbp), %rax
    movq -128(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -120(%rbp)
  # t7 = t8			#condition for while loop on line 104
    movq -120(%rbp), %rax
    movq %rax, -112(%rbp)
  # t12 = !t8
    movq -120(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -152(%rbp)
  # cjump t12 label _endWhileGroupInt_isAssociative1			#test for while loop on line 104
    movq -152(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupInt_isAssociative1
  # t13 = j + 1
    movq -16(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -160(%rbp)
  # k = t13
    movq -160(%rbp), %rax
    movq %rax, -24(%rbp)
  # label _beginWhileGroupInt_isAssociative2
_beginWhileGroupInt_isAssociative2:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t17 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -192(%rbp)
  # Null check: t17 != Null
    movq -192(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t16= t17.length
    movq -192(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -184(%rbp)
  # t15 = k < t16
    movq -24(%rbp), %rax
    movq -184(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -176(%rbp)
  # t14 = t15			#condition for while loop on line 106
    movq -176(%rbp), %rax
    movq %rax, -168(%rbp)
  # t18 = !t15
    movq -176(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -200(%rbp)
  # cjump t18 label _endWhileGroupInt_isAssociative2			#test for while loop on line 106
    movq -200(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupInt_isAssociative2
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t20 = this.operator
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -216(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t22 = this.operator
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -232(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t24 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -248(%rbp)
  # Null check: t24 != Null
    movq -248(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t24.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -248(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t23 = t24[i]
    movq -248(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -240(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t26 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -264(%rbp)
  # Null check: t26 != Null
    movq -264(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= j < t26.length
    movq -16(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -264(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t25 = t26[j]
    movq -264(%rbp), %rax
    movq -16(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -256(%rbp)
  # Null check: t22 != Null
    movq -232(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t21 = call t22.call(t23, t25)
    subq $8, %rsp
    movq -256(%rbp), %rax
    pushq %rax
    movq -240(%rbp), %rax
    pushq %rax
    movq -232(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -224(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t28 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -280(%rbp)
  # Null check: t28 != Null
    movq -280(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= k < t28.length
    movq -24(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -280(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t27 = t28[k]
    movq -280(%rbp), %rax
    movq -24(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -272(%rbp)
  # Null check: t20 != Null
    movq -216(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t19 = call t20.call(t21, t27)
    subq $8, %rsp
    movq -272(%rbp), %rax
    pushq %rax
    movq -224(%rbp), %rax
    pushq %rax
    movq -216(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -208(%rbp)
  # elt0 = t19
    movq -208(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t30 = this.operator
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -296(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t32 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -312(%rbp)
  # Null check: t32 != Null
    movq -312(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t32.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -312(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t31 = t32[i]
    movq -312(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -304(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t34 = this.operator
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -328(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t36 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -344(%rbp)
  # Null check: t36 != Null
    movq -344(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= j < t36.length
    movq -16(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -344(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t35 = t36[j]
    movq -344(%rbp), %rax
    movq -16(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -336(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t38 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -360(%rbp)
  # Null check: t38 != Null
    movq -360(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= k < t38.length
    movq -24(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -360(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t37 = t38[k]
    movq -360(%rbp), %rax
    movq -24(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -352(%rbp)
  # Null check: t34 != Null
    movq -328(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t33 = call t34.call(t35, t37)
    subq $8, %rsp
    movq -352(%rbp), %rax
    pushq %rax
    movq -336(%rbp), %rax
    pushq %rax
    movq -328(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -320(%rbp)
  # Null check: t30 != Null
    movq -296(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t29 = call t30.call(t31, t33)
    subq $8, %rsp
    movq -320(%rbp), %rax
    pushq %rax
    movq -304(%rbp), %rax
    pushq %rax
    movq -296(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -288(%rbp)
  # elt1 = t29
    movq -288(%rbp), %rax
    movq %rax, -40(%rbp)
  # t40 = elt0 != elt1
    movq -32(%rbp), %rax
    movq -40(%rbp), %r10
    cmpq %r10, %rax
    setne %al
    movzbq %al, %rax
    movq %rax, -376(%rbp)
  # t39 = t40			#condition for if on line 109
    movq -376(%rbp), %rax
    movq %rax, -368(%rbp)
  # t41 = !t40
    movq -376(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -384(%rbp)
  # cjump t41 label _endIfGroupInt_isAssociative0
    movq -384(%rbp), %rax
    testq %rax, %rax
    jnz _endIfGroupInt_isAssociative0
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t44 = this.name
    movq 16(%rbp), %rax
    movq 16(%rax), %rax
    movq %rax, -408(%rbp)
  # t43 = call Library.stringCat("Error: group ", t44)
    leaq __ic_string_lit_12(%rip), %rdi
    movq %rdi, %rdi
    movq -408(%rbp), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -400(%rbp)
  # t42 = call Library.stringCat(t43, " is not associative.")
    movq -400(%rbp), %rdi
    movq %rdi, %rdi
    leaq __ic_string_lit_13(%rip), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -392(%rbp)
  # call Library.println(t42)
    movq -392(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # return false
    movq $0, %rax
    jmp __method_GroupInt.isAssociative_epilogue
  # label _endIfGroupInt_isAssociative0
_endIfGroupInt_isAssociative0:
  # t45 = k + 1
    movq -24(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -416(%rbp)
  # k = t45
    movq -416(%rbp), %rax
    movq %rax, -24(%rbp)
  # jump label _beginWhileGroupInt_isAssociative2
    jmp _beginWhileGroupInt_isAssociative2
  # label _endWhileGroupInt_isAssociative2
_endWhileGroupInt_isAssociative2:
  # t46 = j + 1
    movq -16(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -424(%rbp)
  # j = t46
    movq -424(%rbp), %rax
    movq %rax, -16(%rbp)
  # jump label _beginWhileGroupInt_isAssociative1
    jmp _beginWhileGroupInt_isAssociative1
  # label _endWhileGroupInt_isAssociative1
_endWhileGroupInt_isAssociative1:
  # t47 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -432(%rbp)
  # i = t47
    movq -432(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileGroupInt_isAssociative0
    jmp _beginWhileGroupInt_isAssociative0
  # label _endWhileGroupInt_isAssociative0
_endWhileGroupInt_isAssociative0:
  # return true
    movq $1, %rax
    jmp __method_GroupInt.isAssociative_epilogue
__method_GroupInt.isAssociative_epilogue:
    addq $432, %rsp
    popq %rbp
    retq

__method_GroupInt.getIdentity:
    pushq %rbp
    movq %rsp, %rbp
    subq $256, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # j = 0
    movq $0, %rax
    movq %rax, -16(%rbp)
  # label _beginWhileGroupInt_getIdentity0
_beginWhileGroupInt_getIdentity0:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -56(%rbp)
  # Null check: t3 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2= t3.length
    movq -56(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -48(%rbp)
  # t1 = i < t2
    movq -8(%rbp), %rax
    movq -48(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -40(%rbp)
  # t0 = t1			#condition for while loop on line 130
    movq -40(%rbp), %rax
    movq %rax, -32(%rbp)
  # t4 = !t1
    movq -40(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -64(%rbp)
  # cjump t4 label _endWhileGroupInt_getIdentity0			#test for while loop on line 130
    movq -64(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupInt_getIdentity0
  # label _beginWhileGroupInt_getIdentity1
_beginWhileGroupInt_getIdentity1:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -96(%rbp)
  # Null check: t8 != Null
    movq -96(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7= t8.length
    movq -96(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -88(%rbp)
  # t6 = j < t7
    movq -16(%rbp), %rax
    movq -88(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -80(%rbp)
  # t5 = t6			#condition for while loop on line 131
    movq -80(%rbp), %rax
    movq %rax, -72(%rbp)
  # t9 = !t6
    movq -80(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -104(%rbp)
  # cjump t9 label _endWhileGroupInt_getIdentity1			#test for while loop on line 131
    movq -104(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupInt_getIdentity1
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t13 = this.operator
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -136(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t15 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -152(%rbp)
  # Null check: t15 != Null
    movq -152(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t15.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -152(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t14 = t15[i]
    movq -152(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -144(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t17 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -168(%rbp)
  # Null check: t17 != Null
    movq -168(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t17.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -168(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t16 = t17[i]
    movq -168(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -160(%rbp)
  # Null check: t13 != Null
    movq -136(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t12 = call t13.call(t14, t16)
    subq $8, %rsp
    movq -160(%rbp), %rax
    pushq %rax
    movq -144(%rbp), %rax
    pushq %rax
    movq -136(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -128(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t19 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -184(%rbp)
  # Null check: t19 != Null
    movq -184(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t19.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -184(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t18 = t19[i]
    movq -184(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -176(%rbp)
  # t11 = t12 == t18
    movq -128(%rbp), %rax
    movq -176(%rbp), %r10
    cmpq %r10, %rax
    sete %al
    movzbq %al, %rax
    movq %rax, -120(%rbp)
  # t10 = t11			#condition for if on line 132
    movq -120(%rbp), %rax
    movq %rax, -112(%rbp)
  # t20 = !t11
    movq -120(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -192(%rbp)
  # cjump t20 label _endIfGroupInt_getIdentity0
    movq -192(%rbp), %rax
    testq %rax, %rax
    jnz _endIfGroupInt_getIdentity0
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t22 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -208(%rbp)
  # Null check: t22 != Null
    movq -208(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t22.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -208(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t21 = t22[i]
    movq -208(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -200(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.identity = t21
    movq 16(%rbp), %r10
    movq -200(%rbp), %rax
    movq %rax, 24(%r10)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # this.hasIdentity = true
    movq 16(%rbp), %r10
    movq $1, %rax
    movq %rax, 32(%r10)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t26 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -240(%rbp)
  # Null check: t26 != Null
    movq -240(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t26.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -240(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t25 = t26[i]
    movq -240(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -232(%rbp)
  # return t25
    movq -232(%rbp), %rax
    jmp __method_GroupInt.getIdentity_epilogue
  # label _endIfGroupInt_getIdentity0
_endIfGroupInt_getIdentity0:
  # t27 = j + 1
    movq -16(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -248(%rbp)
  # j = t27
    movq -248(%rbp), %rax
    movq %rax, -16(%rbp)
  # jump label _beginWhileGroupInt_getIdentity1
    jmp _beginWhileGroupInt_getIdentity1
  # label _endWhileGroupInt_getIdentity1
_endWhileGroupInt_getIdentity1:
  # t28 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -256(%rbp)
  # i = t28
    movq -256(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileGroupInt_getIdentity0
    jmp _beginWhileGroupInt_getIdentity0
  # label _endWhileGroupInt_getIdentity0
_endWhileGroupInt_getIdentity0:
  # call Library.println("Error: no identity element.")
    leaq __ic_string_lit_14(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # return Null
    movq $0, %rax
    jmp __method_GroupInt.getIdentity_epilogue
__method_GroupInt.getIdentity_epilogue:
    addq $256, %rsp
    popq %rbp
    retq

__method_GroupInt.checkInverses:
    pushq %rbp
    movq %rsp, %rbp
    subq $160, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # label _beginWhileGroupInt_checkInverses0
_beginWhileGroupInt_checkInverses0:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -56(%rbp)
  # Null check: t3 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2= t3.length
    movq -56(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -48(%rbp)
  # t1 = i < t2
    movq -8(%rbp), %rax
    movq -48(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -40(%rbp)
  # t0 = t1			#condition for while loop on line 154
    movq -40(%rbp), %rax
    movq %rax, -32(%rbp)
  # t4 = !t1
    movq -40(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -64(%rbp)
  # cjump t4 label _endWhileGroupInt_checkInverses0			#test for while loop on line 154
    movq -64(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupInt_checkInverses0
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -88(%rbp)
  # Null check: t7 != Null
    movq -88(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t7.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -88(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t6 = t7[i]
    movq -88(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -80(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5 = call this.getInverse(t6, i)
    subq $8, %rsp
    movq -8(%rbp), %rax
    pushq %rax
    movq -80(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *64(%rax)
    addq $32, %rsp
    movq %rax, -72(%rbp)
  # inverse = t5
    movq -72(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t11 = this.hasInverse
    movq 16(%rbp), %rax
    movq 48(%rax), %rax
    movq %rax, -120(%rbp)
  # Null check: t11 != Null
    movq -120(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t11.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -120(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t10 = t11[i]
    movq -120(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -112(%rbp)
  # t9 = !t10
    movq -112(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -104(%rbp)
  # t8 = t9			#condition for if on line 156
    movq -104(%rbp), %rax
    movq %rax, -96(%rbp)
  # t12 = !t9
    movq -104(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -128(%rbp)
  # cjump t12 label _endIfGroupInt_checkInverses0
    movq -128(%rbp), %rax
    testq %rax, %rax
    jnz _endIfGroupInt_checkInverses0
  # call Library.print("Error: element ")
    leaq __ic_string_lit_15(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t14 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -144(%rbp)
  # Null check: t14 != Null
    movq -144(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t14.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -144(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t13 = t14[i]
    movq -144(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -136(%rbp)
  # call Library.printi(t13)
    movq -136(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.print(" has no inverse.")
    leaq __ic_string_lit_16(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_17(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # return false
    movq $0, %rax
    jmp __method_GroupInt.checkInverses_epilogue
  # label _endIfGroupInt_checkInverses0
_endIfGroupInt_checkInverses0:
  # t15 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -152(%rbp)
  # i = t15
    movq -152(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileGroupInt_checkInverses0
    jmp _beginWhileGroupInt_checkInverses0
  # label _endWhileGroupInt_checkInverses0
_endWhileGroupInt_checkInverses0:
  # return true
    movq $1, %rax
    jmp __method_GroupInt.checkInverses_epilogue
__method_GroupInt.checkInverses_epilogue:
    addq $160, %rsp
    popq %rbp
    retq

__method_GroupInt.getInverse:
    pushq %rbp
    movq %rsp, %rbp
    subq $272, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = this.hasIdentity
    movq 16(%rbp), %rax
    movq 32(%rax), %rax
    movq %rax, -40(%rbp)
  # t1 = !t2
    movq -40(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -32(%rbp)
  # t0 = t1			#condition for if on line 177
    movq -32(%rbp), %rax
    movq %rax, -24(%rbp)
  # t3 = !t1
    movq -32(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -48(%rbp)
  # cjump t3 label _endIfGroupInt_getInverse0
    movq -48(%rbp), %rax
    testq %rax, %rax
    jnz _endIfGroupInt_getInverse0
  # return Null
    movq $0, %rax
    jmp __method_GroupInt.getInverse_epilogue
  # label _endIfGroupInt_getInverse0
_endIfGroupInt_getInverse0:
  # label _beginWhileGroupInt_getInverse0
_beginWhileGroupInt_getInverse0:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -80(%rbp)
  # Null check: t7 != Null
    movq -80(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6= t7.length
    movq -80(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -72(%rbp)
  # t5 = i < t6
    movq -8(%rbp), %rax
    movq -72(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -64(%rbp)
  # t4 = t5			#condition for while loop on line 182
    movq -64(%rbp), %rax
    movq %rax, -56(%rbp)
  # t8 = !t5
    movq -64(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -88(%rbp)
  # cjump t8 label _endWhileGroupInt_getInverse0			#test for while loop on line 182
    movq -88(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupInt_getInverse0
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t13 = this.operator
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -128(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t15 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -144(%rbp)
  # Null check: t15 != Null
    movq -144(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t15.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -144(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t14 = t15[i]
    movq -144(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -136(%rbp)
  # Null check: t13 != Null
    movq -128(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t12 = call t13.call(t14, elt)
    subq $8, %rsp
    movq 24(%rbp), %rax
    pushq %rax
    movq -136(%rbp), %rax
    pushq %rax
    movq -128(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -120(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t16 = this.identity
    movq 16(%rbp), %rax
    movq 24(%rax), %rax
    movq %rax, -152(%rbp)
  # t11 = t12 == t16
    movq -120(%rbp), %rax
    movq -152(%rbp), %r10
    cmpq %r10, %rax
    sete %al
    movzbq %al, %rax
    movq %rax, -112(%rbp)
  # t10 = t11
    movq -112(%rbp), %rax
    movq %rax, -104(%rbp)
  # t17 = !t10
    movq -104(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -160(%rbp)
  # cjump t17 label _endAndGroupInt_getInverse0
    movq -160(%rbp), %rax
    testq %rax, %rax
    jnz _endAndGroupInt_getInverse0
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t20 = this.operator
    movq 16(%rbp), %rax
    movq 8(%rax), %rax
    movq %rax, -184(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t22 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -200(%rbp)
  # Null check: t22 != Null
    movq -200(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t22.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -200(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t21 = t22[i]
    movq -200(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -192(%rbp)
  # Null check: t20 != Null
    movq -184(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t19 = call t20.call(elt, t21)
    subq $8, %rsp
    movq -192(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -184(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -176(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t23 = this.identity
    movq 16(%rbp), %rax
    movq 24(%rax), %rax
    movq %rax, -208(%rbp)
  # t18 = t19 == t23
    movq -176(%rbp), %rax
    movq -208(%rbp), %r10
    cmpq %r10, %rax
    sete %al
    movzbq %al, %rax
    movq %rax, -168(%rbp)
  # t10 = t18
    movq -168(%rbp), %rax
    movq %rax, -104(%rbp)
  # label _endAndGroupInt_getInverse0
_endAndGroupInt_getInverse0:
  # t9 = t10			#condition for if on line 183
    movq -104(%rbp), %rax
    movq %rax, -96(%rbp)
  # t24 = !t10
    movq -104(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -216(%rbp)
  # cjump t24 label _endIfGroupInt_getInverse1
    movq -216(%rbp), %rax
    testq %rax, %rax
    jnz _endIfGroupInt_getInverse1
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t26 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -232(%rbp)
  # Null check: t26 != Null
    movq -232(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t26.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -232(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t25 = t26[i]
    movq -232(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -224(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t27 = this.inverses
    movq 16(%rbp), %rax
    movq 40(%rax), %rax
    movq %rax, -240(%rbp)
  # Null check: t27 != Null
    movq -240(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= index < t27.length
    movq 32(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -240(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t27[index] = t25
    movq -240(%rbp), %rax
    movq 32(%rbp), %r10
    movq -224(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t29 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -256(%rbp)
  # Null check: t29 != Null
    movq -256(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t29.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -256(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t28 = t29[i]
    movq -256(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -248(%rbp)
  # return t28
    movq -248(%rbp), %rax
    jmp __method_GroupInt.getInverse_epilogue
  # label _endIfGroupInt_getInverse1
_endIfGroupInt_getInverse1:
  # t30 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -264(%rbp)
  # i = t30
    movq -264(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileGroupInt_getInverse0
    jmp _beginWhileGroupInt_getInverse0
  # label _endWhileGroupInt_getInverse0
_endWhileGroupInt_getInverse0:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t31 = this.hasInverse
    movq 16(%rbp), %rax
    movq 48(%rax), %rax
    movq %rax, -272(%rbp)
  # Null check: t31 != Null
    movq -272(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= index < t31.length
    movq 32(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -272(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t31[index] = false
    movq -272(%rbp), %rax
    movq 32(%rbp), %r10
    movq $0, %r11
    movq %r11, (%rax,%r10,8)
  # return Null
    movq $0, %rax
    jmp __method_GroupInt.getInverse_epilogue
__method_GroupInt.getInverse_epilogue:
    addq $272, %rsp
    popq %rbp
    retq

__method_GroupInt.isElement:
    pushq %rbp
    movq %rsp, %rbp
    subq $112, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # label _beginWhileGroupInt_isElement0
_beginWhileGroupInt_isElement0:
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -48(%rbp)
  # Null check: t3 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2= t3.length
    movq -48(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -40(%rbp)
  # t1 = i < t2
    movq -8(%rbp), %rax
    movq -40(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -32(%rbp)
  # t0 = t1			#condition for while loop on line 200
    movq -32(%rbp), %rax
    movq %rax, -24(%rbp)
  # t4 = !t1
    movq -32(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -56(%rbp)
  # cjump t4 label _endWhileGroupInt_isElement0			#test for while loop on line 200
    movq -56(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupInt_isElement0
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8 = this.elements
    movq 16(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -88(%rbp)
  # Null check: t8 != Null
    movq -88(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < t8.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -88(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t7 = t8[i]
    movq -88(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -80(%rbp)
  # t6 = t7 == elt
    movq -80(%rbp), %rax
    movq 24(%rbp), %r10
    cmpq %r10, %rax
    sete %al
    movzbq %al, %rax
    movq %rax, -72(%rbp)
  # t5 = t6			#condition for if on line 201
    movq -72(%rbp), %rax
    movq %rax, -64(%rbp)
  # t9 = !t6
    movq -72(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -96(%rbp)
  # cjump t9 label _endIfGroupInt_isElement0
    movq -96(%rbp), %rax
    testq %rax, %rax
    jnz _endIfGroupInt_isElement0
  # return true
    movq $1, %rax
    jmp __method_GroupInt.isElement_epilogue
  # label _endIfGroupInt_isElement0
_endIfGroupInt_isElement0:
  # t10 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -104(%rbp)
  # i = t10
    movq -104(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileGroupInt_isElement0
    jmp _beginWhileGroupInt_isElement0
  # label _endWhileGroupInt_isElement0
_endWhileGroupInt_isElement0:
  # return false
    movq $0, %rax
    jmp __method_GroupInt.isElement_epilogue
__method_GroupInt.isElement_epilogue:
    addq $112, %rsp
    popq %rbp
    retq

__method_GroupInt.printInt:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # call Library.print(message)
    movq 24(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # call Library.printi(i)
    movq 32(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # call Library.println("")
    leaq __ic_string_lit_18(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_GroupInt.printInt_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_GroupInt.printInts:
    pushq %rbp
    movq %rsp, %rbp
    subq $112, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # label _beginWhileGroupInt_printInts0
_beginWhileGroupInt_printInts0:
  # Null check: ints != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2= ints.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -40(%rbp)
  # t1 = i < t2
    movq -8(%rbp), %rax
    movq -40(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -32(%rbp)
  # t0 = t1			#condition for while loop on line 225
    movq -32(%rbp), %rax
    movq %rax, -24(%rbp)
  # t3 = !t1
    movq -32(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -48(%rbp)
  # cjump t3 label _endWhileGroupInt_printInts0			#test for while loop on line 225
    movq -48(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupInt_printInts0
  # Null check: ints != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < ints.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t4 = ints[i]
    movq 24(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -56(%rbp)
  # call Library.printi(t4)
    movq -56(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printi
    addq $8, %rsp
  # Null check: ints != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8= ints.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -88(%rbp)
  # t7 = t8 - 1
    movq -88(%rbp), %rax
    movq $1, %r10
    subq %r10, %rax
    movq %rax, -80(%rbp)
  # t6 = i < t7
    movq -8(%rbp), %rax
    movq -80(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -72(%rbp)
  # t5 = t6			#condition for if on line 227
    movq -72(%rbp), %rax
    movq %rax, -64(%rbp)
  # t9 = !t6
    movq -72(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -96(%rbp)
  # cjump t9 label _endIfGroupInt_printInts0
    movq -96(%rbp), %rax
    testq %rax, %rax
    jnz _endIfGroupInt_printInts0
  # call Library.print(", ")
    leaq __ic_string_lit_19(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # label _endIfGroupInt_printInts0
_endIfGroupInt_printInts0:
  # t10 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -104(%rbp)
  # i = t10
    movq -104(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileGroupInt_printInts0
    jmp _beginWhileGroupInt_printInts0
  # label _endWhileGroupInt_printInts0
_endWhileGroupInt_printInts0:
  # call Library.println("")
    leaq __ic_string_lit_20(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_GroupInt.printInts_epilogue:
    addq $112, %rsp
    popq %rbp
    retq

__method_GroupIntDriver.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.testZnZ(5, "5")
    subq $8, %rsp
    leaq __ic_string_lit_21(%rip), %rax
    pushq %rax
    pushq $5
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *16(%rax)
    addq $32, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.testZnZ(8, "8")
    subq $8, %rsp
    leaq __ic_string_lit_22(%rip), %rax
    pushq %rax
    pushq $8
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *16(%rax)
    addq $32, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.testRandom(6, "6")
    subq $8, %rsp
    leaq __ic_string_lit_23(%rip), %rax
    pushq %rax
    pushq $6
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *24(%rax)
    addq $32, %rsp
__method_GroupIntDriver.main_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: GroupIntDriver
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store GroupIntDriver's vtable pointer in new object instance.
    leaq __GroupIntDriver_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for GroupIntDriver.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call GroupIntDriver.main
    callq __method_GroupIntDriver.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret

__method_GroupIntDriver.testOneGroup:
    pushq %rbp
    movq %rsp, %rbp
    subq $112, %rsp
  # Null check: group != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1 = group.name
    movq 24(%rbp), %rax
    movq 16(%rax), %rax
    movq %rax, -24(%rbp)
  # t0 = call Library.stringCat("Testing group ", t1)
    leaq __ic_string_lit_24(%rip), %rdi
    movq %rdi, %rdi
    movq -24(%rbp), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -16(%rbp)
  # call Library.println(t0)
    movq -16(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # Null check: group != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = call group.isGroup()
    subq $8, %rsp
    movq 24(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *24(%rax)
    addq $16, %rsp
    movq %rax, -48(%rbp)
  # t3 = !t4
    movq -48(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -40(%rbp)
  # t2 = t3			#condition for if on line 254
    movq -40(%rbp), %rax
    movq %rax, -32(%rbp)
  # t5 = !t3
    movq -40(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -56(%rbp)
  # cjump t5 label _endIfGroupIntDriver_testOneGroup0
    movq -56(%rbp), %rax
    testq %rax, %rax
    jnz _endIfGroupIntDriver_testOneGroup0
  # Null check: group != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8 = group.name
    movq 24(%rbp), %rax
    movq 16(%rax), %rax
    movq %rax, -80(%rbp)
  # t7 = call Library.stringCat("Error: ", t8)
    leaq __ic_string_lit_25(%rip), %rdi
    movq %rdi, %rdi
    movq -80(%rbp), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -72(%rbp)
  # t6 = call Library.stringCat(t7, " is not a group. Group Elements: ")
    movq -72(%rbp), %rdi
    movq %rdi, %rdi
    leaq __ic_string_lit_26(%rip), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -64(%rbp)
  # call Library.print(t6)
    movq -64(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: group != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t9 = group.elements
    movq 24(%rbp), %rax
    movq 0(%rax), %rax
    movq %rax, -88(%rbp)
  # Null check: group != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call group.printInts(t9)
    movq -88(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *88(%rax)
    addq $16, %rsp
  # call Library.println("")
    leaq __ic_string_lit_27(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # return
    jmp __method_GroupIntDriver.testOneGroup_epilogue
  # label _endIfGroupIntDriver_testOneGroup0
_endIfGroupIntDriver_testOneGroup0:
  # Null check: group != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t11 = group.name
    movq 24(%rbp), %rax
    movq 16(%rax), %rax
    movq %rax, -104(%rbp)
  # t10 = call Library.stringCat(t11, " is a group!")
    movq -104(%rbp), %rdi
    movq %rdi, %rdi
    leaq __ic_string_lit_28(%rip), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -96(%rbp)
  # call Library.println(t10)
    movq -96(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # Null check: group != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call group.printSelf()
    subq $8, %rsp
    movq 24(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *16(%rax)
    addq $16, %rsp
__method_GroupIntDriver.testOneGroup_epilogue:
    addq $112, %rsp
    popq %rbp
    retq

__method_GroupIntDriver.testZnZ:
    pushq %rbp
    movq %rsp, %rbp
    subq $128, %rsp
  # t1 = new GroupIntDriver_testZnZ_znzOp_Closure()
    movq $24, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __GroupIntDriver_testZnZ_znzOp_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -56(%rbp)
  # Null check: t1 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(n, nName)
    subq $8, %rsp
    movq 32(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -56(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -48(%rbp)
  # znzOp = t0
    movq -48(%rbp), %rax
    movq %rax, -16(%rbp)
  # Size check: n >= 0			
    movq 24(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t2 = new [n]
    movq 24(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -64(%rbp)
  # znzElts = t2
    movq -64(%rbp), %rax
    movq %rax, -24(%rbp)
  # i = 0
    movq $0, %rax
    movq %rax, -32(%rbp)
  # label _beginWhileGroupIntDriver_testZnZ0
_beginWhileGroupIntDriver_testZnZ0:
  # t4 = i < n
    movq -32(%rbp), %rax
    movq 24(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -80(%rbp)
  # t3 = t4			#condition for while loop on line 277
    movq -80(%rbp), %rax
    movq %rax, -72(%rbp)
  # t5 = !t4
    movq -80(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -88(%rbp)
  # cjump t5 label _endWhileGroupIntDriver_testZnZ0			#test for while loop on line 277
    movq -88(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupIntDriver_testZnZ0
  # Null check: znzElts != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < znzElts.length
    movq -32(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # znzElts[i] = i
    movq -24(%rbp), %rax
    movq -32(%rbp), %r10
    movq -32(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t6 = i + 1
    movq -32(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -96(%rbp)
  # i = t6
    movq -96(%rbp), %rax
    movq %rax, -32(%rbp)
  # jump label _beginWhileGroupIntDriver_testZnZ0
    jmp _beginWhileGroupIntDriver_testZnZ0
  # label _endWhileGroupIntDriver_testZnZ0
_endWhileGroupIntDriver_testZnZ0:
  # t7 = new GroupInt()
    movq $64, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __GroupInt_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -104(%rbp)
  # znz = t7
    movq -104(%rbp), %rax
    movq %rax, -8(%rbp)
  # Null check: znz != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call znz.init(znzElts, znzOp)
    subq $8, %rsp
    movq -16(%rbp), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
  # t9 = call Library.stringCat("Z/", nName)
    leaq __ic_string_lit_29(%rip), %rdi
    movq %rdi, %rdi
    movq 32(%rbp), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -120(%rbp)
  # t8 = call Library.stringCat(t9, "Z")
    movq -120(%rbp), %rdi
    movq %rdi, %rdi
    leaq __ic_string_lit_30(%rip), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -112(%rbp)
  # Null check: znz != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call znz.setName(t8)
    movq -112(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.testOneGroup(znz)
    movq -8(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
__method_GroupIntDriver.testZnZ_epilogue:
    addq $128, %rsp
    popq %rbp
    retq

__method_GroupIntDriver.testRandom:
    pushq %rbp
    movq %rsp, %rbp
    subq $128, %rsp
  # t1 = new GroupIntDriver_testRandom_randOp_Closure()
    movq $24, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __GroupIntDriver_testRandom_randOp_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -56(%rbp)
  # Null check: t1 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(n, nName)
    subq $8, %rsp
    movq 32(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -56(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -48(%rbp)
  # randOp = t0
    movq -48(%rbp), %rax
    movq %rax, -16(%rbp)
  # Size check: n >= 0			
    movq 24(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t2 = new [n]
    movq 24(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -64(%rbp)
  # randElts = t2
    movq -64(%rbp), %rax
    movq %rax, -24(%rbp)
  # i = 0
    movq $0, %rax
    movq %rax, -32(%rbp)
  # label _beginWhileGroupIntDriver_testRandom0
_beginWhileGroupIntDriver_testRandom0:
  # t4 = i < n
    movq -32(%rbp), %rax
    movq 24(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -80(%rbp)
  # t3 = t4			#condition for while loop on line 301
    movq -80(%rbp), %rax
    movq %rax, -72(%rbp)
  # t5 = !t4
    movq -80(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -88(%rbp)
  # cjump t5 label _endWhileGroupIntDriver_testRandom0			#test for while loop on line 301
    movq -88(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileGroupIntDriver_testRandom0
  # t7 = n + 1
    movq 24(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -104(%rbp)
  # t6 = call Library.random(t7)
    movq -104(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_random
    addq $8, %rsp
    movq %rax, -96(%rbp)
  # Null check: randElts != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < randElts.length
    movq -32(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # randElts[i] = t6
    movq -24(%rbp), %rax
    movq -32(%rbp), %r10
    movq -96(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t8 = i + 1
    movq -32(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -112(%rbp)
  # i = t8
    movq -112(%rbp), %rax
    movq %rax, -32(%rbp)
  # jump label _beginWhileGroupIntDriver_testRandom0
    jmp _beginWhileGroupIntDriver_testRandom0
  # label _endWhileGroupIntDriver_testRandom0
_endWhileGroupIntDriver_testRandom0:
  # t9 = new GroupInt()
    movq $64, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __GroupInt_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -120(%rbp)
  # random = t9
    movq -120(%rbp), %rax
    movq %rax, -8(%rbp)
  # Null check: random != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call random.init(randElts, randOp)
    subq $8, %rsp
    movq -16(%rbp), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
  # t10 = call Library.stringCat("Random size ", nName)
    leaq __ic_string_lit_31(%rip), %rdi
    movq %rdi, %rdi
    movq 32(%rbp), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -128(%rbp)
  # Null check: random != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call random.setName(t10)
    movq -128(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.testOneGroup(random)
    movq -8(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
__method_GroupIntDriver.testRandom_epilogue:
    addq $128, %rsp
    popq %rbp
    retq
