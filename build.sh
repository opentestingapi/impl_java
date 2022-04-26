# build app (podman used for Docker image creation, for Docker env you can remove the executable flag)
mvn clean install jib:dockerBuild -Djib.dockerClient.executable=$(which podman)
#mvn clean install jib:dockerBuild
