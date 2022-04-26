FROM docker.io/cassandra

# Cassandra fix enable authenticator
RUN sed -i 's/^authenticator.\+$/authenticator: PasswordAuthenticator/g' /etc/cassandra/cassandra.yaml
