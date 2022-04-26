#! /bin/sh

# other components are more important, we can wait a bit
sleep 60

# add Grafana datasources
echo 'Add Grafana Data Sources'
cd /init/datasources
for f in *.json
do
  curl -X POST -u admin:admin "http://localhost:3000/api/datasources" -H "accept: */*" -H "Content-Type: application/json" -d @${f} && echo
done
cd ..

# upload Grafana dashboard
echo 'Add Grafana Dashboard'
curl -X POST -u admin:admin "http://localhost:3000/api/dashboards/import" -H "accept: */*" -H "Content-Type: application/json" -d "{\"dashboard\":$(cat templates/OpenTesting-Dashboard.json), \"folderId\": 0, \"override\": true}" && echo
