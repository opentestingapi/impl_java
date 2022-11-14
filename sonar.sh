# run Sonar - please create and replace login token first
mvn sonar:sonar -Dsonar.host.url=http://localhost:9001 -Dsonar.login=a197bccb64bb53ce9ab5ebb31aa81a21b68625cb -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true -Dsonar.java.binaries=.
