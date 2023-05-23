FROM eclipse-temurin:17-jre-alpine

# copy files
COPY target/impl_java.jar /app/impl_java.jar

# set workdir
WORKDIR /app

# run the command on container startup
CMD ["java", "-jar", "impl_java.jar"]