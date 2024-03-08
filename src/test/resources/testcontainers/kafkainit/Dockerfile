FROM quay.io/strimzi/kafka:latest-kafka-3.7.0

COPY init /opt/kafka/init

USER root
RUN chmod 777 /opt/kafka/init/*
RUN chmod +x /opt/kafka/init/*

CMD /opt/kafka/init/execInit.sh