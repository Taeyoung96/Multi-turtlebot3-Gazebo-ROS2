# Author: TaeYoung Kim
# email: tyoung96@yonsei.ac.kr

FROM osrf/ros:humble-desktop-full

# Install PCL & Eigen & essential libraries
RUN apt-get update && apt-get install -y cmake libatlas-base-dev libeigen3-dev libpcl-dev libgoogle-glog-dev libsuitesparse-dev libglew-dev wget unzip \
    python3-colcon-common-extensions ros-humble-gazebo-ros2-control ros-humble-ros2-controllers ros-humble-gazebo-ros-pkgs ros-humble-pcl-msgs ros-humble-pcl-conversions \
    ros-humble-joy*

RUN apt-get update && apt-get install -y ros-humble-turtlebot3-gazebo

WORKDIR /root/workspace