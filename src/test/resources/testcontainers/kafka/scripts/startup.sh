#! /bin/bash

#echo 'staring in zookeeper-less mode... (kafka v3)'
#export CLUSTER_ID=$(bin/kafka-storage.sh random-uuid)
#bin/kafka-storage.sh format -t ${CLUSTER_ID} -c config/kraft/server.properties && bin/kafka-server-start.sh config/kraft/server.properties

echo 'using kafka v4 standalone mode'
export CLUSTER_ID=$(bin/kafka-storage.sh random-uuid)
bin/kafka-storage.sh format -t ${CLUSTER_ID} --standalone -c config/server.properties && bin/kafka-server-start.sh config/server.properties
