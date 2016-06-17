## Print LOL Cat if -c argument is provided. 
if [ $2 = "c" ] 
    then  
    echo "LOL CTZ"
    cat src/ic/.3cats.txt
fi

## Test the test cases which should pass:
echo -e '\x1B[35mBeginning pass tests...\e[0m' 

totalP=0
pp=0
pf=0

for file in `ls test/typeCheckTest/pass/*.ic`
    do
    #echo "$file"
    if [ $1 = "v" ] 
        then 
        ./icc $file pprint
        else 
        ./icc $file 2>&1
    fi
    
    
    imageFileName="$totalP.png"
    echo $imageFileName
    dot -Tpng  < graphDot.dot >  $imageFileName #hi.png
    
    #scala -cp bin ic.Compiler $file >&-
    exitCode=$?
    ((totalP++))
    #echo "exit code: " $exitCode
        if [ $exitCode == 0 ]
            then 
            echo -e "\x1B[32m$file Passed\x1B[0m"
            ((pp++))
            else
            echo -e "\x1B[31m$file Failed\x1B[0m" 
            ((pf++))
        fi
done
echo $pp "tests passed and " $pf " failed, of " $totalP " total pass tests."
