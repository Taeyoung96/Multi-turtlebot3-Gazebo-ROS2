# Multi-turtlebot3-Gazebo-ROS2

## What's New?  
- Multi turtlebot3 environment  
- Turtlebot3 with Velodyne VLP-16 environment  
- Multi turtlebot3 Velodyne VLP-16 environment  

## Result  

## Build docker image 

```
docker pull tyoung96/multi-turtlebot-gazebo
```

## Make docker container  

On local terminal,

```
git clone https://github.com/Taeyoung96/Multi-turtlebot3-Gazebo-ROS2.git
```

```
xhost +local:docker
```

After that,

```
nvidia-docker run --privileged -it \
           -e NVIDIA_DRIVER_CAPABILITIES=all \
           -e NVIDIA_VISIBLE_DEVICES=all \
           --volume=${Multi-turtlebot3-Gazebo_repo_root}:/root/workspace/src \
           --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
           --net=host \
           --ipc=host \
           --name=${docker container name} \
           --env="DISPLAY=$DISPLAY" \
           ${docker image} /bin/bash
```   

⚠️ **You should change {Multi-turtlebot3-Gazebo_repo_root}, {docker container name}, {docker image} to suit your environment.**  

For example,  
```
nvidia-docker run --privileged -it \
           -e NVIDIA_DRIVER_CAPABILITIES=all \
           -e NVIDIA_VISIBLE_DEVICES=all \
           --volume=/home/taeyoung/Desktop/Multi-turtlebot3-Gazebo-ROS2:/root/workspace/src \
           --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
           --net=host \
           --ipc=host \
           --name=multi-turtlebot-gazebo \
           --env="DISPLAY=$DISPLAY" \
           --env="QT_X11_NO_MITSHM=1" \
           tyoung96/multi-turtlebot-gazebo:latest /bin/bash
```

## Build and run it!  

When you run the container, it looks like this
```
root@taeyoung-cilab:/#
```

Enter them in turn to proceed with the build.

```
cd root/workspace/
```
```
colcon build
```
```
export TURTLEBOT3_MODEL=burger
```
```
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/root/workspace/src/turtlebot3_simulations/turtlebot3_gazebo/models/
```
```
source install/setup.bash
```

- **TODO** : There is a still warning message.  

### Multi-turtlebot3  

```
ros2 launch turtlebot3_gazebo multi_turtlebot3_world.launch.py
```

### Turtlebot3 with Velodyne VLP-16
```
ros2 launch turtlebot3_gazebo turtlebot3_velodyne_burger.launch.py
```
### Mutli-turtlebot3 with Velodyne VLP-16
```
ros2 launch turtlebot3_gazebo multi_turtlebot3_velodyne_world.launch.py
```