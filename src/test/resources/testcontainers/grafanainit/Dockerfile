FROM docker.io/curlimages/curl

COPY init /init

USER root
RUN chmod 777 /init/*
RUN chmod +x /init/*

CMD ./init/execInit.sh