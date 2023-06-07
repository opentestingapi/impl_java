#test script to get JWT from keycloak instance, user "robert" and client "XXX" (public) must be created first

#curl -L -X POST 'http://localhost:8080/auth/realms/dcm4che/protocol/openid-connect/token' \
#-H 'Content-Type: application/x-www-form-urlencoded' \
#--data-urlencode 'client_id=XXX' \
#--data-urlencode 'grant_type=password' \
#--data-urlencode 'username=robert' \
#--data-urlencode 'password=admin'

curl -L -X POST 'http://localhost:8080/auth/realms/dcm4che/protocol/openid-connect/token' \
-d "client_id=XXX&grant_type=password&username=robert&password=admin"