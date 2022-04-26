FROM docker.io/prom/prometheus

COPY config/prometheus.yml /etc/prometheus/prometheus.yml

USER root
RUN chmod 777 /etc/prometheus/prometheus.yml
