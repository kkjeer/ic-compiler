import os
#import subprocess
import pprint

testDirPath = 'test/typeCheckTest/pass'

f = []

for (__dirpath, __dirnames, testnames) in os.walk(testDirPath):
    for testname in testnames:
        fileToRun = testDirPath+"/"+testname
        os.system("./icc "+fileToRun)
        os.system("dot -Tpng  < graphDot.dot > prettyGraphs/"+testname[:len(testname)-3]+".png")
        #f.append(filename)

