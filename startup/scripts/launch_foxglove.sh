#! /bin/bash
# service file: /etc/systemd/system/launch_foxglove.service

screen_name="foxglove_bridge"
screen -S $screen_name -X stuff $'\003'

source /opt/ros/melodic/setup.bash
source /home/robot/ros_ws/devel/setup.bash

sleep 1

echo "Starting Foxglove bridge..."
screen -dmS $screen_name roslaunch foxglove_bridge foxglove_bridge.launch send_buffer_limit:=1000000000

sleep 2
if screen -list | grep -q $screen_name; then
    echo "Foxglove bridge started successfully in screen  '$screen_name.'"
else
    echo "ERROR! Failed to start Foxglove bridge."
fi
