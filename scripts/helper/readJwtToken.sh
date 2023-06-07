
#curl -L -X POST 'http://localhost:8080/realms/master/protocol/openid-connect/token' \
#-H 'Content-Type: application/x-www-form-urlencoded' \
#--data-urlencode 'client_id=admin-cli' \
#--data-urlencode 'grant_type=password' \
#--data-urlencode 'username=admin' \
#--data-urlencode 'password=admin'

curl -L -X POST 'http://localhost:8080/realms/master/protocol/openid-connect/token' \
-d "client_id=admin-cli&grant_type=password&username=admin&password=admin"
