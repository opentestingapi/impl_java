#! /bin/bash

# start all containers
EXAMPLE_UID=${UID} EXAMPLE_GID=${GID} docker-compose -p opentesting-stack up --detach --build

# waiting for cassandra
echo 'Sleeping 120 sec'
sleep 120

# execute Cassandra init scripts
echo 'Execute Cassandra INIT Scripts'
docker exec -it opentesting-cassandra-db /var/lib/cassandra/initializerscripts/execInit.sh

# execute Kafka init scripts
echo 'Execute Kafka INIT Scripts'
docker exec -it opentesting-zookeeper /var/lib/kafka/initializerscripts/execInit.sh

# execute Oracle init scripts
echo 'Execute Oracle INIT Scripts'
docker exec -it opentesting-oracle-db /opt/oracle/product/18c/dbhomeXE/initializerscripts/execInit.sh

# execute Postgre init scripts
echo 'Execute Postgre INIT Scripts'
docker exec -it opentesting-postgre-db /opt/oracle/product/18c/dbhomeXE/initializerscripts/execInit.sh

# add Grafana datasources
echo 'Add Grafana Data Sources'
cd grafana_datasources
for f in *.json
do
  curl -X POST -u admin:admin "http://localhost:3000/api/datasources" -H "accept: */*" -H "Content-Type: application/json" -d @${f} && echo
done
cd ..

# upload Grafana dashboard
echo 'Add Grafana Dashboard'
curl -X POST -u admin:admin "http://localhost:3000/api/dashboards/import" -H "accept: */*" -H "Content-Type: application/json" -d "{\"dashboard\":$(cat ../src/main/resources/templates/OpenTesting-Dashboard.json), \"folderId\": 0, \"override\": true}" && echo
