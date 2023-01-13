cmd | description
--- | -----------
up | Container Create/Start
ps | list container
logs | container log
run | run container
start | start container
stop | stop container
restart | restart container
pause | pause container
unpause | restart container
port | 공개 포트 번호 표시
config | 구성확인
kill | force stop running container
rm | remove container
down | remove resouce


https://velog.io/@jh5253/Docker-Compose-%EC%A0%95%EB%A6%AC

https://velog.io/@hyunshoon/series/Docker

<br>

```
docker-compose down
docker volume create testvol3
docker network create test1net
```

> docker-compose.yml

```yaml
version: '3.7'
services:
  wordpress:
    image: wordpress
    networks:
      - test1net
    links:
      - "db:mysql"
    ports:
      - "8001-8009:80"
    depends_on:
      - db
    environment:
      - WORDPRESS_DB_PASSWORD=test123
      - WORDPRESS_DB_USER=root
      - WORDPRESS_DB_NAME=testdb
    volumes:
      - ./www:/var/www/html
  db:
    image: mysql:5.7
    networks:
      - test1net
    volumes:
      - testvol3:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=test123
      - MYSQL_DATABASE=testdb

networks:
  test1net:
    external: true
volumes:
  testvol3:
    external: true
```

```
docker-compose up --scale wordpress=2 -d
```

```
docker network create testnetwork1
docker volume create testvolume1
```

> Dockerfile
```
FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y nginx
COPY index.html /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

> docker-compose.yml

```yaml
version: '3.7'
services:
  web:
    build: . # 현재 디렉토리
    image: testweb:1.0
    networks:
      - testnetwork1
    links:
      - "db:mysql"
    ports:
      - "8881-8889:80"
    depends_on:
      - db
    environmet:
      - DB_NAME=testdb
      - DB_USER=root
      - DB_PASSWORD=test123
  db:
    image: mysql:5.7
    networks:
      - testnetwork1
    volumes:
      - testvolume1:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=test123
      - MYSQL_DATABASE=testdb
networks:
  testnetwork1:
    external: true
volumes:
  testvolume1:
    external: true
```

```
docker-compose up -d
docker-compose ps
```

```
docker run --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=9559:8080 --detach=true --name=cadvisor --net=testnetwork1 google/cadvisor
```

-----

```
version: '{버전}'
services:
  {도커 이름}:
    driver: {네트워크 이름}
    build: {dockerfile build 할 시 디렉토리}
    ports:
    - "{외부포트}:{컨테이너포트}"
    volumes:
    - {볼륨명}: {컨테이너 위치}
    - logvolume01:/var/log
    links:
    - redis #링크
  redis:
    image: redis # dockerfile에서 build 하지않고 이미지를 받아옴
    environment:
        {환경 변수명}: {컨테이너이름}:3456
        DB_PASSWORD: redis:password
volumes:
  logvolume01: {}

networks:
  {네트워크 이름}:
    # 커스텀 네트워크 사용
    driver: custom-driver-1
  {네트워크 이름}:
    # 커스텀 네트워크 옵션 사용
    driver: custom-driver-2
    driver_opts:
      foo: "1"
      bar: "2"
```


## ```Version```

docker 문법의 버전을 의미한다. 각 버전벌로 필요로하는 docker-engine이 다르고 지원하는 문법이 다르니 주의.

Compose file format	| Docker Engine release
--- | ---
3.6	| 18.02.0+
3.5	| 17.12.0+
3.4	| 17.09.0+
3.3	| 17.06.0+
3.2	| 17.04.0+
3.1	| 1.13.1+
3.0	| 1.13.0+
2.3	| 17.06.0+
2.2	| 1.13.0+
2.1	| 1.12.0+
2.0	| 1.10.0+
1.0	| 1.9.1.+

## ```Service```

아래엔 container의 상세 내용이 기술된다.

{도커 이름} : # run될 container의 이름을 설정한다.

```
build: . # 빌드할 Dockerfile의 경로
image: ubuntu:16.04 # 빌드 하지않고 이미지를 사용할 수 있음.

ports:
– 8080:80 # 외부포트 : 컨테이너 포트 설정

volume:
– my_data:/data # 볼륨명 : 컨테이너 위치

link:
– container_name # link로 연결할 컨테이너 이름 ( deprecate )

environment:
– ENV_NAME: env_value # 환경변수 설정

```

## ```Network```

```
driver: bridge # 네트워크에서 사용할 드라이버 종류 (overlay, host, none 등…)

internal : true # 내부망 설정 옵션

ipam:
    driver: default # ipam에서 사용할 드라이버 옵션 기본 설정은 default
    config: # ipam config
        – subnet : 10.0.0.0/24 # subnet 설정 ps. gateway설정은 version 2에서만 지원된다.
```

 Container와 호스트간 파일 복사하기
 ```
# Host -> Container
docker cp [host_filepath] [container_name]:[container_filepath]

# Container -> Host
docker cp [continer_name]:[container_filepath] [host_filepath]
```

https://www.dongyeon1201.kr/c20f7d07-6f23-4134-ae8e-e730dc7b5af6#1571cb3b-60cc-4a61-afa3-c5e86b61e59c

### Dockerfile에서 사용되는 기본적인 내용 정리
```
# base로 사용할 Image name을 설정
FROM [image name]

# 이미지를 생성할 때 실행할 코드를 지정한다.
RUN [command]

# 작업 디렉토리를 설정하며 설정된 디렉토리 위치를 기준으로 명령어가 실행된다.
# 만약 해당 디렉토리가 없을 경우 새로 생성한다.
WORKDIR [dir]

# 파일이나 폴더를 이미지에 복사한다.
COPY [host file/dir path] [container file/dir path]

# 이미지에서 사용할 환경 변수를 지정한다.
ENV HELLO=hello

# 컨테이너를 구동할 때 실행할 명령어를 지정한다.
# ENTRYPOINT : 해당 이미지로 컨테이너 실행 시, 무조건 이 명령어를 실행
# CMD : 해당 이미지로 컨테이너 실행 시, 실행 명령어를 설정하지 않았을 때만 이 명령어 실행
ENTRYPOINT ["명령어","arg","arg2",...]
CMD ["ls","arg","arg2",...]
```

### Dockerfile을 사용하여 이미지로 빌드하기
```bash
docker build [option] [Dockerfile path]

# 현재 위치에 존재하는 Dockerfile을 사용하여 testimage 라는 이미지를 생성할 경우
# --tag로 이름과 태그를 설정할 수 있다. 만약 태그(1.0부분)를 설정하지 않을 경우 자동으로 'latest'로 설정된다.
docker build --tag testimage:1.0 .
```

### Docker image 내보내기

생성한 Docker Image를 다른 곳에서 사용할 수 있도록 내보낼 수 있다.
-o 옵션을 사용하거나, ' > ' 를 사용하여 표준 출력으로 출력하는 것이 아닌 파일로 저장되도록 한다.

```bash
docker save -o [filename] [imagename]:[tag]
docker save [imagename]:[tag] > [filename]
```

### Docker image 가져오기

파일로 저장한 Docker image 파일을 가져올 수 있다.

```bash
docker load < [filename]
```

새롭게 환경설정된 Container를 새로운 이미지로 만들기
이미지로 새로운 컨테이너를 만든 뒤, 사용자의 입맛대로 환경설정을 할 것이다. 
이를 기존의 이미지를 수정하지 않고, 새로운 버전의 이미지로 생성이 가능하다.
즉, base Image를 Dockerfile를 사용하여 처음부터 만드는것이 아닌 baseImage로 동작중인 컨테이너를 사용하여 환경설정을 해준 뒤, 새로운 버전의 이미지로 생성이 가능하다.

```bash
docker commit [options] [Container Name] [new Imagename]:[new tagname]

# -a "" / --author="" : 생성자 정보
docker commit -a "Dongyeon" using_container image:2.0

# -m "" / --message="" : 이미지에 대한 메세지
docker commit -m "update server" using_container image:2.0

# -p / --pause=true/false : 이미지를 생성할 때 컨테이너를 중지한 뒤 commit 여부
```


나의 Docker Hub에 이미지 업로드 하기
우선 Docker Hub에 가입한 후, username을 확인한다. 필자는 testuser 이라고 작성하겠다.
먼저 docker login 명령어로 Docker Hub에 로그인 후 docker tag , docker push 명령어로 업로드 한다.
만약 docker login 명령어로 정상적으로 로그인 했음에도 docker push 명령어 사용 후 
denied: requested access to the resource is denied 와 같은 에러가 발생하는 경우가 있다.
그럴 땐 [username] 부분과 로그인한 ID가 동일한지 확인한다.
docker login
-> ID 입력
-> PW 입력
Login Succeeded 출력 시 로그인 성공

```
docker tag [image_name]:[tag] [username]/[want_name]:[tag]
docker push [username]/[want_name]:[tag]

ex)
docker tag myimage:1.0 testuser/myimageupload:1.0
docker push testuser/myimageupload:1.0
```


### ```Dockerfile로 이미지 만들기 예시```

Docker hub의 Ubunbu 18.04 Base이미지에는 python3가 설치되어 있지 않다.
그래서 Docker hub의 Ubunbu 18.04 Base이미지와 Dockerfile을 사용하여 python3가 설치된 Ubuntu 18.04 이미지를 만들어 보았다.

### ```Dockerfile 작성```
```
# ubuntu 18.04 Base Image를 사용
FROM ubuntu:18.04

# apt-get으로 설치 시 에러 발생(lists lock 에러 등) 방지를 위해 레파지토리에 등록된 패키지 목록 제거
RUN rm -rf /var/lib/apt/lists/*# apt-get update 후, python3 , pip등을 설치
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

# python 설치 후, 추가적으로 python 모듈 설치를 원할 때 사용
# 아래 내용처럼 txt파일에 작성하거나, pip 명령어로 설치
# RUN pip install --trusted-host pypi.python.org -r requirements.txt
```

### ```빌드```
```
docker build --tag ubuntu_python:18.04 [Dockerfile 경로]
```