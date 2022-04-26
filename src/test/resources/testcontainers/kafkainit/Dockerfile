FROM quay.io/strimzi/kafka:latest-kafka-2.8.1-amd64

COPY init /opt/kafka/init

USER root
RUN chmod 777 /opt/kafka/init/*
RUN chmod +x /opt/kafka/init/*

CMD /opt/kafka/init/execInit.sh