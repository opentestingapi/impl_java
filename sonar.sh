# run Sonar - please create and replace login token first
mvn -s settings.xml sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=fca40c0c6cebe7a60b74b2d17e348d721ee0a8e5 -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true -Dsonar.java.binaries=.
