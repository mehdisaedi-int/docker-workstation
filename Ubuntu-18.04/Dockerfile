FROM hossein20s/docker-workstation:robo-gym-ros2
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:robo-gym-melodic .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV PATH /opt/conda/bin:$PATH

RUN sudo apt update \
 && pip3 install robo-gym \
 && pip install robo-gym-server-modules

RUN mkdir -p /opt/robogym_ws && sudo chgrp users /opt/robogym_ws && sudo chmod g+w /opt/robogym_ws

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list' \
  && wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

RUN sudo apt-get update \
 && sudo apt-get install -qq -y python-rosdep python-catkin-tools


USER $UID
# https://github.com/cyberbotics/webots/releases/download/R2020b-rev1/webots-R2020b-rev1-x86-64_ubuntu-16.04.tar.bz2
#
#
#
RUN mkdir -p /opt/robogym_ws/src && cd /opt/robogym_ws/src \
   && git clone https://github.com/jr-robotics/robo-gym-robot-servers.git
#
COPY install.sh /opt/robogym_ws/src/robo-gym-robot-servers/
#
RUN /opt/robogym_ws/src/robo-gym-robot-servers/install.sh

#RUN cd /opt/ros_catkin_ws \
# && rosinstall_generator desktop --rosdistro melodic --deps --tar > melodic-desktop.rosinstall \
# && rosdep install --from-paths src --ignore-src --rosdistro melodic -y
# vcs import src < melodic-desktop.rosinstall
# ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release

USER root

RUN sudo chgrp users /opt/robogym_ws && sudo chmod g+w /opt/robogym_ws

COPY UR10.svg /opt/robogym_ws/
COPY UR10_simulator.sh /opt/robogym_ws/
COPY UR10_simulator.desktop /usr/share/applications/

RUN chmod +x /opt/robogym_ws/UR10_simulator.sh

COPY bash.bashrc /etc/

ENTRYPOINT ["/nxserver.sh"]

#
# WORKDIR /home/${USER}
