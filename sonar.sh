# run Sonar - please create and replace login token first
mvn sonar:sonar -Dsonar.host.url=http://localhost:9001 -Dsonar.login=sqa_11d2b870619c09c11c11ec071d4e30a5cf7b7f51 -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true -Dsonar.java.binaries=.
