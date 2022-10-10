#! /bin/bash

#JSON
echo "JSON..."
rm -rf out_json
mkdir out_json

#copy files
cp -avr json/* out_json/

#replace includes folder by folder and file by file
for dir in out_json/*/
do
    dir=${dir%*/}
    echo "Processing ${dir##*/} folder..."
    cd $dir
    for f in *.json
    do 
        echo "Processing $f file..."
        while read line || [ -n "$line" ]
        do 
            if [[ $line == *"\"!include"* ]]; then
                #replace the include
                read key value <<< "$line"
                value=${value%?}
                echo "including... ${value}"
                #directly use the file content
                sed -i "s|\"!include\s${value}\"|cat ${value}|e" ${f}
            fi
            #echo $line
        done < "$f"
    done
    cd ../..
done

#replace includes in test case
cd out_json
testfile=test.json
echo "Processing $testfile file..."
while read line || [ -n "$line" ]
do 
    if [[ $line == *"!include"* ]]; then
        #replace the include
        read key value <<< "$line"
        value=${value%?}
        echo "including... $value"
        #directly use the file content
        sed -i "s|\"!include\s${value}\"|cat ${value}|e" ${testfile}
    fi
    #echo $line
done < "$testfile"
cd ..

echo "JSON done"
