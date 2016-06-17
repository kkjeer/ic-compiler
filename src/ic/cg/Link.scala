package ic.cg

import scala.sys.process._

/**
 * Wrapper for the assembler and linker.
 * This takes our generated assembly code file, links it with a library
 * for runtime I/O support, and produces a binary machine code file
 * (an executable).
 */
object Link {
  def apply(asmpath: String, binfile: String): Unit = {
    val lib =
      if (Asm.MACOSX) "libic64.osx.a"
      else "libic64.a"
    val cmd =
	  Seq("gcc", "-g", "-m64", "-o", binfile, asmpath,
        System.getenv("IC_HOME") + "/runtime/" + lib);
    val ret = (cmd.!);
    if (ret != 0) {
      println("Crashed.  Link fails.")
      System.exit(3)
    }
  }
}
