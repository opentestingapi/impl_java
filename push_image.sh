# push container
docker tag opentesting:latest robertdiers/opentesting:latest
docker tag opentesting:latest robertdiers/opentesting:1.2
docker push robertdiers/opentesting:latest
docker push robertdiers/opentesting:1.2