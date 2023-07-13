# Multi-turtlebot3-Gazebo-ROS2

## What's New?  
- Multi turtlebot3 environment  
- Turtlebot3 with Velodyne VLP-16 environment  
- Multi turtlebot3 Velodyne VLP-16 environment  

## Result  

### Multi turtlebot3


- [TF result](https://github.com/Taeyoung96/Multi-turtlebot3-Gazebo-ROS2/blob/master/tf_results/multi-robot.pdf)
 

https://github.com/Taeyoung96/Multi-turtlebot3-Gazebo-ROS2/assets/41863759/a7e5c019-68aa-47b5-8670-84e15d32e7d5


### Turtlebot3 with Velodyne VLP-16

- [TF result](https://github.com/Taeyoung96/Multi-turtlebot3-Gazebo-ROS2/blob/master/tf_results/velodyne-tf.pdf)

https://github.com/Taeyoung96/Multi-turtlebot3-Gazebo-ROS2/assets/41863759/7cdffde8-152f-4578-8fdd-0fefc65de9c7


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

### Re-enter the activated docker container  
```
docker exec -it -w /root/workspace multi-turtlebot-gazebo /bin/bash
```
```
source /opt/ros/humble/setup.bash
```
```
source install/setup.bash
```


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

### For keyboard teleop  

Check `/tb3_0/cmd_vel` and remapping topic.

```
ros2 run teleop_twist_keyboard teleop_twist_keyboard --ros-args --remap cmd_vel:=/tb3_0/cmd_vel
```

### Check TF   

```
ros2 run tf2_tools view_frames
```

## Acknowldegement

`multi_turtlebot3_world.launch` code is used for [ROS2 Navigation Online Course | The Construct](https://www.theconstructsim.com/robotigniteacademy_learnros/ros-courses-library/ros2-navigation/).  

For velodyne, I followed [this youtube link](https://youtu.be/NNR9RUNz5Pg) and modified the code.  

Each folder has their own license.  