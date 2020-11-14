FROM hossein20s/docker-workstation:robo-gym-pycharm
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:robo-gym-ros2 .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV PATH /opt/conda/bin:$PATH

RUN sudo apt update && sudo apt install curl gnupg2 lsb-release \
  && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - \
  && sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list' \
  &&  mkdir -p /opt/ros2_crystal \
  &&  cd /opt/ros2_crystal \
  &&  wget https://github.com/ros2/ros2/releases/download/release-crystal-20191212/ros2-crystal-20191212-linux-bionic-amd64.tar.bz2 \
  && tar xf ros2-crystal-20191212-linux-bionic-amd64.tar.bz2  \
  && rm ros2-crystal-20191212-linux-bionic-amd64.tar.bz2

#RUN sudo apt update \
#  &&  sudo apt install -y python-rosdep \
#  &&  sudo rosdep init \
#  &&  rosdep update \


RUN cd /opt/ros2_crystal \
  && CHOOSE_ROS_DISTRO=crystal \
  &&  rosdep install --from-paths ros2-linux/share --ignore-src --rosdistro $CHOOSE_ROS_DISTRO -y --skip-keys \
  "console_bridge fastcdr fastrtps libopensplice67 libopensplice69 osrf_testing_tools_cpp poco_vendor rmw_connext_cpp rosidl_typesupport_connext_c rosidl_typesupport_connext_cpp rti-connext-dds-5.3.1 tinyxml_vendor tinyxml2_vendor urdfdom urdfdom_headers" \
  &&  sudo apt install -y libpython3-dev \
  &&  . /opt/ros2_crystal/ros2-linux/setup.bash \
  &&  sudo apt install python3-argcomplete

RUN sudo chgrp users /opt/ros2_crystal && sudo chmod g+w /opt/ros2_crystal

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
