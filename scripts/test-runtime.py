#!/usr/bin/env python
#
# Usage:  ./test-runtime.py [-q] dir
#
#    current working directory must be icc project directory
#    dir is the directory that contains the files to use
#
# Options:
#    -q, --quiet    reduce output

import os
import sys
import subprocess
import argparse
import shlex

expected_suffix = ".expected"
args_suffix = ".args"
asm_suffix = ".s"
executable = "./a.out"
if sys.platform == "darwin":
    lib_suffix = ".osx.a"
else:
    lib_suffix = ".a"
gcc = ["gcc", "-g", "-m64", "-o", executable, "runtime/libic64" + lib_suffix]

parser = argparse.ArgumentParser(description='Test ICC.')
parser.add_argument('testdir',  help='Directory of tests to run.')
parser.add_argument('-q', '--quiet', action='store_true', help='Say less.')
args = parser.parse_args()

testdir = os.path.realpath(args.testdir)

passed = 0
failed = 0

def print_numbered_lines(lines):
    i = 0
    for line in lines:
        i += 1
        print "  %(linenum)4d:  %(line)s" % {"linenum":i,"line":line.strip('\n')}

def report(frel, f=None, compiler_lines=None, assembler_output=None, expect=None, output=None):
    if args.quiet:
        print frel, "FAILED"
        return
    if f != None:
        print ("  -- IC -----------------------------------------------------")
        with open(f) as ic:
            print_numbered_lines(ic)
    if compiler_lines != None:
        print ("  -- Compiler Output -----------------------------------------")
        print_numbered_lines(compiler_lines)
    if f != None and os.path.exists(f + asm_suffix):
        print ("  -- ASM ----------------------------------------------------")
        with open(f + asm_suffix) as asm:
            print_numbered_lines(asm)
    if assembler_output != None:
        print ("  -- Assembler Output ----------------------------------------")
        print_numbered_lines(assembler_output.split('\n'))
    if expect != None:
        print ("  -- Expected Runtime Output ---------------------------------")
        print_numbered_lines(expect.split('\n'))
    if output != None:
        print ("  -- Actual Runtime Output -----------------------------------")
        print_numbered_lines(output.split('\n'))
    print ("--------------------------------------------------------------")



print ("Testing: " + args.testdir)
# Iterate over all .ic files in testdir or its subdirectories.
for f in sorted(subprocess.check_output(["find", testdir, "-name", "*.ic"]).strip('\n').split('\n')):
    # relative path from testdir
    frel = f.replace(testdir + '/', '')
    if not args.quiet:
        print frel

    if os.path.exists(f + asm_suffix):
        os.remove(f + asm_suffix)
    if os.path.exists(executable):
        os.remove(executable)
        
    # Run the Compiler, catching stdout and stderr.
    try:
        compiler_output = subprocess.check_output(["./icc", "-d", f],
                                                  stderr=subprocess.STDOUT)
    except subprocess.CalledProcessError as e:
        compiler_output = e.output

    # All runtime tests should be valid programs.
    compiler_lines = compiler_output.strip('\n').split('\n')
    if compiler_lines[-1] != "Success.":
        failed += 1
        if not args.quiet:
            print ("-- Compiler Failed -------------------------------------------")
        report(frel, f=f, compiler_lines=compiler_lines)
        continue

    # Run the assembler, catching stdout and stderr.
    try:
        subprocess.check_output(gcc + [f + asm_suffix],
                                stderr=subprocess.STDOUT)
    except subprocess.CalledProcessError as e:
        failed += 1
        if not args.quiet:
            print ("-- Assembler Failed ------------------------------------------")
        report(frel, f=f, compiler_lines=compiler_lines, assembler_output=e.output)
        continue

    # Run the executable, catching stdout and stderr.
    try:
        benchargs = []
        if os.path.exists(f + args_suffix):
            with open(f + args_suffix) as a:
                benchargs = shlex.split(a.read())
        output = subprocess.check_output([executable] + benchargs,
                                          stderr=subprocess.STDOUT)
    except subprocess.CalledProcessError as e:
        output = e.output

    # Check runtime output.
    with open(f + expected_suffix) as ef:
        expect = ef.read()
    if expect == output:
        passed += 1
    else:
        failed += 1
        if not args.quiet:
            print ("-- Runtime Failed --------------------------------------------")
        report(frel, f=f, compiler_lines=compiler_lines, assembler_output="",
               expect=expect, output=output)
            
print ("# PASSED: " + str(passed))
print ("# FAILED: " + str(failed))


