FROM openjdk:17
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

# FROM ubuntu:latest
# LABEL authors="kangchun-asus2"
# ENTRYPOINT ["top", "-b"]