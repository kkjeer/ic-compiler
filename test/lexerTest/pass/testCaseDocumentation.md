#Running The Test Framework
To run test framework, cd to the directory of runTests.bash. This is likely to be something like: 
```bash
cd ~/ic-compiler/icc
```

depending on where you cloned the repository. Next, run: 
```bash
bash runTests.bash . .
```

This will run all test cases in the pass and fail folders of the test directory. It will also produce a summary output. 

runTests.bash also suports a minimal command line interface. Suplying the -v argument will enable verbose output where all tokens are printed to the terminal. Any other argument will yield the minimal output: pass/fail for each test case and summary statistics. 

See testingREADME.md for more information on the testing script, including detailed instructions on how to run runTests.bash.


# Pass Test Documentation

##Test 1
Undeclared string input. 

##Test 2
Integer declaration.

##Test 3
ML style (* *) comment. 

##Test 4
Nested ML style (* *) comment. 

##Test 5
String declaration with assignment. 

##Test 6
Boolean declaration with assignment. 

##Test 7
One line // style comment.

##Test 8
Length function with string input. 

##Test 9
If statement with internal integer declaration and assignment. 

##Test 10
If/else statement with internal string declaration and assignment. 

##Test 11
If/else statement without body using initial true argument.

##Test 12
If/else statement without body using initial false argument.

##Test 13
If/else statement with internal return statements and declared boolian argument for if statement. 

##Test 14
While loop with true condition and internal break statement.

##Test 15
Simple Java class with integer, string, boolean, and string array variables, void and fruitful methods, mathematical and logical operators, and library calls.

