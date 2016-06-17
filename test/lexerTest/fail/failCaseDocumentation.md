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


# Fail Test Documentation

##Test 1
Illegal double quotation mark "

##Test 2
Unbalanced ML-style comment - extra closing *)

##Test 3
Illegal single quotation mark '

##Test 4
Two illegal single quatation marks ' '

##Test 5
Illegal colon :

##Test 6
Illegal single ampersand &

##Test 7
Illegal extra " after string literal

##Test 8
Illegal single pipe |

##Test 9
Illegal question mark ?

##Test 10
Illegal @ after legal return

##Test 11
Single illegal ?

##Test 12
Single illegal @

##Test 13
Single illegal ^

##Test 14
Single illegal ~

##Test 15
Single illegal `

##Test 16
Unbalanced ML-style comments - extra opening (*



