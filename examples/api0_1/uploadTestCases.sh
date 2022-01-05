#! /bin/bash

# define e2etest server
opentestingserver=http://localhost:50000
echo ${opentestingserver}

# upload required files and test case

for testcase in local_test_00001 #Mix
#for testcase in local_test_00002 #Kafka
#for testcase in local_test_00003 #Cassandra
#for testcase in local_test_00004 #Rest
#for testcase in local_test_00005 #Oracle
#for testcase in local_test_00006 #PostGre
#for testcase in local_test_00001 local_test_00002 local_test_00003 local_test_00004 local_test_00005 local_test_00006
do  
    echo "### ${testcase}:"
    if [ -d "${testcase}" ]; then
        cd ${testcase}
        for f in *
        do
            curl -X POST "${opentestingserver}/upload/file/${testcase}/${f}" -H "accept: */*" -H "Content-Type: application/json" -d @${f} && echo  
        done
        cd ..
    fi
    curl -X POST "${opentestingserver}/upload/test" -H "accept: */*" -H "Content-Type: application/json" -d @${testcase}.json && echo
done