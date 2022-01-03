# run Sonar - please create and replace login token first
mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=3a568e5911539798fd0f4ce9b03231578656045a -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true -Dsonar.java.binaries=.
