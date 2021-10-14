#! /bin/bash

# run init CQLs
echo 'create.cql'
cqlsh -u cassandra -p cassandra -f /var/lib/cassandra/initializerscripts/create.cql