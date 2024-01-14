# Docker for Deep Learning

## Building Docker Image through Dockerfile
Go to the folder containing your Dockerfile and run
```bash
docker build -t @IMAGE_NAME .
```

## Starting Container using the Docker Image
To start a container use the following command. '-it' allows the user to interact with the container.
```bash
docker run -it –name @CONTAINER_NAME @IMAGE_NAME
```

To use a GPU within the container, NVIDIA Docker Toolkit must be installed, and you can access GPUS by using the '--gpus all' flag.
```bash
docker run -it --gpus all –name @CONTAINER_NAME @IMAGE_NAME
```

To mount folders, you can use the '-v flag'.
```bash
docker run -it -v /path/on/host:/path/in/container –-name @CONTAINER_NAME @IMAGE_NAME
```
