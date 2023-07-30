# Docker 데모

## Docker File 만들기

```dockerfile
FROM openjdk:17
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
```

## Docker Image 만들기

```bash
docker build --tags <도커계정명>/<프로젝트명>:1.0.1 .
```
