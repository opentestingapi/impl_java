#! /bin/bash

sleep 5
while ! cqlsh -u cassandra -p cassandra -e 'describe cluster' ; do    
    echo 'waiting for cassandra...'
    sleep 5 
done

# run init CQLs
echo 'create.cql'
cqlsh -u cassandra -p cassandra -f /init/create.cql
echo 'done'