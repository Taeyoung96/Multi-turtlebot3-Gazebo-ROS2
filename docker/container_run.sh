#!/bin/bash
# Author : Taeyoung Kim (https://github.com/Taeyoung96)

# Set the project directory (PROJECT_DIR) as the parent directory of the current working directory
PROJECT_DIR=$(dirname "$PWD")

# Move to the parent folder of the project directory
cd "$PROJECT_DIR"

# Check if arguments are provided for the image name and tag
if [ "$#" -ne 1 ]; then
  echo "[Error] Usage: $0 <container_name>"
  exit 1
fi

# Print the current working directory to verify the change
echo "Current working directory: $PROJECT_DIR"

# Assign the arguments to variables for clarity
CONTAINER_NAME="$1"

# Allow access to the X server for the docker container
xhost +local:docker

# Launch the nvidia-docker container with the provided image name and tag
nvidia-docker run --privileged -it \
           -e NVIDIA_DRIVER_CAPABILITIES=all \
           -e NVIDIA_VISIBLE_DEVICES=all \
           --volume="$PROJECT_DIR:/root/workspace/src" \
           --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
           --net=host \
           --ipc=host \
           --shm-size=2gb \
           --name="$CONTAINER_NAME" \
           --env="DISPLAY=$DISPLAY" \
           tyoung96/multi-turtlebot-gazebo:latest /bin/bash
