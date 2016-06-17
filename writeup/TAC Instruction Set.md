#TAC Instruction Set
This document describes our TAC instruction set for IC. The following instructions are supported:

##Arithmetic and Logic Instructions
1. Unary operators: `a = OP b`, where `OP` is `!` or `-`
2. Binary operators `a = b OP c`, where `OP` is
	* an arithmetic operator: `+, -, /, *, %`
	* a logic operator: `&&, ||` (treated as short-circuit)
	* a comparison operator: `== !=, <, <=, >, >=`

##Data Movement Instructions
1. Copy: `a = b`
2. Arrays
	* Array Load: `a = b[i]`
	* Array Store: `a[i] = b`
	* Array Creation: `a = new [b]`
	* Array Length Load: `a = b.length`
3. Fields
	* Field Load: `a = b.f`
	* Field Store: `a.f = b`

##Labels and Branches
1. Label: `label L`
2. Unconditional Jump: `jump L`
3. Conditional Jump: `cjump a L`

##Method Calls
1. Virtual call with no result: `call e.f(a1, ..., an)`
2. Library call with no result: `call Library.f(a1, ..., an)`
3. Virtual call with result: `a = e.f(a1, ..., an)`
4. Library call with result: `a = Library.f(a1, ..., an)`

##Object Creation
1. New Object: `a = new C()`

##Returns
1. Return with no value: `return`
2. Return with value: `return a`

##Runtime Checks
1. Null Check: `a != Null`
2. Bounds Check: `0 <= a <= b.length`
3. Size Check: `a >= 0`
4. Zero Check: `a != 0`

##Comments
Each instruction can have an inline comment attached to it, but the Comment instruction allows comments to be inserted anywhere in the program.  
1. Comment: `#this is a comment`