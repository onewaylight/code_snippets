<b><h3 style="color:cyan; font-size:160%">Machine Learning Docker Command</h3>

> <h3>Docker Command Usage</h3>

``` 
docker run [-it] [--rm] [-p hostPort:containerPort] tensorflow/tensorflow[:tag] [command]
```

옵션	| 설명
--- | ---
-d	| detached mode 흔히 말하는 백그라운드 모드
-p	| 호스트와 컨테이너의 포트를 연결 (포워딩)
-v	| 호스트와 컨테이너의 디렉토리를 연결 (마운트)
-e	| 컨테이너 내에서 사용할 환경변수 설정
–name	| 컨테이너 이름 설정
–rm	| 프로세스 종료시 컨테이너 자동 제거
-it	| -i와 -t를 동시에 사용한 것으로 터미널 입력을 위한 옵션
–link	| 컨테이너 연결 [컨테이너명:별칭]
<br>
<hr>
<br>

> ### Create a volume and copy file to the volume

```bash
$ docker container create --name dummy -v databuf:/home/databuf hello-world
$ docker cp workplan.ts dummy:/home/databuf/workplan.ts
$ docker rm dummy
```
<br>

> Create Volume
```
docker volume create databuf

docker volume ls
```
<br>

> ### Entering the Docker Container
```bash
$ docker exec -it container_id /bin/bash
```
<br>

> ### Committing Changes & Saving The container Instance
```bash
$ docker commit container_id tensorflow/tensorflow:gpu-jupyter-pandas
```
<br>

> ### Run Docker Image
```bash
$ docker run --gpus all --rm -it -v databuf:/home/databuf tensorflow/tensorflow:latest-gpu-pandas bash

$ docker run --gpus all -p 8888:8888 --rm -it -v d:\Docker:/home/databuf tensorflow/tensorflow:latest-gpu-pandas bash
```
<br>

> <h3 style="color:lightgray"><b>실제 사용중인 Command</h3>

```
$ docker run --gpus all -p 8888:8888 --rm -it -v d:\Docker:/home/databuf tensorflow/tensorflow:gpu-jupyter
```
<br>

> ### bind multiple folders cmd usecase
```bash
$ docker run -v /opt/rpms:/opt/rpms/ -v /export/centos6_1/app/logs:/export/centos6_1/app/logs -t -i centos6_1 /bin/bash
```

> ### Jupyter Docker Stacks
```bash
$ docker run -it --rm -p 8888:8888 jupyter/scipy-notebook
```

<br>
<hr>
<br>

<h3 style="color:#32EBE0;font-size:160%">References</h3>
<hr>
<br>



  [Docker Guide for beginners 2](https://subicura.com/2017/01/19/docker-guide-for-beginners-2.html)

  [Docker Solution for Tensorflow](https://analyticsindiamag.com/docker-solution-for-tensorflow-2-0-how-to-get-started/)


