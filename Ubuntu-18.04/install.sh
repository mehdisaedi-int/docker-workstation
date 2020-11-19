#!/bin/sh

# Run this from the src folder
echo "Installing robot-servers..."
cd /opt/robogym_ws/src
git clone -b melodic https://github.com/jr-robotics/mir_robot.git
git clone -b melodic https://github.com/jr-robotics/universal_robot.git

cd ..
sudo rosdep init
rosdep update
rosdep install --from-paths src -i -y --rosdistro melodic
source /opt/ros/melodic/setup.bash
catkin init
catkin build --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebugInfo
echo "Installed robot-servers"
