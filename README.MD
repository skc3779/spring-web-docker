# Docker 데모

스프트링 부트를 이용한 Docker 데모 프로그램  
Docker Image를 만들고 Docker Container를 실행하는 방법을 설명한다.


## Docker File 만들기

```dockerfile
FROM openjdk:17
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
```

## Docker Image 만들기

```shell 
# docker build -t <도커계정명>/<프로젝트명>:1.0.1 .
docker build -t skc3779/spring-web-docker:1.0.1 .
```

## docker scout quick-view

도커 스카우트 퀵뷰는 도커 컨테이너의 성능을 모니터링하는 도구입니다. 스카우트 에이전트를 컨테이너에 설치하면 스카우트 서버에서 모니터링할 수 있습니다.

```shell
docker scout quickview
```


## Docker Image 확인하기

```bash
docker images
```

## Docker Container 실행하기

```bash
docker run -d -p 8090:8080 --name spring-web-docker skc3779/spring-web-docker:1.0.1
```

**docker run** : Docker 컨테이너를 실행하는 명령입니다. 
지정된 이미지를 기반으로 새 컨테이너를 만들고 시작하도록 Docker에 지시합니다.  

**-d** : 이 옵션은 "분리" 모드를 나타냅니다. 이는 컨테이너가 백그라운드에서 데몬 프로세스로 실행됨을 의미합니다. 
이렇게 하면 컨테이너의 콘솔에 연결하지 않고도 터미널을 계속 사용할 수 있습니다.  

**-p 8090:8080**: 이 옵션은 호스트 시스템과 컨테이너 사이의 네트워크 포트를 매핑하는 데 사용됩니다. 
호스트의 포트 8080을 컨테이너의 포트 8090에 바인딩하도록 Docker에 지시합니다. 
이를 통해 호스트 시스템의 포트 8080을 통해 컨테이너 내부에서 실행 중인 애플리케이션에 액세스할 수 있습니다.  

**--name spring-web-docker** : 이 옵션은 실행 중인 컨테이너에 사용자 지정 이름을 할당합니다. 
이 경우 이름은 "spring-web-docker"로 설정됩니다.  

**skc3779/spring-web-docker:1.0.1**: 컨테이너 생성에 사용될 도커 이미지의 이름과 태그입니다. 
Docker는 로컬 리포지토리에서 지정된 이미지를 찾습니다. 로컬에서 찾을 수 없는 경우 Docker Hub에서 다운로드를 시도합니다(공개 이미지라고 가정).  

## Docker Container 확인하기

```bash
docker ps
```

## Docker Container 로그 확인하기

```bash
docker logs -f spring-web-docker
```

## curl을 통해 확인하기
    
```bash
curl http://localhost:8090/tickets
```

## Docker Container 중지하기

```bash
docker stop spring-web-docker
```

## Docker Container 삭제하기

```bash
docker rm spring-web-docker
```

## Docker Image 삭제하기

```bash
docker rmi skc3779/spring-web-docker:1.0.1
```

## Docker Image 확인하기

```bash
docker images
```

## Docker Container 확인하기

```bash
docker ps -a
```
