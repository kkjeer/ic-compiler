OVERVIEW

I have provided fairly complete scaffolding for a code generator in
this directory.

The main pieces are:

CodeGen.scala:
Top-level logic for code generation and some shared helper methods.

DataSegment.scala:
Generation of static data: string literals and vtables.

TextSegment.scala:
Generation of x86 instructions from methods' TAC code.

Link.scala:
Optional assemblerlinker step, so running ./icc foo.ic does all steps
to compile to an executable.  Use this after the code generator.  It
will only work if run through ./icc.  Otherwise, you need to run the
assembler/linker manually as an external second command to assemble
and link your generated assembly code to an executable.

ADJUSTMENTS

You will need to adjust details to fit your own TAC/AST code, but I
hope that this framework is useful.  Here is a non-exhaustive list of
things you will need to line up with your code:

- AST classes
- How to get a qualified name
  (e.g., "Cow.m": class+method names combined)
- TAC instruction classes
- Getting offsets from fields, methods, TAC variables, etc.
- How to get vtable lists from clases.
- How to find all string literals in your program.
  (I suggest something other than a tree traversal.  Can lazily
  accumulate a list during translation or code generation.)
- ...

The main IMPORTANT adjustment that will not show up as a Scala type
error is to set Asm.STACK_ANCHOR to %rsp or %rbp, depending on which
calling discipline you plan to use.

Hopefully this is still faster than building from scratch, even if you
use it only as a reference.

See the project page for more resources:
https://cs.wellesley.edu/~cs301/project.html
