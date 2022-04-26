FROM docker.io/postgres

# init scripts
COPY init /docker-entrypoint-initdb.d
USER root
RUN chmod 777 /docker-entrypoint-initdb.d/*
RUN chmod +x /docker-entrypoint-initdb.d/*

ENV POSTGRES_PASSWORD=postgres