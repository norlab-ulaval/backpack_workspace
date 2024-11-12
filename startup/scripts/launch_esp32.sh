#! /bin/bash
# service file: /etc/systemd/system/launch_esp32.service

screen_name="esp32"
screen -S $screen_name -X stuff $'\003'

source /opt/ros/melodic/setup.bash
source /home/robot/ros_ws/devel/setup.bash

sleep 1

echo "Starting the ESP32..."
screen -dmS $screen_name roslaunch backpack_microcontrollers esp32.launch 

sleep 2
if screen -list | grep -q $screen_name; then
    echo "ESP32 started successfully in screen  '$screen_name.'"
else
    echo "ERROR! Failed to start ESP32."
fi
