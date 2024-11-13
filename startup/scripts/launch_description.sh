#! /bin/bash
# service file: /etc/systemd/system/launch_description.service

screen_name="robot_description"
screen -S $screen_name -X stuff $'\003'

source /opt/ros/melodic/setup.bash
source /home/robot/ros_ws/devel/setup.bash

sleep 5

echo "Starting Robot Description..."
screen -dmS $screen_name roslaunch backpack_description description.launch 

sleep 2
if screen -list | grep -q $screen_name; then
    echo "Robot description started successfully in screen  '$screen_name.'"
else
    echo "ERROR! Failed to start Robot description."
fi
