FROM openjdk:11-jre-slim

# copy files
COPY target/impl_java.jar /app/impl_java.jar

# set workdir
WORKDIR /app

# run the command on container startup
CMD ["java", "-jar", "impl_java.jar"]