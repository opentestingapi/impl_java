#! /bin/bash

#YML
echo "YML..."
rm -rf out_yml
mkdir out_yml

#copy files
cp -avr yml/* out_yml/

#replace includes folder by folder and file by file
for dir in out_yml/*/
do
    dir=${dir%*/}
    echo "Processing ${dir##*/} folder..."
    cd $dir
    for f in *.yml
    do 
        echo "Processing $f file..."
        while read line || [ -n "$line" ]
        do 
            if [[ $line == *"!include"* ]]; then
                #replace the include
                read key value <<< "$line"
                echo "including... $value"
                #directly use the file content
                sed -i "s|!include\s${value}|cat ${value}|e" ${f}
            fi
            #echo $line
        done < "$f"
    done
    cd ../..
done

#replace includes in test case
cd out_yml
testfile=test.yml
echo "Processing $testfile file..."
while read line || [ -n "$line" ]
do 
    if [[ $line == *"!include"* ]]; then
        #replace the include
        read key value <<< "$line"
        echo "including... $value"
        #directly use the file content
        sed -i "s|!include\s${value}|cat ${value}|e" ${testfile}
    fi
    #echo $line
done < "$testfile"
cd ..

echo "YML done"
