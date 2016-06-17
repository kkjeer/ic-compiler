#IC Optimizer Checkpoint
At this point, the live variable analysis and corresponding dead code elimination optimization are in place. The program supports the following command line options:
1. -printIR: Prints the TAC for each method in the program.
2. -printDFA: Prints the data-flow facts for each performed optimization.
3. -dce: Performs dead code optimization on the program.
4. -opt: Performs all optimizations (currently, only dead code elimination is implemented) on the program.
5. -iter: Performs all optimizations until either no changes are made to the TAC or the maximum number of iterations is reached.

#Test Programs
The test programs for this checkpoint are location in test/optTest. Currently, there are test programs for live variable analysis/dead code elimination, all named live_.ic.