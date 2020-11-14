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

USER $UID

RUN mkdir -p /opt/robogym_ws/src && cd /opt/robogym_ws/src \
  && git clone https://github.com/jr-robotics/robo-gym-robot-servers.git

COPY install.sh /opt/robogym_ws/src/robo-gym-robot-servers/

RUN /opt/robogym_ws/src/robo-gym-robot-servers/install.sh

USER root

RUN sudo chgrp users /opt/robogym_ws && sudo chmod g+w /opt/robogym_ws

COPY UR10.svg /opt/robogym_ws/
COPY UR10_simulator.sh /opt/robogym_ws/
COPY UR10_simulator.desktop /usr/share/applications/

RUN chmod +x /opt/robogym_ws/UR10_simulator.sh

ENTRYPOINT ["/nxserver.sh"]

#
# WORKDIR /home/${USER}
