# Multi-turtlebot3-Gazebo-ROS2

## What's New?  
- Multi turtlebot3 environment  
- Turtlebot3 with Velodyne VLP-16 environment  
- Multi turtlebot3 Velodyne VLP-16 environment  

## Result  

## Build docker image with Dockerfile  

```
cd docker
```
```
docker build -t turtlebot-gazebo:latest .
```

## Make Multi-turtlebot3-Gazebo-ROS2 docker container  

On local terminal,

```
xhost +local:docker
```

After that,
```
```
nvidia-docker run --privileged -it \
           -e NVIDIA_DRIVER_CAPABILITIES=all \
           -e NVIDIA_VISIBLE_DEVICES=all \
           --volume=${hdl_localization_repo_root}:/root/workspace/src \
           --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
           --net=host \
           --ipc=host \
           --name=${docker container name} \
           --env="DISPLAY=$DISPLAY" \
           ${docker image} /bin/bash
```   

⚠️ **You should change {hdl_localization_repo_root}, {docker container name}, {docker image} to suit your environment.**  

For example,  
```
nvidia-docker run --privileged -it \
           -e NVIDIA_DRIVER_CAPABILITIES=all \
           -e NVIDIA_VISIBLE_DEVICES=all \
           --volume=/home/taeyoung/Desktop/hdl-localization-ROS2:/root/workspace/src \
           --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
           --net=host \
           --ipc=host \
           --name=hdl-localization-ros2 \
           --env="DISPLAY=$DISPLAY" \
           --env="QT_X11_NO_MITSHM=1" \
           hdl-localization-ros2:latest /bin/bash
```
```