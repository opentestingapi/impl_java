# build app and container
mvn -s settings.xml clean install jib:dockerBuild
