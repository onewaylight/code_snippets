[TensorFlow Install](https://www.tensorflow.org/install/docker)

> <h3>Get Docker image about TensorFlow </h3>

```bash
docker pull tensorflow/tensorflow                     # latest stable release

docker pull tensorflow/tensorflow:devel-gpu           # nightly dev release w/ GPU support

docker pull tensorflow/tensorflow:latest-gpu-jupyter  # latest release w/ GPU support and Jupyter
```

```bash
docker run [-it] [--rm] [-p hostPort:containerPort] tensorflow/tensorflow[:tag] [command]
```
<br>

> TensorFlow Jupyter, GPU

```bash
docker run -it --gpus all -p 8888:8888 tensorflow/tensorflow:latest-gpu-jupyter
```
<br>

> TensorFlow Bash, GPU
```bash
docker run --gpus all -it tensorflow/tensorflow:latest-gpu bash

docker run --gpus all -it -v databuf:/home/databuf tensorflow/tensorflow:latest-gpu bash
```

>
```bash
docker volume create databuf

docker volume ls
```

> Docker Volume Mount
```bash
docker run -it -v databuf:/home/databuf tensorflow/tensorflow bash
```