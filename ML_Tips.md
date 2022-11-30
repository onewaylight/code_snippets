[TensorFlow Install](https://www.tensorflow.org/install/docker)

```
docker pull tensorflow/tensorflow                     # latest stable release
docker pull tensorflow/tensorflow:devel-gpu           # nightly dev release w/ GPU support
docker pull tensorflow/tensorflow:latest-gpu-jupyter  # latest release w/ GPU support and Jupyter
```

``` 
docker run [-it] [--rm] [-p hostPort:containerPort] tensorflow/tensorflow[:tag] [command]
```
<br>

> Jupyter, GPU

```
docker run -it --gpus all -p 8888:8888 tensorflow/tensorflow:latest-gpu-jupyter
```
<br>

> Bash, GPU
```
docker run --gpus all -it tensorflow/tensorflow:latest-gpu bash

docker run --gpus all -it -v databuf:/home/databuf tensorflow/tensorflow:latest-gpu bash
```


```
docker volume create databuf

docker volume ls
```

```
docker run -it -v databuf:/home/databuf tensorflow/tensorflow bash
```