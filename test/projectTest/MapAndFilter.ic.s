  # Compiled by icc from test/projectTest/MapAndFilter.ic
  # At Mon May 16 13:31:21 EDT 2016

.data
  # string literals
    .align 8
    .quad 0
__ic_string_lit_0:
    .ascii""

    .align 8
    .quad 6
__ic_string_lit_1:
    .ascii"Hello "

    .align 8
    .quad 5
__ic_string_lit_2:
    .ascii"world"

    .align 8
    .quad 9
__ic_string_lit_3:
    .ascii"compilers"

    .align 8
    .quad 2
__ic_string_lit_4:
    .ascii"IC"

    .align 8
    .quad 8
__ic_string_lit_5:
    .ascii"closures"

    .align 8
    .quad 6
__ic_string_lit_6:
    .ascii"CS 301"

    .align 8
    .quad 14
__ic_string_lit_7:
    .ascii"***Original***"

    .align 8
    .quad 15
__ic_string_lit_8:
    .ascii"Original ints: "

    .align 8
    .quad 18
__ic_string_lit_9:
    .ascii"Original strings: "

    .align 8
    .quad 16
__ic_string_lit_10:
    .ascii"Original bools: "

    .align 8
    .quad 0
__ic_string_lit_11:
    .ascii""

    .align 8
    .quad 17
__ic_string_lit_12:
    .ascii"***Testing map***"

    .align 8
    .quad 12
__ic_string_lit_13:
    .ascii"mappedInts: "

    .align 8
    .quad 12
__ic_string_lit_14:
    .ascii"mappedStrs: "

    .align 8
    .quad 13
__ic_string_lit_15:
    .ascii"mappedBools: "

    .align 8
    .quad 0
__ic_string_lit_16:
    .ascii""

    .align 8
    .quad 20
__ic_string_lit_17:
    .ascii"***Testing filter***"

    .align 8
    .quad 14
__ic_string_lit_18:
    .ascii"filteredInts: "

    .align 8
    .quad 14
__ic_string_lit_19:
    .ascii"filteredStrs: "

    .align 8
    .quad 15
__ic_string_lit_20:
    .ascii"filteredBools: "

    .align 8
    .quad 0
__ic_string_lit_21:
    .ascii""

    .align 8
    .quad 2
__ic_string_lit_22:
    .ascii", "

    .align 8
    .quad 0
__ic_string_lit_23:
    .ascii""

    .align 8
    .quad 2
__ic_string_lit_24:
    .ascii", "

    .align 8
    .quad 0
__ic_string_lit_25:
    .ascii""

    .align 8
    .quad 2
__ic_string_lit_26:
    .ascii", "

    .align 8
    .quad 0
__ic_string_lit_27:
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

  # vtable for class PARAMS__int_array_PARAMS__int__RETURN__int__RETURN__int_array_Template
    .align 8
__PARAMS__int_array_PARAMS__int__RETURN__int__RETURN__int_array_Template_vtable:
    .quad __method_PARAMS__int_array_PARAMS__int__RETURN__int__RETURN__int_array_Template.call
  # vtable for class PARAMS__int__RETURN__int_Template
    .align 8
__PARAMS__int__RETURN__int_Template_vtable:
    .quad __method_PARAMS__int__RETURN__int_Template.call
  # vtable for class PARAMS__string_array_PARAMS__string__RETURN__string__RETURN__string_array_Template
    .align 8
__PARAMS__string_array_PARAMS__string__RETURN__string__RETURN__string_array_Template_vtable:
    .quad __method_PARAMS__string_array_PARAMS__string__RETURN__string__RETURN__string_array_Template.call
  # vtable for class PARAMS__string__RETURN__string_Template
    .align 8
__PARAMS__string__RETURN__string_Template_vtable:
    .quad __method_PARAMS__string__RETURN__string_Template.call
  # vtable for class PARAMS__boolean_array_PARAMS__boolean__RETURN__boolean__RETURN__boolean_array_Template
    .align 8
__PARAMS__boolean_array_PARAMS__boolean__RETURN__boolean__RETURN__boolean_array_Template_vtable:
    .quad __method_PARAMS__boolean_array_PARAMS__boolean__RETURN__boolean__RETURN__boolean_array_Template.call
  # vtable for class PARAMS__boolean__RETURN__boolean_Template
    .align 8
__PARAMS__boolean__RETURN__boolean_Template_vtable:
    .quad __method_PARAMS__boolean__RETURN__boolean_Template.call
  # vtable for class PARAMS__int_array_PARAMS__int__RETURN__boolean__RETURN__int_array_Template
    .align 8
__PARAMS__int_array_PARAMS__int__RETURN__boolean__RETURN__int_array_Template_vtable:
    .quad __method_PARAMS__int_array_PARAMS__int__RETURN__boolean__RETURN__int_array_Template.call
  # vtable for class PARAMS__int__RETURN__boolean_Template
    .align 8
__PARAMS__int__RETURN__boolean_Template_vtable:
    .quad __method_PARAMS__int__RETURN__boolean_Template.call
  # vtable for class PARAMS__string_array_PARAMS__string__RETURN__boolean__RETURN__string_array_Template
    .align 8
__PARAMS__string_array_PARAMS__string__RETURN__boolean__RETURN__string_array_Template_vtable:
    .quad __method_PARAMS__string_array_PARAMS__string__RETURN__boolean__RETURN__string_array_Template.call
  # vtable for class PARAMS__string__RETURN__boolean_Template
    .align 8
__PARAMS__string__RETURN__boolean_Template_vtable:
    .quad __method_PARAMS__string__RETURN__boolean_Template.call
  # vtable for class MapAndFilter_testMap_mapInts_Closure
    .align 8
__MapAndFilter_testMap_mapInts_Closure_vtable:
    .quad __method_MapAndFilter_testMap_mapInts_Closure.call
    .quad __method_MapAndFilter_testMap_mapInts_Closure.create
  # vtable for class MapAndFilter_testMap_mapStrings_Closure
    .align 8
__MapAndFilter_testMap_mapStrings_Closure_vtable:
    .quad __method_MapAndFilter_testMap_mapStrings_Closure.call
    .quad __method_MapAndFilter_testMap_mapStrings_Closure.create
  # vtable for class MapAndFilter_testMap_mapBools_Closure
    .align 8
__MapAndFilter_testMap_mapBools_Closure_vtable:
    .quad __method_MapAndFilter_testMap_mapBools_Closure.call
    .quad __method_MapAndFilter_testMap_mapBools_Closure.create
  # vtable for class MapAndFilter_testMap_boolFcn_Closure
    .align 8
__MapAndFilter_testMap_boolFcn_Closure_vtable:
    .quad __method_MapAndFilter_testMap_boolFcn_Closure.call
    .quad __method_MapAndFilter_testMap_boolFcn_Closure.create
  # vtable for class MapAndFilter_testMap_anon0_Closure
    .align 8
__MapAndFilter_testMap_anon0_Closure_vtable:
    .quad __method_MapAndFilter_testMap_anon0_Closure.call
    .quad __method_MapAndFilter_testMap_anon0_Closure.create
  # vtable for class MapAndFilter_testFilter_filterInts_Closure
    .align 8
__MapAndFilter_testFilter_filterInts_Closure_vtable:
    .quad __method_MapAndFilter_testFilter_filterInts_Closure.call
    .quad __method_MapAndFilter_testFilter_filterInts_Closure.create
  # vtable for class MapAndFilter_testFilter_filterStrings_Closure
    .align 8
__MapAndFilter_testFilter_filterStrings_Closure_vtable:
    .quad __method_MapAndFilter_testFilter_filterStrings_Closure.call
    .quad __method_MapAndFilter_testFilter_filterStrings_Closure.create
  # vtable for class MapAndFilter_testFilter_filterBools_Closure
    .align 8
__MapAndFilter_testFilter_filterBools_Closure_vtable:
    .quad __method_MapAndFilter_testFilter_filterBools_Closure.call
    .quad __method_MapAndFilter_testFilter_filterBools_Closure.create
  # vtable for class MapAndFilter_testFilter_anon1_Closure
    .align 8
__MapAndFilter_testFilter_anon1_Closure_vtable:
    .quad __method_MapAndFilter_testFilter_anon1_Closure.call
    .quad __method_MapAndFilter_testFilter_anon1_Closure.create
  # vtable for class MapAndFilter_testFilter_anon2_Closure
    .align 8
__MapAndFilter_testFilter_anon2_Closure_vtable:
    .quad __method_MapAndFilter_testFilter_anon2_Closure.call
    .quad __method_MapAndFilter_testFilter_anon2_Closure.create
  # vtable for class MapAndFilter_testFilter_anon3_Closure
    .align 8
__MapAndFilter_testFilter_anon3_Closure_vtable:
    .quad __method_MapAndFilter_testFilter_anon3_Closure.call
    .quad __method_MapAndFilter_testFilter_anon3_Closure.create
  # vtable for class MapAndFilter_makeStringFcn_anon4_Closure
    .align 8
__MapAndFilter_makeStringFcn_anon4_Closure_vtable:
    .quad __method_MapAndFilter_makeStringFcn_anon4_Closure.call
    .quad __method_MapAndFilter_makeStringFcn_anon4_Closure.create
  # vtable for class MapAndFilter
    .align 8
__MapAndFilter_vtable:
    .quad __method_MapAndFilter.main
    .quad __method_MapAndFilter.testMap
    .quad __method_MapAndFilter.testFilter
    .quad __method_MapAndFilter.makeStringFcn
    .quad __method_MapAndFilter.printInts
    .quad __method_MapAndFilter.printStrings
    .quad __method_MapAndFilter.printBools

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

__method_PARAMS__int_array_PARAMS__int__RETURN__int__RETURN__int_array_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return Null
    movq $0, %rax
    jmp __method_PARAMS__int_array_PARAMS__int__RETURN__int__RETURN__int_array_Template.call_epilogue
__method_PARAMS__int_array_PARAMS__int__RETURN__int__RETURN__int_array_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__int__RETURN__int_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return 0
    movq $0, %rax
    jmp __method_PARAMS__int__RETURN__int_Template.call_epilogue
__method_PARAMS__int__RETURN__int_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__string_array_PARAMS__string__RETURN__string__RETURN__string_array_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return Null
    movq $0, %rax
    jmp __method_PARAMS__string_array_PARAMS__string__RETURN__string__RETURN__string_array_Template.call_epilogue
__method_PARAMS__string_array_PARAMS__string__RETURN__string__RETURN__string_array_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__string__RETURN__string_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return ""
    leaq __ic_string_lit_0(%rip), %rax
    jmp __method_PARAMS__string__RETURN__string_Template.call_epilogue
__method_PARAMS__string__RETURN__string_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__boolean_array_PARAMS__boolean__RETURN__boolean__RETURN__boolean_array_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return Null
    movq $0, %rax
    jmp __method_PARAMS__boolean_array_PARAMS__boolean__RETURN__boolean__RETURN__boolean_array_Template.call_epilogue
__method_PARAMS__boolean_array_PARAMS__boolean__RETURN__boolean__RETURN__boolean_array_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__boolean__RETURN__boolean_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return true
    movq $1, %rax
    jmp __method_PARAMS__boolean__RETURN__boolean_Template.call_epilogue
__method_PARAMS__boolean__RETURN__boolean_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__int_array_PARAMS__int__RETURN__boolean__RETURN__int_array_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return Null
    movq $0, %rax
    jmp __method_PARAMS__int_array_PARAMS__int__RETURN__boolean__RETURN__int_array_Template.call_epilogue
__method_PARAMS__int_array_PARAMS__int__RETURN__boolean__RETURN__int_array_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__int__RETURN__boolean_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return true
    movq $1, %rax
    jmp __method_PARAMS__int__RETURN__boolean_Template.call_epilogue
__method_PARAMS__int__RETURN__boolean_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__string_array_PARAMS__string__RETURN__boolean__RETURN__string_array_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return Null
    movq $0, %rax
    jmp __method_PARAMS__string_array_PARAMS__string__RETURN__boolean__RETURN__string_array_Template.call_epilogue
__method_PARAMS__string_array_PARAMS__string__RETURN__boolean__RETURN__string_array_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_PARAMS__string__RETURN__boolean_Template.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return true
    movq $1, %rax
    jmp __method_PARAMS__string__RETURN__boolean_Template.call_epilogue
__method_PARAMS__string__RETURN__boolean_Template.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testMap_mapInts_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.ints = ints
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
  # t1.strs = strs
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: t2 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.bools = bools
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # return t3
    movq -40(%rbp), %rax
    jmp __method_MapAndFilter_testMap_mapInts_Closure.create_epilogue
__method_MapAndFilter_testMap_mapInts_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testMap_mapInts_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $96, %rsp
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -40(%rbp)
  # Size check: t1 >= 0			
    movq -40(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [t1]
    movq -40(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -32(%rbp)
  # result = t0
    movq -32(%rbp), %rax
    movq %rax, -8(%rbp)
  # i = 0
    movq $0, %rax
    movq %rax, -16(%rbp)
  # label _beginWhileMapAndFilter_testMap_mapInts_Closure_call0
_beginWhileMapAndFilter_testMap_mapInts_Closure_call0:
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -64(%rbp)
  # t3 = i < t4
    movq -16(%rbp), %rax
    movq -64(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -56(%rbp)
  # t2 = t3			#condition for while loop on line 38
    movq -56(%rbp), %rax
    movq %rax, -48(%rbp)
  # t5 = !t3
    movq -56(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -72(%rbp)
  # cjump t5 label _endWhileMapAndFilter_testMap_mapInts_Closure_call0			#test for while loop on line 38
    movq -72(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_testMap_mapInts_Closure_call0
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < arr.length
    movq -16(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t7 = arr[i]
    movq 24(%rbp), %rax
    movq -16(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -88(%rbp)
  # Null check: fcn != Null
    movq 32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6 = call fcn.call(t7)
    movq -88(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -80(%rbp)
  # Null check: result != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < result.length
    movq -16(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # result[i] = t6
    movq -8(%rbp), %rax
    movq -16(%rbp), %r10
    movq -80(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t8 = i + 1
    movq -16(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -96(%rbp)
  # i = t8
    movq -96(%rbp), %rax
    movq %rax, -16(%rbp)
  # jump label _beginWhileMapAndFilter_testMap_mapInts_Closure_call0
    jmp _beginWhileMapAndFilter_testMap_mapInts_Closure_call0
  # label _endWhileMapAndFilter_testMap_mapInts_Closure_call0
_endWhileMapAndFilter_testMap_mapInts_Closure_call0:
  # return result
    movq -8(%rbp), %rax
    jmp __method_MapAndFilter_testMap_mapInts_Closure.call_epilogue
__method_MapAndFilter_testMap_mapInts_Closure.call_epilogue:
    addq $96, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testMap_mapStrings_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.ints = ints
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
  # t1.strs = strs
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: t2 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.bools = bools
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # return t3
    movq -40(%rbp), %rax
    jmp __method_MapAndFilter_testMap_mapStrings_Closure.create_epilogue
__method_MapAndFilter_testMap_mapStrings_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testMap_mapStrings_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $96, %rsp
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -40(%rbp)
  # Size check: t1 >= 0			
    movq -40(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [t1]
    movq -40(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -32(%rbp)
  # result = t0
    movq -32(%rbp), %rax
    movq %rax, -8(%rbp)
  # i = 0
    movq $0, %rax
    movq %rax, -16(%rbp)
  # label _beginWhileMapAndFilter_testMap_mapStrings_Closure_call0
_beginWhileMapAndFilter_testMap_mapStrings_Closure_call0:
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -64(%rbp)
  # t3 = i < t4
    movq -16(%rbp), %rax
    movq -64(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -56(%rbp)
  # t2 = t3			#condition for while loop on line 50
    movq -56(%rbp), %rax
    movq %rax, -48(%rbp)
  # t5 = !t3
    movq -56(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -72(%rbp)
  # cjump t5 label _endWhileMapAndFilter_testMap_mapStrings_Closure_call0			#test for while loop on line 50
    movq -72(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_testMap_mapStrings_Closure_call0
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < arr.length
    movq -16(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t7 = arr[i]
    movq 24(%rbp), %rax
    movq -16(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -88(%rbp)
  # Null check: fcn != Null
    movq 32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6 = call fcn.call(t7)
    movq -88(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -80(%rbp)
  # Null check: result != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < result.length
    movq -16(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # result[i] = t6
    movq -8(%rbp), %rax
    movq -16(%rbp), %r10
    movq -80(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t8 = i + 1
    movq -16(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -96(%rbp)
  # i = t8
    movq -96(%rbp), %rax
    movq %rax, -16(%rbp)
  # jump label _beginWhileMapAndFilter_testMap_mapStrings_Closure_call0
    jmp _beginWhileMapAndFilter_testMap_mapStrings_Closure_call0
  # label _endWhileMapAndFilter_testMap_mapStrings_Closure_call0
_endWhileMapAndFilter_testMap_mapStrings_Closure_call0:
  # return result
    movq -8(%rbp), %rax
    jmp __method_MapAndFilter_testMap_mapStrings_Closure.call_epilogue
__method_MapAndFilter_testMap_mapStrings_Closure.call_epilogue:
    addq $96, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testMap_mapBools_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.ints = ints
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
  # t1.strs = strs
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: t2 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.bools = bools
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # return t3
    movq -40(%rbp), %rax
    jmp __method_MapAndFilter_testMap_mapBools_Closure.create_epilogue
__method_MapAndFilter_testMap_mapBools_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testMap_mapBools_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $96, %rsp
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -40(%rbp)
  # Size check: t1 >= 0			
    movq -40(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [t1]
    movq -40(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -32(%rbp)
  # result = t0
    movq -32(%rbp), %rax
    movq %rax, -8(%rbp)
  # i = 0
    movq $0, %rax
    movq %rax, -16(%rbp)
  # label _beginWhileMapAndFilter_testMap_mapBools_Closure_call0
_beginWhileMapAndFilter_testMap_mapBools_Closure_call0:
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -64(%rbp)
  # t3 = i < t4
    movq -16(%rbp), %rax
    movq -64(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -56(%rbp)
  # t2 = t3			#condition for while loop on line 62
    movq -56(%rbp), %rax
    movq %rax, -48(%rbp)
  # t5 = !t3
    movq -56(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -72(%rbp)
  # cjump t5 label _endWhileMapAndFilter_testMap_mapBools_Closure_call0			#test for while loop on line 62
    movq -72(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_testMap_mapBools_Closure_call0
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < arr.length
    movq -16(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t7 = arr[i]
    movq 24(%rbp), %rax
    movq -16(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -88(%rbp)
  # Null check: fcn != Null
    movq 32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6 = call fcn.call(t7)
    movq -88(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -80(%rbp)
  # Null check: result != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < result.length
    movq -16(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # result[i] = t6
    movq -8(%rbp), %rax
    movq -16(%rbp), %r10
    movq -80(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t8 = i + 1
    movq -16(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -96(%rbp)
  # i = t8
    movq -96(%rbp), %rax
    movq %rax, -16(%rbp)
  # jump label _beginWhileMapAndFilter_testMap_mapBools_Closure_call0
    jmp _beginWhileMapAndFilter_testMap_mapBools_Closure_call0
  # label _endWhileMapAndFilter_testMap_mapBools_Closure_call0
_endWhileMapAndFilter_testMap_mapBools_Closure_call0:
  # return result
    movq -8(%rbp), %rax
    jmp __method_MapAndFilter_testMap_mapBools_Closure.call_epilogue
__method_MapAndFilter_testMap_mapBools_Closure.call_epilogue:
    addq $96, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testMap_boolFcn_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.ints = ints
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
  # t1.strs = strs
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: t2 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.bools = bools
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # return t3
    movq -40(%rbp), %rax
    jmp __method_MapAndFilter_testMap_boolFcn_Closure.create_epilogue
__method_MapAndFilter_testMap_boolFcn_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testMap_boolFcn_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # t0 = !b
    movq 24(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_MapAndFilter_testMap_boolFcn_Closure.call_epilogue
__method_MapAndFilter_testMap_boolFcn_Closure.call_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testMap_anon0_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $96, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.mapInts = mapInts
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
  # t1.boolFcn = boolFcn
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: t2 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.mappedBools = mappedBools
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # Null check: t3 != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3.ints = ints
    movq -40(%rbp), %r10
    movq 48(%rbp), %rax
    movq %rax, 24(%r10)
  # t4 = this
    movq 16(%rbp), %rax
    movq %rax, -48(%rbp)
  # Null check: t4 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4.mappedStrs = mappedStrs
    movq -48(%rbp), %r10
    movq 56(%rbp), %rax
    movq %rax, 32(%r10)
  # t5 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # Null check: t5 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5.strs = strs
    movq -56(%rbp), %r10
    movq 64(%rbp), %rax
    movq %rax, 40(%r10)
  # t6 = this
    movq 16(%rbp), %rax
    movq %rax, -64(%rbp)
  # Null check: t6 != Null
    movq -64(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6.mappedInts = mappedInts
    movq -64(%rbp), %r10
    movq 72(%rbp), %rax
    movq %rax, 48(%r10)
  # t7 = this
    movq 16(%rbp), %rax
    movq %rax, -72(%rbp)
  # Null check: t7 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7.mapBools = mapBools
    movq -72(%rbp), %r10
    movq 80(%rbp), %rax
    movq %rax, 56(%r10)
  # t8 = this
    movq 16(%rbp), %rax
    movq %rax, -80(%rbp)
  # Null check: t8 != Null
    movq -80(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8.mapStrings = mapStrings
    movq -80(%rbp), %r10
    movq 88(%rbp), %rax
    movq %rax, 64(%r10)
  # t9 = this
    movq 16(%rbp), %rax
    movq %rax, -88(%rbp)
  # Null check: t9 != Null
    movq -88(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t9.bools = bools
    movq -88(%rbp), %r10
    movq 96(%rbp), %rax
    movq %rax, 72(%r10)
  # t10 = this
    movq 16(%rbp), %rax
    movq %rax, -96(%rbp)
  # return t10
    movq -96(%rbp), %rax
    jmp __method_MapAndFilter_testMap_anon0_Closure.create_epilogue
__method_MapAndFilter_testMap_anon0_Closure.create_epilogue:
    addq $96, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testMap_anon0_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # t0 = i + 1
    movq 24(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_MapAndFilter_testMap_anon0_Closure.call_epilogue
__method_MapAndFilter_testMap_anon0_Closure.call_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testFilter_filterInts_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.ints = ints
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
  # t1.strs = strs
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: t2 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.bools = bools
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # return t3
    movq -40(%rbp), %rax
    jmp __method_MapAndFilter_testFilter_filterInts_Closure.create_epilogue
__method_MapAndFilter_testFilter_filterInts_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testFilter_filterInts_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $240, %rsp
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -72(%rbp)
  # Size check: t1 >= 0			
    movq -72(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [t1]
    movq -72(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -64(%rbp)
  # filtered = t0
    movq -64(%rbp), %rax
    movq %rax, -8(%rbp)
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -88(%rbp)
  # Size check: t3 >= 0			
    movq -88(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t2 = new [t3]
    movq -88(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -80(%rbp)
  # nonNullIndices = t2
    movq -80(%rbp), %rax
    movq %rax, -24(%rbp)
  # resultLength = 0
    movq $0, %rax
    movq %rax, -32(%rbp)
  # i = 0
    movq $0, %rax
    movq %rax, -40(%rbp)
  # j = 0
    movq $0, %rax
    movq %rax, -48(%rbp)
  # label _beginWhileMapAndFilter_testFilter_filterInts_Closure_call0
_beginWhileMapAndFilter_testFilter_filterInts_Closure_call0:
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -112(%rbp)
  # t5 = i < t6
    movq -40(%rbp), %rax
    movq -112(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -104(%rbp)
  # t4 = t5			#condition for while loop on line 101
    movq -104(%rbp), %rax
    movq %rax, -96(%rbp)
  # t7 = !t5
    movq -104(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -120(%rbp)
  # cjump t7 label _endWhileMapAndFilter_testFilter_filterInts_Closure_call0			#test for while loop on line 101
    movq -120(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_testFilter_filterInts_Closure_call0
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < arr.length
    movq -40(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t10 = arr[i]
    movq 24(%rbp), %rax
    movq -40(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -144(%rbp)
  # Null check: fcn != Null
    movq 32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t9 = call fcn.call(t10)
    movq -144(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -136(%rbp)
  # t8 = t9			#condition for if on line 102
    movq -136(%rbp), %rax
    movq %rax, -128(%rbp)
  # t11 = !t9
    movq -136(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -152(%rbp)
  # cjump t11 label _endIfMapAndFilter_testFilter_filterInts_Closure_call0
    movq -152(%rbp), %rax
    testq %rax, %rax
    jnz _endIfMapAndFilter_testFilter_filterInts_Closure_call0
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < arr.length
    movq -40(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t12 = arr[i]
    movq 24(%rbp), %rax
    movq -40(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -160(%rbp)
  # Null check: filtered != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < filtered.length
    movq -40(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # filtered[i] = t12
    movq -8(%rbp), %rax
    movq -40(%rbp), %r10
    movq -160(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # Null check: nonNullIndices != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= resultLength < nonNullIndices.length
    movq -32(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # nonNullIndices[resultLength] = i
    movq -24(%rbp), %rax
    movq -32(%rbp), %r10
    movq -40(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t13 = resultLength + 1
    movq -32(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -168(%rbp)
  # resultLength = t13
    movq -168(%rbp), %rax
    movq %rax, -32(%rbp)
  # label _endIfMapAndFilter_testFilter_filterInts_Closure_call0
_endIfMapAndFilter_testFilter_filterInts_Closure_call0:
  # t14 = i + 1
    movq -40(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -176(%rbp)
  # i = t14
    movq -176(%rbp), %rax
    movq %rax, -40(%rbp)
  # jump label _beginWhileMapAndFilter_testFilter_filterInts_Closure_call0
    jmp _beginWhileMapAndFilter_testFilter_filterInts_Closure_call0
  # label _endWhileMapAndFilter_testFilter_filterInts_Closure_call0
_endWhileMapAndFilter_testFilter_filterInts_Closure_call0:
  # Size check: resultLength >= 0			
    movq -32(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t15 = new [resultLength]
    movq -32(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -184(%rbp)
  # result = t15
    movq -184(%rbp), %rax
    movq %rax, -16(%rbp)
  # label _beginWhileMapAndFilter_testFilter_filterInts_Closure_call1
_beginWhileMapAndFilter_testFilter_filterInts_Closure_call1:
  # t17 = j < resultLength
    movq -48(%rbp), %rax
    movq -32(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -200(%rbp)
  # t16 = t17			#condition for while loop on line 111
    movq -200(%rbp), %rax
    movq %rax, -192(%rbp)
  # t18 = !t17
    movq -200(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -208(%rbp)
  # cjump t18 label _endWhileMapAndFilter_testFilter_filterInts_Closure_call1			#test for while loop on line 111
    movq -208(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_testFilter_filterInts_Closure_call1
  # Null check: nonNullIndices != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= j < nonNullIndices.length
    movq -48(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t20 = nonNullIndices[j]
    movq -24(%rbp), %rax
    movq -48(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -224(%rbp)
  # Null check: filtered != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= t20 < filtered.length
    movq -224(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t19 = filtered[t20]
    movq -8(%rbp), %rax
    movq -224(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -216(%rbp)
  # Null check: result != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= j < result.length
    movq -48(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -16(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # result[j] = t19
    movq -16(%rbp), %rax
    movq -48(%rbp), %r10
    movq -216(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t21 = j + 1
    movq -48(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -232(%rbp)
  # j = t21
    movq -232(%rbp), %rax
    movq %rax, -48(%rbp)
  # jump label _beginWhileMapAndFilter_testFilter_filterInts_Closure_call1
    jmp _beginWhileMapAndFilter_testFilter_filterInts_Closure_call1
  # label _endWhileMapAndFilter_testFilter_filterInts_Closure_call1
_endWhileMapAndFilter_testFilter_filterInts_Closure_call1:
  # return result
    movq -16(%rbp), %rax
    jmp __method_MapAndFilter_testFilter_filterInts_Closure.call_epilogue
__method_MapAndFilter_testFilter_filterInts_Closure.call_epilogue:
    addq $240, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testFilter_filterStrings_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.ints = ints
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
  # t1.strs = strs
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: t2 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.bools = bools
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # return t3
    movq -40(%rbp), %rax
    jmp __method_MapAndFilter_testFilter_filterStrings_Closure.create_epilogue
__method_MapAndFilter_testFilter_filterStrings_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testFilter_filterStrings_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $240, %rsp
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -72(%rbp)
  # Size check: t1 >= 0			
    movq -72(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [t1]
    movq -72(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -64(%rbp)
  # filtered = t0
    movq -64(%rbp), %rax
    movq %rax, -8(%rbp)
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -88(%rbp)
  # Size check: t3 >= 0			
    movq -88(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t2 = new [t3]
    movq -88(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -80(%rbp)
  # nonNullIndices = t2
    movq -80(%rbp), %rax
    movq %rax, -24(%rbp)
  # resultLength = 0
    movq $0, %rax
    movq %rax, -32(%rbp)
  # i = 0
    movq $0, %rax
    movq %rax, -40(%rbp)
  # j = 0
    movq $0, %rax
    movq %rax, -48(%rbp)
  # label _beginWhileMapAndFilter_testFilter_filterStrings_Closure_call0
_beginWhileMapAndFilter_testFilter_filterStrings_Closure_call0:
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -112(%rbp)
  # t5 = i < t6
    movq -40(%rbp), %rax
    movq -112(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -104(%rbp)
  # t4 = t5			#condition for while loop on line 126
    movq -104(%rbp), %rax
    movq %rax, -96(%rbp)
  # t7 = !t5
    movq -104(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -120(%rbp)
  # cjump t7 label _endWhileMapAndFilter_testFilter_filterStrings_Closure_call0			#test for while loop on line 126
    movq -120(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_testFilter_filterStrings_Closure_call0
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < arr.length
    movq -40(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t10 = arr[i]
    movq 24(%rbp), %rax
    movq -40(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -144(%rbp)
  # Null check: fcn != Null
    movq 32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t9 = call fcn.call(t10)
    movq -144(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -136(%rbp)
  # t8 = t9			#condition for if on line 127
    movq -136(%rbp), %rax
    movq %rax, -128(%rbp)
  # t11 = !t9
    movq -136(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -152(%rbp)
  # cjump t11 label _endIfMapAndFilter_testFilter_filterStrings_Closure_call0
    movq -152(%rbp), %rax
    testq %rax, %rax
    jnz _endIfMapAndFilter_testFilter_filterStrings_Closure_call0
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < arr.length
    movq -40(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t12 = arr[i]
    movq 24(%rbp), %rax
    movq -40(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -160(%rbp)
  # Null check: filtered != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < filtered.length
    movq -40(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # filtered[i] = t12
    movq -8(%rbp), %rax
    movq -40(%rbp), %r10
    movq -160(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # Null check: nonNullIndices != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= resultLength < nonNullIndices.length
    movq -32(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # nonNullIndices[resultLength] = i
    movq -24(%rbp), %rax
    movq -32(%rbp), %r10
    movq -40(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t13 = resultLength + 1
    movq -32(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -168(%rbp)
  # resultLength = t13
    movq -168(%rbp), %rax
    movq %rax, -32(%rbp)
  # label _endIfMapAndFilter_testFilter_filterStrings_Closure_call0
_endIfMapAndFilter_testFilter_filterStrings_Closure_call0:
  # t14 = i + 1
    movq -40(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -176(%rbp)
  # i = t14
    movq -176(%rbp), %rax
    movq %rax, -40(%rbp)
  # jump label _beginWhileMapAndFilter_testFilter_filterStrings_Closure_call0
    jmp _beginWhileMapAndFilter_testFilter_filterStrings_Closure_call0
  # label _endWhileMapAndFilter_testFilter_filterStrings_Closure_call0
_endWhileMapAndFilter_testFilter_filterStrings_Closure_call0:
  # Size check: resultLength >= 0			
    movq -32(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t15 = new [resultLength]
    movq -32(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -184(%rbp)
  # result = t15
    movq -184(%rbp), %rax
    movq %rax, -16(%rbp)
  # label _beginWhileMapAndFilter_testFilter_filterStrings_Closure_call1
_beginWhileMapAndFilter_testFilter_filterStrings_Closure_call1:
  # t17 = j < resultLength
    movq -48(%rbp), %rax
    movq -32(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -200(%rbp)
  # t16 = t17			#condition for while loop on line 136
    movq -200(%rbp), %rax
    movq %rax, -192(%rbp)
  # t18 = !t17
    movq -200(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -208(%rbp)
  # cjump t18 label _endWhileMapAndFilter_testFilter_filterStrings_Closure_call1			#test for while loop on line 136
    movq -208(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_testFilter_filterStrings_Closure_call1
  # Null check: nonNullIndices != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= j < nonNullIndices.length
    movq -48(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t20 = nonNullIndices[j]
    movq -24(%rbp), %rax
    movq -48(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -224(%rbp)
  # Null check: filtered != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= t20 < filtered.length
    movq -224(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t19 = filtered[t20]
    movq -8(%rbp), %rax
    movq -224(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -216(%rbp)
  # Null check: result != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= j < result.length
    movq -48(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -16(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # result[j] = t19
    movq -16(%rbp), %rax
    movq -48(%rbp), %r10
    movq -216(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t21 = j + 1
    movq -48(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -232(%rbp)
  # j = t21
    movq -232(%rbp), %rax
    movq %rax, -48(%rbp)
  # jump label _beginWhileMapAndFilter_testFilter_filterStrings_Closure_call1
    jmp _beginWhileMapAndFilter_testFilter_filterStrings_Closure_call1
  # label _endWhileMapAndFilter_testFilter_filterStrings_Closure_call1
_endWhileMapAndFilter_testFilter_filterStrings_Closure_call1:
  # return result
    movq -16(%rbp), %rax
    jmp __method_MapAndFilter_testFilter_filterStrings_Closure.call_epilogue
__method_MapAndFilter_testFilter_filterStrings_Closure.call_epilogue:
    addq $240, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testFilter_filterBools_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.ints = ints
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
  # t1.strs = strs
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: t2 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.bools = bools
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # return t3
    movq -40(%rbp), %rax
    jmp __method_MapAndFilter_testFilter_filterBools_Closure.create_epilogue
__method_MapAndFilter_testFilter_filterBools_Closure.create_epilogue:
    addq $48, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testFilter_filterBools_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $240, %rsp
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t1= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -72(%rbp)
  # Size check: t1 >= 0			
    movq -72(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [t1]
    movq -72(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -64(%rbp)
  # filtered = t0
    movq -64(%rbp), %rax
    movq %rax, -8(%rbp)
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -88(%rbp)
  # Size check: t3 >= 0			
    movq -88(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t2 = new [t3]
    movq -88(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -80(%rbp)
  # nonNullIndices = t2
    movq -80(%rbp), %rax
    movq %rax, -24(%rbp)
  # resultLength = 0
    movq $0, %rax
    movq %rax, -32(%rbp)
  # i = 0
    movq $0, %rax
    movq %rax, -40(%rbp)
  # j = 0
    movq $0, %rax
    movq %rax, -48(%rbp)
  # label _beginWhileMapAndFilter_testFilter_filterBools_Closure_call0
_beginWhileMapAndFilter_testFilter_filterBools_Closure_call0:
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6= arr.length
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    movq %rax, -112(%rbp)
  # t5 = i < t6
    movq -40(%rbp), %rax
    movq -112(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -104(%rbp)
  # t4 = t5			#condition for while loop on line 151
    movq -104(%rbp), %rax
    movq %rax, -96(%rbp)
  # t7 = !t5
    movq -104(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -120(%rbp)
  # cjump t7 label _endWhileMapAndFilter_testFilter_filterBools_Closure_call0			#test for while loop on line 151
    movq -120(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_testFilter_filterBools_Closure_call0
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < arr.length
    movq -40(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t10 = arr[i]
    movq 24(%rbp), %rax
    movq -40(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -144(%rbp)
  # Null check: fcn != Null
    movq 32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t9 = call fcn.call(t10)
    movq -144(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $16, %rsp
    movq %rax, -136(%rbp)
  # t8 = t9			#condition for if on line 152
    movq -136(%rbp), %rax
    movq %rax, -128(%rbp)
  # t11 = !t9
    movq -136(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -152(%rbp)
  # cjump t11 label _endIfMapAndFilter_testFilter_filterBools_Closure_call0
    movq -152(%rbp), %rax
    testq %rax, %rax
    jnz _endIfMapAndFilter_testFilter_filterBools_Closure_call0
  # Null check: arr != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < arr.length
    movq -40(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t12 = arr[i]
    movq 24(%rbp), %rax
    movq -40(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -160(%rbp)
  # Null check: filtered != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < filtered.length
    movq -40(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # filtered[i] = t12
    movq -8(%rbp), %rax
    movq -40(%rbp), %r10
    movq -160(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # Null check: nonNullIndices != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= resultLength < nonNullIndices.length
    movq -32(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # nonNullIndices[resultLength] = i
    movq -24(%rbp), %rax
    movq -32(%rbp), %r10
    movq -40(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t13 = resultLength + 1
    movq -32(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -168(%rbp)
  # resultLength = t13
    movq -168(%rbp), %rax
    movq %rax, -32(%rbp)
  # label _endIfMapAndFilter_testFilter_filterBools_Closure_call0
_endIfMapAndFilter_testFilter_filterBools_Closure_call0:
  # t14 = i + 1
    movq -40(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -176(%rbp)
  # i = t14
    movq -176(%rbp), %rax
    movq %rax, -40(%rbp)
  # jump label _beginWhileMapAndFilter_testFilter_filterBools_Closure_call0
    jmp _beginWhileMapAndFilter_testFilter_filterBools_Closure_call0
  # label _endWhileMapAndFilter_testFilter_filterBools_Closure_call0
_endWhileMapAndFilter_testFilter_filterBools_Closure_call0:
  # Size check: resultLength >= 0			
    movq -32(%rbp), %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t15 = new [resultLength]
    movq -32(%rbp), %rdi
    callq __LIB_allocateArray
    movq %rax, -184(%rbp)
  # result = t15
    movq -184(%rbp), %rax
    movq %rax, -16(%rbp)
  # label _beginWhileMapAndFilter_testFilter_filterBools_Closure_call1
_beginWhileMapAndFilter_testFilter_filterBools_Closure_call1:
  # t17 = j < resultLength
    movq -48(%rbp), %rax
    movq -32(%rbp), %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -200(%rbp)
  # t16 = t17			#condition for while loop on line 161
    movq -200(%rbp), %rax
    movq %rax, -192(%rbp)
  # t18 = !t17
    movq -200(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -208(%rbp)
  # cjump t18 label _endWhileMapAndFilter_testFilter_filterBools_Closure_call1			#test for while loop on line 161
    movq -208(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_testFilter_filterBools_Closure_call1
  # Null check: nonNullIndices != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= j < nonNullIndices.length
    movq -48(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t20 = nonNullIndices[j]
    movq -24(%rbp), %rax
    movq -48(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -224(%rbp)
  # Null check: filtered != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= t20 < filtered.length
    movq -224(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t19 = filtered[t20]
    movq -8(%rbp), %rax
    movq -224(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -216(%rbp)
  # Null check: result != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= j < result.length
    movq -48(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -16(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # result[j] = t19
    movq -16(%rbp), %rax
    movq -48(%rbp), %r10
    movq -216(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t21 = j + 1
    movq -48(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -232(%rbp)
  # j = t21
    movq -232(%rbp), %rax
    movq %rax, -48(%rbp)
  # jump label _beginWhileMapAndFilter_testFilter_filterBools_Closure_call1
    jmp _beginWhileMapAndFilter_testFilter_filterBools_Closure_call1
  # label _endWhileMapAndFilter_testFilter_filterBools_Closure_call1
_endWhileMapAndFilter_testFilter_filterBools_Closure_call1:
  # return result
    movq -16(%rbp), %rax
    jmp __method_MapAndFilter_testFilter_filterBools_Closure.call_epilogue
__method_MapAndFilter_testFilter_filterBools_Closure.call_epilogue:
    addq $240, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testFilter_anon1_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $96, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.filteredStrs = filteredStrs
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
  # t1.ints = ints
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: t2 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.filterBools = filterBools
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # Null check: t3 != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3.filteredBools = filteredBools
    movq -40(%rbp), %r10
    movq 48(%rbp), %rax
    movq %rax, 24(%r10)
  # t4 = this
    movq 16(%rbp), %rax
    movq %rax, -48(%rbp)
  # Null check: t4 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4.bools = bools
    movq -48(%rbp), %r10
    movq 56(%rbp), %rax
    movq %rax, 32(%r10)
  # t5 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # Null check: t5 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5.filterStrings = filterStrings
    movq -56(%rbp), %r10
    movq 64(%rbp), %rax
    movq %rax, 40(%r10)
  # t6 = this
    movq 16(%rbp), %rax
    movq %rax, -64(%rbp)
  # Null check: t6 != Null
    movq -64(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6.filteredInts = filteredInts
    movq -64(%rbp), %r10
    movq 72(%rbp), %rax
    movq %rax, 48(%r10)
  # t7 = this
    movq 16(%rbp), %rax
    movq %rax, -72(%rbp)
  # Null check: t7 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7.strs = strs
    movq -72(%rbp), %r10
    movq 80(%rbp), %rax
    movq %rax, 56(%r10)
  # t8 = this
    movq 16(%rbp), %rax
    movq %rax, -80(%rbp)
  # Null check: t8 != Null
    movq -80(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8.filterInts = filterInts
    movq -80(%rbp), %r10
    movq 88(%rbp), %rax
    movq %rax, 64(%r10)
  # t9 = this
    movq 16(%rbp), %rax
    movq %rax, -88(%rbp)
  # return t9
    movq -88(%rbp), %rax
    jmp __method_MapAndFilter_testFilter_anon1_Closure.create_epilogue
__method_MapAndFilter_testFilter_anon1_Closure.create_epilogue:
    addq $96, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testFilter_anon1_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # Zero check: 2 != 0
    movq $2, %rax
    testq %rax, %rax
    je __ic_error_handler_div
  # t1 = i % 2
    movq 24(%rbp), %rax
    cqto
    movq $2, %r10
    idivq %r10
    movq %rdx, -24(%rbp)
  # t0 = t1 == 0
    movq -24(%rbp), %rax
    movq $0, %r10
    cmpq %r10, %rax
    sete %al
    movzbq %al, %rax
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_MapAndFilter_testFilter_anon1_Closure.call_epilogue
__method_MapAndFilter_testFilter_anon1_Closure.call_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testFilter_anon2_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $96, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.filteredStrs = filteredStrs
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
  # t1.ints = ints
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: t2 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.filterBools = filterBools
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # Null check: t3 != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3.filteredBools = filteredBools
    movq -40(%rbp), %r10
    movq 48(%rbp), %rax
    movq %rax, 24(%r10)
  # t4 = this
    movq 16(%rbp), %rax
    movq %rax, -48(%rbp)
  # Null check: t4 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4.bools = bools
    movq -48(%rbp), %r10
    movq 56(%rbp), %rax
    movq %rax, 32(%r10)
  # t5 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # Null check: t5 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5.filterStrings = filterStrings
    movq -56(%rbp), %r10
    movq 64(%rbp), %rax
    movq %rax, 40(%r10)
  # t6 = this
    movq 16(%rbp), %rax
    movq %rax, -64(%rbp)
  # Null check: t6 != Null
    movq -64(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6.filteredInts = filteredInts
    movq -64(%rbp), %r10
    movq 72(%rbp), %rax
    movq %rax, 48(%r10)
  # t7 = this
    movq 16(%rbp), %rax
    movq %rax, -72(%rbp)
  # Null check: t7 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7.strs = strs
    movq -72(%rbp), %r10
    movq 80(%rbp), %rax
    movq %rax, 56(%r10)
  # t8 = this
    movq 16(%rbp), %rax
    movq %rax, -80(%rbp)
  # Null check: t8 != Null
    movq -80(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8.filterInts = filterInts
    movq -80(%rbp), %r10
    movq 88(%rbp), %rax
    movq %rax, 64(%r10)
  # t9 = this
    movq 16(%rbp), %rax
    movq %rax, -88(%rbp)
  # return t9
    movq -88(%rbp), %rax
    jmp __method_MapAndFilter_testFilter_anon2_Closure.create_epilogue
__method_MapAndFilter_testFilter_anon2_Closure.create_epilogue:
    addq $96, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testFilter_anon2_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # t1 = call Library.random(7)
    movq $7, %rdi
    subq $8, %rsp
    callq __LIB_random
    addq $8, %rsp
    movq %rax, -24(%rbp)
  # t0 = t1 > 3
    movq -24(%rbp), %rax
    movq $3, %r10
    cmpq %r10, %rax
    setg %al
    movzbq %al, %rax
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_MapAndFilter_testFilter_anon2_Closure.call_epilogue
__method_MapAndFilter_testFilter_anon2_Closure.call_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testFilter_anon3_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $96, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # Null check: t0 != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0.filteredStrs = filteredStrs
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
  # t1.ints = ints
    movq -24(%rbp), %r10
    movq 32(%rbp), %rax
    movq %rax, 8(%r10)
  # t2 = this
    movq 16(%rbp), %rax
    movq %rax, -32(%rbp)
  # Null check: t2 != Null
    movq -32(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2.filterBools = filterBools
    movq -32(%rbp), %r10
    movq 40(%rbp), %rax
    movq %rax, 16(%r10)
  # t3 = this
    movq 16(%rbp), %rax
    movq %rax, -40(%rbp)
  # Null check: t3 != Null
    movq -40(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t3.filteredBools = filteredBools
    movq -40(%rbp), %r10
    movq 48(%rbp), %rax
    movq %rax, 24(%r10)
  # t4 = this
    movq 16(%rbp), %rax
    movq %rax, -48(%rbp)
  # Null check: t4 != Null
    movq -48(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4.bools = bools
    movq -48(%rbp), %r10
    movq 56(%rbp), %rax
    movq %rax, 32(%r10)
  # t5 = this
    movq 16(%rbp), %rax
    movq %rax, -56(%rbp)
  # Null check: t5 != Null
    movq -56(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t5.filterStrings = filterStrings
    movq -56(%rbp), %r10
    movq 64(%rbp), %rax
    movq %rax, 40(%r10)
  # t6 = this
    movq 16(%rbp), %rax
    movq %rax, -64(%rbp)
  # Null check: t6 != Null
    movq -64(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6.filteredInts = filteredInts
    movq -64(%rbp), %r10
    movq 72(%rbp), %rax
    movq %rax, 48(%r10)
  # t7 = this
    movq 16(%rbp), %rax
    movq %rax, -72(%rbp)
  # Null check: t7 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7.strs = strs
    movq -72(%rbp), %r10
    movq 80(%rbp), %rax
    movq %rax, 56(%r10)
  # t8 = this
    movq 16(%rbp), %rax
    movq %rax, -80(%rbp)
  # Null check: t8 != Null
    movq -80(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8.filterInts = filterInts
    movq -80(%rbp), %r10
    movq 88(%rbp), %rax
    movq %rax, 64(%r10)
  # t9 = this
    movq 16(%rbp), %rax
    movq %rax, -88(%rbp)
  # return t9
    movq -88(%rbp), %rax
    jmp __method_MapAndFilter_testFilter_anon3_Closure.create_epilogue
__method_MapAndFilter_testFilter_anon3_Closure.create_epilogue:
    addq $96, %rsp
    popq %rbp
    retq

__method_MapAndFilter_testFilter_anon3_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $0, %rsp
  # return b
    movq 24(%rbp), %rax
    jmp __method_MapAndFilter_testFilter_anon3_Closure.call_epilogue
__method_MapAndFilter_testFilter_anon3_Closure.call_epilogue:
    addq $0, %rsp
    popq %rbp
    retq

__method_MapAndFilter_makeStringFcn_anon4_Closure.create:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # t0 = this
    movq 16(%rbp), %rax
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_MapAndFilter_makeStringFcn_anon4_Closure.create_epilogue
__method_MapAndFilter_makeStringFcn_anon4_Closure.create_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_MapAndFilter_makeStringFcn_anon4_Closure.call:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
  # t0 = call Library.stringCat("Hello ", s)
    leaq __ic_string_lit_1(%rip), %rdi
    movq %rdi, %rdi
    movq 24(%rbp), %rsi
    movq %rsi, %rsi
    subq $8, %rsp
    callq __LIB_stringCat
    addq $8, %rsp
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_MapAndFilter_makeStringFcn_anon4_Closure.call_epilogue
__method_MapAndFilter_makeStringFcn_anon4_Closure.call_epilogue:
    addq $16, %rsp
    popq %rbp
    retq

__method_MapAndFilter.main:
    pushq %rbp
    movq %rsp, %rbp
    subq $112, %rsp
  # Size check: 5 >= 0			
    movq $5, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t0 = new [5]
    movq $5, %rdi
    callq __LIB_allocateArray
    movq %rax, -48(%rbp)
  # ints = t0
    movq -48(%rbp), %rax
    movq %rax, -8(%rbp)
  # Size check: 5 >= 0			
    movq $5, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t1 = new [5]
    movq $5, %rdi
    callq __LIB_allocateArray
    movq %rax, -56(%rbp)
  # strs = t1
    movq -56(%rbp), %rax
    movq %rax, -16(%rbp)
  # Size check: 5 >= 0			
    movq $5, %rax
    cmpq $0, %rax
    jl __ic_error_handler_size
  # t2 = new [5]
    movq $5, %rdi
    callq __LIB_allocateArray
    movq %rax, -64(%rbp)
  # bools = t2
    movq -64(%rbp), %rax
    movq %rax, -24(%rbp)
  # i = 0
    movq $0, %rax
    movq %rax, -32(%rbp)
  # label _beginWhileMapAndFilter_main0
_beginWhileMapAndFilter_main0:
  # t4 = i < 5
    movq -32(%rbp), %rax
    movq $5, %r10
    cmpq %r10, %rax
    setl %al
    movzbq %al, %rax
    movq %rax, -80(%rbp)
  # t3 = t4			#condition for while loop on line 8
    movq -80(%rbp), %rax
    movq %rax, -72(%rbp)
  # t5 = !t4
    movq -80(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -88(%rbp)
  # cjump t5 label _endWhileMapAndFilter_main0			#test for while loop on line 8
    movq -88(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_main0
  # Null check: ints != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < ints.length
    movq -32(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -8(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # ints[i] = i
    movq -8(%rbp), %rax
    movq -32(%rbp), %r10
    movq -32(%rbp), %r11
    movq %r11, (%rax,%r10,8)
  # t7 = call Library.random(5)
    movq $5, %rdi
    subq $8, %rsp
    callq __LIB_random
    addq $8, %rsp
    movq %rax, -104(%rbp)
  # t6 = t7 > 2
    movq -104(%rbp), %rax
    movq $2, %r10
    cmpq %r10, %rax
    setg %al
    movzbq %al, %rax
    movq %rax, -96(%rbp)
  # Null check: bools != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < bools.length
    movq -32(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # bools[i] = t6
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
  # jump label _beginWhileMapAndFilter_main0
    jmp _beginWhileMapAndFilter_main0
  # label _endWhileMapAndFilter_main0
_endWhileMapAndFilter_main0:
  # Null check: strs != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 0 < strs.length
    movq $0, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -16(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # strs[0] = "world"
    movq -16(%rbp), %rax
    movq $0, %r10
    leaq __ic_string_lit_2(%rip), %r11
    movq %r11, (%rax,%r10,8)
  # Null check: strs != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 1 < strs.length
    movq $1, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -16(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # strs[1] = "compilers"
    movq -16(%rbp), %rax
    movq $1, %r10
    leaq __ic_string_lit_3(%rip), %r11
    movq %r11, (%rax,%r10,8)
  # Null check: strs != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 2 < strs.length
    movq $2, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -16(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # strs[2] = "IC"
    movq -16(%rbp), %rax
    movq $2, %r10
    leaq __ic_string_lit_4(%rip), %r11
    movq %r11, (%rax,%r10,8)
  # Null check: strs != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 3 < strs.length
    movq $3, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -16(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # strs[3] = "closures"
    movq -16(%rbp), %rax
    movq $3, %r10
    leaq __ic_string_lit_5(%rip), %r11
    movq %r11, (%rax,%r10,8)
  # Null check: strs != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= 4 < strs.length
    movq $4, %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq -16(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # strs[4] = "CS 301"
    movq -16(%rbp), %rax
    movq $4, %r10
    leaq __ic_string_lit_6(%rip), %r11
    movq %r11, (%rax,%r10,8)
  # call Library.println("***Original***")
    leaq __ic_string_lit_7(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # call Library.print("Original ints: ")
    leaq __ic_string_lit_8(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.printInts(ints)
    movq -8(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *32(%rax)
    addq $16, %rsp
  # call Library.print("Original strings: ")
    leaq __ic_string_lit_9(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.printStrings(strs)
    movq -16(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *40(%rax)
    addq $16, %rsp
  # call Library.print("Original bools: ")
    leaq __ic_string_lit_10(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.printBools(bools)
    movq -24(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *48(%rax)
    addq $16, %rsp
  # call Library.println("")
    leaq __ic_string_lit_11(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.testMap(ints, strs, bools)
    movq -24(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.testFilter(ints, strs, bools)
    movq -24(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *16(%rax)
    addq $32, %rsp
__method_MapAndFilter.main_epilogue:
    addq $112, %rsp
    popq %rbp
    retq

  # Entry point, set up for main method.
.globl __ic_main
__ic_main:
  # Push args array reference to stack.
    pushq %rdi
  # Allocate instance of main class: MapAndFilter
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
  # Store MapAndFilter's vtable pointer in new object instance.
    leaq __MapAndFilter_vtable(%rip), %r10
    movq %r10, -8(%rax)
  # Set up args for MapAndFilter.main
  # Original args array, pushed earlier, is now on top of stack.
  # Push object to become this.
    pushq %rax
  # Call MapAndFilter.main
    callq __method_MapAndFilter.main
  # Cleanup: pop main object and args array
    addq $16, %rsp
    ret

__method_MapAndFilter.testMap:
    pushq %rbp
    movq %rsp, %rbp
    subq $176, %rsp
  # t1 = new MapAndFilter_testMap_mapInts_Closure()
    movq $32, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapAndFilter_testMap_mapInts_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -80(%rbp)
  # Null check: t1 != Null
    movq -80(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(ints, strs, bools)
    movq 40(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -80(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -72(%rbp)
  # mapInts = t0
    movq -72(%rbp), %rax
    movq %rax, -8(%rbp)
  # t3 = new MapAndFilter_testMap_mapStrings_Closure()
    movq $32, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapAndFilter_testMap_mapStrings_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -96(%rbp)
  # Null check: t3 != Null
    movq -96(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = call t3.create(ints, strs, bools)
    movq 40(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -96(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -88(%rbp)
  # mapStrings = t2
    movq -88(%rbp), %rax
    movq %rax, -16(%rbp)
  # t5 = new MapAndFilter_testMap_mapBools_Closure()
    movq $32, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapAndFilter_testMap_mapBools_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -112(%rbp)
  # Null check: t5 != Null
    movq -112(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = call t5.create(ints, strs, bools)
    movq 40(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -112(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -104(%rbp)
  # mapBools = t4
    movq -104(%rbp), %rax
    movq %rax, -24(%rbp)
  # t7 = new MapAndFilter_testMap_boolFcn_Closure()
    movq $32, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapAndFilter_testMap_boolFcn_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -128(%rbp)
  # Null check: t7 != Null
    movq -128(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6 = call t7.create(ints, strs, bools)
    movq 40(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -128(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -120(%rbp)
  # boolFcn = t6
    movq -120(%rbp), %rax
    movq %rax, -32(%rbp)
  # call Library.println("***Testing map***")
    leaq __ic_string_lit_12(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # t10 = new MapAndFilter_testMap_anon0_Closure()
    movq $88, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapAndFilter_testMap_anon0_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -152(%rbp)
  # Null check: t10 != Null
    movq -152(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t9 = call t10.create(mapInts, boolFcn, mappedBools, ints, mappedStrs, strs, mappedInts, mapBools, mapStrings, bools)
    subq $8, %rsp
    movq 40(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -56(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -152(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $96, %rsp
    movq %rax, -144(%rbp)
  # Null check: mapInts != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8 = call mapInts.call(ints, t9)
    subq $8, %rsp
    movq -144(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -136(%rbp)
  # mappedInts = t8
    movq -136(%rbp), %rax
    movq %rax, -40(%rbp)
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t12 = call this.makeStringFcn()
    subq $8, %rsp
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *24(%rax)
    addq $16, %rsp
    movq %rax, -168(%rbp)
  # Null check: mapStrings != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t11 = call mapStrings.call(strs, t12)
    subq $8, %rsp
    movq -168(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -160(%rbp)
  # mappedStrs = t11
    movq -160(%rbp), %rax
    movq %rax, -48(%rbp)
  # Null check: mapBools != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t13 = call mapBools.call(bools, boolFcn)
    subq $8, %rsp
    movq -32(%rbp), %rax
    pushq %rax
    movq 40(%rbp), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -176(%rbp)
  # mappedBools = t13
    movq -176(%rbp), %rax
    movq %rax, -56(%rbp)
  # call Library.print("mappedInts: ")
    leaq __ic_string_lit_13(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.printInts(mappedInts)
    movq -40(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *32(%rax)
    addq $16, %rsp
  # call Library.print("mappedStrs: ")
    leaq __ic_string_lit_14(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.printStrings(mappedStrs)
    movq -48(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *40(%rax)
    addq $16, %rsp
  # call Library.print("mappedBools: ")
    leaq __ic_string_lit_15(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.printBools(mappedBools)
    movq -56(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *48(%rax)
    addq $16, %rsp
  # call Library.println("")
    leaq __ic_string_lit_16(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_MapAndFilter.testMap_epilogue:
    addq $176, %rsp
    popq %rbp
    retq

__method_MapAndFilter.testFilter:
    pushq %rbp
    movq %rsp, %rbp
    subq $176, %rsp
  # t1 = new MapAndFilter_testFilter_filterInts_Closure()
    movq $32, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapAndFilter_testFilter_filterInts_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -72(%rbp)
  # Null check: t1 != Null
    movq -72(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create(ints, strs, bools)
    movq 40(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -72(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -64(%rbp)
  # filterInts = t0
    movq -64(%rbp), %rax
    movq %rax, -8(%rbp)
  # t3 = new MapAndFilter_testFilter_filterStrings_Closure()
    movq $32, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapAndFilter_testFilter_filterStrings_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -88(%rbp)
  # Null check: t3 != Null
    movq -88(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2 = call t3.create(ints, strs, bools)
    movq 40(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -88(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -80(%rbp)
  # filterStrings = t2
    movq -80(%rbp), %rax
    movq %rax, -16(%rbp)
  # t5 = new MapAndFilter_testFilter_filterBools_Closure()
    movq $32, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapAndFilter_testFilter_filterBools_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -104(%rbp)
  # Null check: t5 != Null
    movq -104(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t4 = call t5.create(ints, strs, bools)
    movq 40(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -104(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $32, %rsp
    movq %rax, -96(%rbp)
  # filterBools = t4
    movq -96(%rbp), %rax
    movq %rax, -24(%rbp)
  # call Library.println("***Testing filter***")
    leaq __ic_string_lit_17(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
  # t8 = new MapAndFilter_testFilter_anon1_Closure()
    movq $80, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapAndFilter_testFilter_anon1_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -128(%rbp)
  # Null check: t8 != Null
    movq -128(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t7 = call t8.create(filteredStrs, ints, filterBools, filteredBools, bools, filterStrings, filteredInts, strs, filterInts)
    movq -8(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq 40(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq -128(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $80, %rsp
    movq %rax, -120(%rbp)
  # Null check: filterInts != Null
    movq -8(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t6 = call filterInts.call(ints, t7)
    subq $8, %rsp
    movq -120(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -8(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -112(%rbp)
  # filteredInts = t6
    movq -112(%rbp), %rax
    movq %rax, -32(%rbp)
  # t11 = new MapAndFilter_testFilter_anon2_Closure()
    movq $80, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapAndFilter_testFilter_anon2_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -152(%rbp)
  # Null check: t11 != Null
    movq -152(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t10 = call t11.create(filteredStrs, ints, filterBools, filteredBools, bools, filterStrings, filteredInts, strs, filterInts)
    movq -8(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq 40(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq -152(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $80, %rsp
    movq %rax, -144(%rbp)
  # Null check: filterStrings != Null
    movq -16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t9 = call filterStrings.call(strs, t10)
    subq $8, %rsp
    movq -144(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -136(%rbp)
  # filteredStrs = t9
    movq -136(%rbp), %rax
    movq %rax, -40(%rbp)
  # t14 = new MapAndFilter_testFilter_anon3_Closure()
    movq $80, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapAndFilter_testFilter_anon3_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -176(%rbp)
  # Null check: t14 != Null
    movq -176(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t13 = call t14.create(filteredStrs, ints, filterBools, filteredBools, bools, filterStrings, filteredInts, strs, filterInts)
    movq -8(%rbp), %rax
    pushq %rax
    movq 32(%rbp), %rax
    pushq %rax
    movq -32(%rbp), %rax
    pushq %rax
    movq -16(%rbp), %rax
    pushq %rax
    movq 40(%rbp), %rax
    pushq %rax
    movq -48(%rbp), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq 24(%rbp), %rax
    pushq %rax
    movq -40(%rbp), %rax
    pushq %rax
    movq -176(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $80, %rsp
    movq %rax, -168(%rbp)
  # Null check: filterBools != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t12 = call filterBools.call(bools, t13)
    subq $8, %rsp
    movq -168(%rbp), %rax
    pushq %rax
    movq 40(%rbp), %rax
    pushq %rax
    movq -24(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *0(%rax)
    addq $32, %rsp
    movq %rax, -160(%rbp)
  # filteredBools = t12
    movq -160(%rbp), %rax
    movq %rax, -48(%rbp)
  # call Library.print("filteredInts: ")
    leaq __ic_string_lit_18(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.printInts(filteredInts)
    movq -32(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *32(%rax)
    addq $16, %rsp
  # call Library.print("filteredStrs: ")
    leaq __ic_string_lit_19(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.printStrings(filteredStrs)
    movq -40(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *40(%rax)
    addq $16, %rsp
  # call Library.print("filteredBools: ")
    leaq __ic_string_lit_20(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: this != Null
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # call this.printBools(filteredBools)
    movq -48(%rbp), %rax
    pushq %rax
    movq 16(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *48(%rax)
    addq $16, %rsp
  # call Library.println("")
    leaq __ic_string_lit_21(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_MapAndFilter.testFilter_epilogue:
    addq $176, %rsp
    popq %rbp
    retq

__method_MapAndFilter.makeStringFcn:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
  # t1 = new MapAndFilter_makeStringFcn_anon4_Closure()
    movq $8, %rdi
    callq __LIB_allocateObject
    addq $8, %rax
    leaq __MapAndFilter_makeStringFcn_anon4_Closure_vtable(%rip), %r10
    movq %r10, -8(%rax)
    movq %rax, -24(%rbp)
  # Null check: t1 != Null
    movq -24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t0 = call t1.create()
    subq $8, %rsp
    movq -24(%rbp), %rax
    pushq %rax
    movq -8(%rax), %rax
    callq *8(%rax)
    addq $16, %rsp
    movq %rax, -16(%rbp)
  # return t0
    movq -16(%rbp), %rax
    jmp __method_MapAndFilter.makeStringFcn_epilogue
__method_MapAndFilter.makeStringFcn_epilogue:
    addq $32, %rsp
    popq %rbp
    retq

__method_MapAndFilter.printInts:
    pushq %rbp
    movq %rsp, %rbp
    subq $112, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # label _beginWhileMapAndFilter_printInts0
_beginWhileMapAndFilter_printInts0:
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
  # t0 = t1			#condition for while loop on line 194
    movq -32(%rbp), %rax
    movq %rax, -24(%rbp)
  # t3 = !t1
    movq -32(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -48(%rbp)
  # cjump t3 label _endWhileMapAndFilter_printInts0			#test for while loop on line 194
    movq -48(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_printInts0
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
  # t5 = t6			#condition for if on line 196
    movq -72(%rbp), %rax
    movq %rax, -64(%rbp)
  # t9 = !t6
    movq -72(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -96(%rbp)
  # cjump t9 label _endIfMapAndFilter_printInts0
    movq -96(%rbp), %rax
    testq %rax, %rax
    jnz _endIfMapAndFilter_printInts0
  # call Library.print(", ")
    leaq __ic_string_lit_22(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # label _endIfMapAndFilter_printInts0
_endIfMapAndFilter_printInts0:
  # t10 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -104(%rbp)
  # i = t10
    movq -104(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileMapAndFilter_printInts0
    jmp _beginWhileMapAndFilter_printInts0
  # label _endWhileMapAndFilter_printInts0
_endWhileMapAndFilter_printInts0:
  # call Library.println("")
    leaq __ic_string_lit_23(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_MapAndFilter.printInts_epilogue:
    addq $112, %rsp
    popq %rbp
    retq

__method_MapAndFilter.printStrings:
    pushq %rbp
    movq %rsp, %rbp
    subq $112, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # label _beginWhileMapAndFilter_printStrings0
_beginWhileMapAndFilter_printStrings0:
  # Null check: strs != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2= strs.length
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
  # t0 = t1			#condition for while loop on line 206
    movq -32(%rbp), %rax
    movq %rax, -24(%rbp)
  # t3 = !t1
    movq -32(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -48(%rbp)
  # cjump t3 label _endWhileMapAndFilter_printStrings0			#test for while loop on line 206
    movq -48(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_printStrings0
  # Null check: strs != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < strs.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t4 = strs[i]
    movq 24(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -56(%rbp)
  # call Library.print(t4)
    movq -56(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # Null check: strs != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8= strs.length
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
  # t5 = t6			#condition for if on line 208
    movq -72(%rbp), %rax
    movq %rax, -64(%rbp)
  # t9 = !t6
    movq -72(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -96(%rbp)
  # cjump t9 label _endIfMapAndFilter_printStrings0
    movq -96(%rbp), %rax
    testq %rax, %rax
    jnz _endIfMapAndFilter_printStrings0
  # call Library.print(", ")
    leaq __ic_string_lit_24(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # label _endIfMapAndFilter_printStrings0
_endIfMapAndFilter_printStrings0:
  # t10 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -104(%rbp)
  # i = t10
    movq -104(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileMapAndFilter_printStrings0
    jmp _beginWhileMapAndFilter_printStrings0
  # label _endWhileMapAndFilter_printStrings0
_endWhileMapAndFilter_printStrings0:
  # call Library.println("")
    leaq __ic_string_lit_25(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_MapAndFilter.printStrings_epilogue:
    addq $112, %rsp
    popq %rbp
    retq

__method_MapAndFilter.printBools:
    pushq %rbp
    movq %rsp, %rbp
    subq $112, %rsp
  # i = 0
    movq $0, %rax
    movq %rax, -8(%rbp)
  # label _beginWhileMapAndFilter_printBools0
_beginWhileMapAndFilter_printBools0:
  # Null check: bools != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t2= bools.length
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
  # t0 = t1			#condition for while loop on line 218
    movq -32(%rbp), %rax
    movq %rax, -24(%rbp)
  # t3 = !t1
    movq -32(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -48(%rbp)
  # cjump t3 label _endWhileMapAndFilter_printBools0			#test for while loop on line 218
    movq -48(%rbp), %rax
    testq %rax, %rax
    jnz _endWhileMapAndFilter_printBools0
  # Null check: bools != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # Bounds check:  0 <= i < bools.length
    movq -8(%rbp), %r10
    cmpq $0, %r10
    jl __ic_error_handler_bounds
    movq 24(%rbp), %rax
    movq -8(%rax), %rax
    cmpq %r10, %rax
    jle __ic_error_handler_bounds
  # t4 = bools[i]
    movq 24(%rbp), %rax
    movq -8(%rbp), %r10
    movq (%rax,%r10,8), %r11
    movq %r11, -56(%rbp)
  # call Library.printb(t4)
    movq -56(%rbp), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_printb
    addq $8, %rsp
  # Null check: bools != Null
    movq 24(%rbp), %rax
    cmpq $0, %rax
    je __ic_error_handler_null
  # t8= bools.length
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
  # t5 = t6			#condition for if on line 220
    movq -72(%rbp), %rax
    movq %rax, -64(%rbp)
  # t9 = !t6
    movq -72(%rbp), %rax
    testq %rax, %rax
    sete %al
    movsbq %al, %rax
    movq %rax, -96(%rbp)
  # cjump t9 label _endIfMapAndFilter_printBools0
    movq -96(%rbp), %rax
    testq %rax, %rax
    jnz _endIfMapAndFilter_printBools0
  # call Library.print(", ")
    leaq __ic_string_lit_26(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_print
    addq $8, %rsp
  # label _endIfMapAndFilter_printBools0
_endIfMapAndFilter_printBools0:
  # t10 = i + 1
    movq -8(%rbp), %rax
    movq $1, %r10
    addq %rax, %r10
    movq %r10, -104(%rbp)
  # i = t10
    movq -104(%rbp), %rax
    movq %rax, -8(%rbp)
  # jump label _beginWhileMapAndFilter_printBools0
    jmp _beginWhileMapAndFilter_printBools0
  # label _endWhileMapAndFilter_printBools0
_endWhileMapAndFilter_printBools0:
  # call Library.println("")
    leaq __ic_string_lit_27(%rip), %rdi
    movq %rdi, %rdi
    subq $8, %rsp
    callq __LIB_println
    addq $8, %rsp
__method_MapAndFilter.printBools_epilogue:
    addq $112, %rsp
    popq %rbp
    retq
