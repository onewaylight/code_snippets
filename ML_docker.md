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

```bash
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

> <h3>실행중인 Docker의 bash 에 접속하기</h3>
```bash
# container id check
$ docker ps

# run bash
$ docker exec -it [CONTAINER ID] bash
```
<br>

> <h3>작업했던 Docker image 저장 </h3>
```bash
# run container
$ docker run --gpus all -p 8888:8888 --rm -it -v d:\Docker:/home/databuf tensorflow/tensorflow:gpu-jupyter

# connect bash and then install new library
$ docker exec -it 9cb4e47e1c42 /bin/bash

# save new container image
$ docker commit 9cb4e47e1c42 tensorflow/tensorflow:gpu-jupyter-v1.1

# run new container  
$ docker run --gpus all -p 8888:8888 --rm -it -v d:\Docker:/home/databuf tensorflow/tensorflow:gpu-jupyter-v1.1
```
<br>

> <h3>종료된 Container 다시 시작</h3>
> rm 옵션을 주지 않았을 경우 Container만 남아있게 된다. 이때 재시작을 하려면 이와 같이 하면 된다.
```bash
# Check container id 
$ docker ps -a

# Container Restart
$ docker container restart [CONTAINER ID]
```

> <h3>컨테이너 중지
```bash
$ docker stop [container id]
```

> <h3>컨테이너 시작

```bash
$ docker start [Container id]
```

> <h3>컨테이너 재시작

```bash
$ docker restart [container id]
```

<br>

<br>

<h3 style="color:#32EBE0;font-size:160%">References</h3>

----
<br>



  [Docker Guide for beginners 2](https://subicura.com/2017/01/19/docker-guide-for-beginners-2.html)

  [Docker Solution for Tensorflow](https://analyticsindiamag.com/docker-solution-for-tensorflow-2-0-how-to-get-started/)


