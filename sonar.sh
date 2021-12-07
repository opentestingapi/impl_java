# run Sonar - please create and replace login token first
mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=a690cbaad047c2b49eaefb5b2bf4d0518d665815 -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true -Dsonar.java.binaries=.
