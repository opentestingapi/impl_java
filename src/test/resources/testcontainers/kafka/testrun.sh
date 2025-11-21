#! /bin/bash

docker build --tag kafkatest:local .

docker run kafkatest:local
