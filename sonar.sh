# run Sonar - please create and replace login token first
mvn sonar:sonar -Dsonar.host.url=http://localhost:9001 -Dsonar.login=54049410da2cded5e282316ad07763c38e9332ef -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true -Dsonar.java.binaries=.
