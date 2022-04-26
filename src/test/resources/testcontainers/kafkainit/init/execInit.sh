#! /bin/bash

# create the topics (should exist in real environments)
cd /opt/kafka/bin
./kafka-topics.sh --bootstrap-server localhost:9092 --create --topic mytopic1 --partitions 1 --replication-factor 1 --if-not-exists