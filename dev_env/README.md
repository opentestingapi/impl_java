# local development

local development environment including visual studio code server as IDE

You may want to comment out containers for adapters your not interested in to decrease resource consumption.

Prometheus config might require permission fix, please check script in prometheusconfig folder.

## URLs

Visual Studio Code Server: 

<http://localhost:40000>

Cassandra:

<http://localhost:9500/metrics>

Local login Cassandra:  <https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/configuration/secureConfigNativeAuth.html>

Prometheus:

<http://localhost:9090/>

Grafana:

<http://localhost:3000/login>

Sonarqube:

<http://localhost:9000/>

Local Login Sonarqube:  <https://docs.sonarqube.org/display/SONARqube71/Authentication>


## Grafana - Prometheus add data source:

http://localhost:9090


## Startup / Cleanup

Requirements: docker, docker-compose

```./startup.sh```

```./stop.sh```

```./remove.sh```
