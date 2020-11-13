FROM hossein20s/docker-workstation:robo-gy-conda
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:robo-gym-pycharm .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV PATH /opt/conda/bin:$PATH

RUN sudo apt-get update && sudo apt-get install -y openjdk-11-jdk default-jdk mysql-client
# RUN sudo apt install -y build-essential python-dev libmysqlclient-dev libmysqlcppconn-dev
RUN sudo apt install -y pkg-config && sudo apt install -y libfreetype6-dev

# install PyCharm community
RUN cd /tmp && \
    sudo wget -q http://download.jetbrains.com/python/pycharm-community-2020.2.3.tar.gz -O pycharm.tar.gz && \
    sudo mkdir -p /opt/apps && cd /opt/apps && sudo tar xvfz /tmp/pycharm.tar.gz && sudo rm /tmp/pycharm.tar.gz

# install PyCharm professional
RUN cd /tmp && \
    sudo wget -q http://download.jetbrains.com/python/pycharm-professional-2020.2.3.tar.gz -O pycharm.tar.gz && \
    sudo mkdir -p /opt/apps && cd /opt/apps && sudo tar xvfz /tmp/pycharm.tar.gz && sudo rm /tmp/pycharm.tar.gz

COPY pycharm/jetbrains-pycharm-community.desktop /usr/share/applications/
COPY pycharm/jetbrains-pycharm.desktop /usr/share/applications/

RUN sudo mkdir -p /opt/apps/bin && sudo chgrp users /opt/apps && sudo chmod g+w /opt/apps
ENV PATH /opt/conda/bin:/opt/apps/go/bin:/opt/apps/bin:$PATH

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
