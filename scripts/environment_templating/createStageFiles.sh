#! /bin/bash

#import parameters
. stageProperties.sh

#create files
rm -rf stagefiles
mkdir stagefiles
#extend template files here...
for template in test
do
    #extend stages here...
    for stage in LOCAL DEV
    do     
        #copy file    
        STAGENAME=${stage}_STAGE
        cp ${template}.json stagefiles/${template}_${!STAGENAME}.json
        echo "stagefile ${stage} created"

        #copy content files
        cp -avr ${template} stagefiles/${template}_${!STAGENAME}

        #replace placeholders, extend paremeters here...	
        for parameter in STAGE ORACLE_SERVER ORACLE_PORT
        do  
            echo "### ${stage}_${parameter}"
            STAGEPARAMETER=${stage}_${parameter}
            sed -i "s/#${parameter}#/${!STAGEPARAMETER}/" stagefiles/${template}_${!STAGENAME}.json
        done
        echo "stagefile ${stage} modified"
    done
done

echo "Please check folder stagefiles"
