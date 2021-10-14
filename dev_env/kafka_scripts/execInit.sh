#! /bin/bash

# create the topics (should exist in real environments)
cd /usr/bin
sh kafka-topics --zookeeper 127.0.0.1:2181 --create --topic mytopic1 --partitions 1 --replication-factor 1 --if-not-exists