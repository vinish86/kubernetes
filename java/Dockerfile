FROM openjdk:8-jdk-alpine
# Add Maintainer Info
LABEL maintainer="sasi@gmail.com"
# Make port 8080 available to the world outside this container
EXPOSE 8080
# The application's jar file
ARG JAR_FILE=springboot-jsp-helloworld/target/springboot-jsp-helloworld-1.0-SNAPSHOT.war
# Add the application's jar to the container
ADD ${JAR_FILE} springboot-demo.war
# Run the jar file 
ENTRYPOINT ["java","-jar","/springboot-demo.war"]
