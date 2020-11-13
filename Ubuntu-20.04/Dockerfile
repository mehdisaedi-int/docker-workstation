FROM joanneumrobotics/robo-gym-robot-server-side
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:robo-gym .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0

# docker build -t hossein20s/docker-workstation:base .
ARG TIMEZONE="America/Los_Angeles"
ARG USER=developer
ARG UID=1000
ARG GID=1000
# default password for user
ARG PW=developer

ARG NOMACHINE_VERSION=6.11.2_1
ARG NOMACHINE_PACKAGE_NAME=nomachine_6.11.2_1_amd64.deb
ARG NOMACHINE_MD5=d268d38823489c9b3cffd5d618c05b22

RUN apt update -y && apt-get install -y aptitude && aptitude dist-upgrade --purge-unused -y && aptitude clean
RUN apt -y upgrade
RUN apt install -y software-properties-common
RUN apt install -y python3-pip
RUN apt install -y build-essential libssl-dev libffi-dev python-dev python3-dev python3-setuptools screen
RUN apt install -y ssh openssh-server
RUN apt install -y libmysqlclient-dev default-libmysqlclient-dev

RUN add-apt-repository universe
RUN apt update -y && apt install -y dnsutils iputils-ping netcat nmap dnsutils locales locales-all pulseaudio cups

RUN sudo apt update -y && sudo apt install fuse sshfs rclone -y \
  && mknod -m 666 /dev/fuse c 10 229 \
  && sudo echo 'user_allow_other' | sudo tee -a /etc/fuse.conf

# RUN apt install -y openjdk-11-jdk default-jdk
RUN apt install -y sudo nano htop vim xterm curl wget git \
&& rm -rf /var/lib/apt/lists/*
# localozation
RUN apt install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN echo ${TIMEZONE} > /etc/timezone

# Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt update -y && apt install -y google-chrome-stable chromium-browser

# Option1: Using unencrypted password/ specifying password
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd \
&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
&& adduser ${USER} users && adduser ${USER} sudo \
&& usermod --shell /bin/bash ${USER}

# Option2: Using the same encrypted password as host
#COPY /etc/group /etc/group
#COPY /etc/passwd /etc/passwd
#COPY /etc/shadow /etc/shadow

# Nomachine even though there is no desktop installed
# http://download.nomachine.com/download/6.11.2_1/Linux/nomachine_6.11.2_1_amd64.deb doesn't exist
# so I download it from https://www.nomachine.com/download/download&id=2 and store it in goolge drive
# RUN curl -fSL "http://download.nomachine.com/download/${NOMACHINE_VERSION}/Linux/${NOMACHINE_PACKAGE_NAME}" -o nomachine.deb \
RUN curl -fSL "https://www.dropbox.com/s/2litfp1k5o1izja/nomachine_6.11.2_1_amd64.deb?dl=0" -o nomachine.deb \
&& echo "${NOMACHINE_MD5} nomachine.deb" | md5sum -c - \
&& dpkg -i nomachine.deb && rm nomachine.deb
RUN groupadd -r nomachine -g 433 && adduser ${USER} nomachine


RUN apt update &&  apt install -y dialog apt-utils
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt install -y lubuntu-desktop lubuntu-restricted-addons lubuntu-restricted-extras lxqt
# RUN apt install -y mate-desktop-environment-core

ARG NX_NODE_CFG=/usr/NX/etc/node.cfg
ARG NX_SRV_CFG=/usr/NX/etc/server.cfg
RUN sudo sed -i '/DefaultDesktopCommand/c\DefaultDesktopCommand "/usr/bin/startlxqt"' $NX_NODE_CFG
# RUN sudo sed -i '/DefaultDesktopCommand/c\DefaultDesktopCommand "/usr/bin/startlxde"' $NX_NODE_CFG
RUN sudo sed -i '/DefaultDesktopCommand/c\DefaultDesktopCommand "/usr/bin/startlxqt"' $NX_SRV_CFG

ADD nomachine/nxserver.sh /
RUN chmod 755 /nxserver.sh

ENV PATH /opt/conda/bin:$PATH

RUN sudo apt-get update --fix-missing && sudo apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 git

#RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
#    sudo /bin/bash ~/miniconda.sh -b -p /opt/conda && \
#    rm ~/miniconda.sh && \
#    sudo ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
#    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
#    echo "conda activate base" >> ~/.bashrc
#
#RUN sudo chown -R root:users /opt/conda && sudo chmod -R g+w /opt/conda
## RUN conda install anaconda
#RUN conda install netcdf4
#
#ENV TINI_VERSION v0.19.0
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
#RUN sudo chmod +x /tini
#
#
#RUN sudo apt-get update && sudo apt-get install -y mysql-client
## RUN sudo apt install -y build-essential python-dev libmysqlclient-dev libmysqlcppconn-dev
#RUN sudo apt install -y pkg-config && sudo apt install -y libfreetype6-dev && sudo apt-get clean

## install PyCharm community
#RUN cd /tmp && \
#    sudo wget -q http://download.jetbrains.com/python/pycharm-community-2020.2.3.tar.gz -O pycharm.tar.gz && \
#    sudo mkdir -p /opt/apps && cd /opt/apps && sudo tar xvfz /tmp/pycharm.tar.gz && sudo rm /tmp/pycharm.tar.gz
#
## install PyCharm professional
#RUN cd /tmp && \
#    sudo wget -q http://download.jetbrains.com/python/pycharm-professional-2020.2.3.tar.gz -O pycharm.tar.gz && \
#    sudo mkdir -p /opt/apps && cd /opt/apps && sudo tar xvfz /tmp/pycharm.tar.gz && sudo rm /tmp/pycharm.tar.gz
#
#COPY pycharm/jetbrains-pycharm-community.desktop /usr/share/applications/
#COPY pycharm/jetbrains-pycharm.desktop /usr/share/applications/

#RUN sudo mkdir -p /opt/apps/bin && sudo chgrp users /opt/apps && sudo chmod g+w /opt/apps
#ENV PATH /opt/conda/bin:/opt/apps/go/bin:/opt/apps/bin:$PATH

ENTRYPOINT ["/nxserver.sh"]
