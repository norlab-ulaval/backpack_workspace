#! /bin/bash
# service file: /etc/systemd/system/launch_roscore.service

screen_name="roscore"
screen -S $screen_name -X stuff $'\003'

source /opt/ros/melodic/setup.bash
source /home/robot/ros_ws/devel/setup.bash

sleep 1

echo "Starting Roscore..."
screen -dmS $screen_name roscore 

sleep 2
if screen -list | grep -q $screen_name; then
    echo "Roscore started successfully in screen  '$screen_name.'"
else
    echo "ERROR! Failed to start Roscore."
fi
