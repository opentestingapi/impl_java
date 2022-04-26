FROM quay.io/strimzi/kafka:latest-kafka-2.8.1-amd64

COPY scripts /opt/kafka/scripts

USER root
RUN chmod 777 /opt/kafka/scripts/*
RUN chmod +x /opt/kafka/scripts/*

ENV LOG_DIR="/tmp/logs"

CMD /opt/kafka/scripts/startup.sh