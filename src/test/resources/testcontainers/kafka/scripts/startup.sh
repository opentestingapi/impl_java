#! /bin/bash

echo 'staring in zookeeper-less mode...'
export CLUSTER_ID=$(bin/kafka-storage.sh random-uuid)
bin/kafka-storage.sh format -t ${CLUSTER_ID} -c config/kraft/server.properties && bin/kafka-server-start.sh config/kraft/server.properties
