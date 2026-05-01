FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/online_banking_system-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]