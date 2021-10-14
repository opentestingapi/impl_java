FROM cassandra:3.11.10

# Cassandra fix enable authenticator
RUN sed -i 's/^authenticator.\+$/authenticator: PasswordAuthenticator/g' /etc/cassandra/cassandra.yaml
