FROM ubuntu:20.04
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:nomachine .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0

RUN apt update -y && apt-get install -y aptitude && aptitude dist-upgrade --purge-unused -y && aptitude clean
RUN apt -y upgrade
RUN apt install -y software-properties-common
RUN apt install -y python3-pip
RUN apt install -y build-essential libssl-dev libffi-dev python3-dev python3-setuptools
RUN apt install -y sudo

RUN apt install -y nano htop vim xterm
RUN apt install -y ssh openssh-server
RUN apt install -y curl wget git
RUN apt install -y openjdk-8-jdk default-jdk

RUN add-apt-repository universe
RUN apt update -y && apt install -y dnsutils iputils-ping

# localozation
RUN apt install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ARG TIMEZONE="America/Los_Angeles"
RUN echo ${TIMEZONE} > /etc/timezone

# Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt update -y && apt install -y google-chrome-stable chromium-browser

RUN sudo apt update &&  sudo apt install -y dialog apt-utils
RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
RUN sudo apt install -y lubuntu-desktop lubuntu-restricted-addons lubuntu-restricted-extras
RUN sudo apt install -y mate-desktop-environment-core

### set up user account
ENV NX_USER=developer
ENV NX_PASSWORD=developer
ENV NX_UID=1000
ENV NX_GID=1000

# Nomachine even though there is no desktop installed
RUN apt install -y pulseaudio
RUN apt install -y cups

RUN groupadd -r $NX_USER -g $NX_GID && \
  useradd -u $NX_UID -r -g $NX_USER -d /home/$NX_USER -s /bin/bash -c "NX_$USER" $NX_USER && \
  # adduser $NX_USER sudo && \
  mkdir /home/$NX_USER && \
  chown -R $NX_USER:$NX_GID /home/$NX_USER && \
  echo $NX_USER':'$NX_PASSWORD | chpasswd


#RUN apt-get install -y ubuntu-gnome-desktop
#RUN apt-get install -y kubuntu-full kubuntu-restricted-addons kubuntu-restricted-extras
RUN apt-get install -y lubuntu-desktop lubuntu-restricted-addons lubuntu-restricted-extras
#RUN apt-get install -y ubuntu-budgie-desktop budgie-indicator-applet


# mostly from https://github.com/mirekphd/docker-nomachine-desktop

ARG NOMACHINE_VERSION=6.11.2_1
ARG NOMACHINE_PACKAGE_NAME=nomachine_6.11.2_1_amd64.deb
ARG NOMACHINE_MD5=d268d38823489c9b3cffd5d618c05b22


# http://download.nomachine.com/download/6.11.2_1/Linux/nomachine_6.11.2_1_amd64.deb doesn't exist
# so I download it from https://www.nomachine.com/download/download&id=2 and store it in goolge drive
# RUN curl -fSL "http://download.nomachine.com/download/${NOMACHINE_VERSION}/Linux/${NOMACHINE_PACKAGE_NAME}" -o nomachine.deb \
RUN curl -fSL "https://drive.google.com/uc?export=download&id=1SxqpwHXjiWl8h_a-jDUcD8J1WozbkOKB" -o nomachine.deb \
&& echo "${NOMACHINE_MD5} *nomachine.deb" | md5sum -c - \
&& dpkg -i nomachine.deb && rm nomachine.deb



# edit the Nomachine node configuration;
# caution: both node.cfg and server.cfg files
# must be edited for the changes to take effect;
# define the location and names of the config files
ARG NX_NODE_CFG=/usr/NX/etc/node.cfg
ARG NX_SRV_CFG=/usr/NX/etc/server.cfg
# (note we edit the config files *[i]n place* (hence sed -i)
# and replace *[c]omplete* lines using "c\" switch):
# - replace the default desktop command (DefaultDesktopCommand) used by NoMachine with the preferred (lightweight) desktop
RUN sed -i '/DefaultDesktopCommand/c\DefaultDesktopCommand "/usr/bin/startlxqt"' $NX_NODE_CFG
# RUN sed -i '/AvailableSessionTypes/c\AvailableSessionTypes physical-desktop,unix-xsession-default' $NX_NODE_CFG

# # - replace the location of the nxserver log file, because the default one required sudo
# # (but first create a new folder and empty logfile inside the user home folder)
# COPY nxserver.log /tmp
# RUN chown $NX_USER:$NX_GID /tmp/nxserver.log
# RUN sed -i "/SystemLogFile/c\SystemLogFile ${LOG_FOLDER}nxserver.log" $NX_NODE_CFG && \
# 	sed -i "/SystemLogFile/c\SystemLogFile ${LOG_FOLDER}nxserver.log" $NX_SRV_CFG

# # instead of blind editing using sed, simply edit the config files
# # outside the container (in git), and then copy them to the container
# COPY node.cfg /usr/NX/etc/node.cfg
# COPY server.cfg /usr/NX/etc/server.cfg

# add nx_user to sudoers file but only for startup of the nxserver service
RUN echo "${NX_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

### Cleanup
#RUN apt-get autoclean \
#    && apt-get autoremove \
#    && rm -rf /var/lib/apt/lists/*

# listen to NX port (4000 by default)
# EXPOSE 22 4000
EXPOSE 4000
# EXPOSE 23 4001


# use environment variables USER and PASSWORD (passed by docker run -e)
# to create a priviledged user account, and set it up for use by SSH and NoMachine;
# note that ADD is executed by the host, not the container (unlike RUN)
ADD nomachine/nxserver.sh /
RUN chmod 755 /nxserver.sh

ENTRYPOINT ["/nxserver.sh"]
# ENTRYPOINT ["/bin/sh", "-c", "$0 \"$@\"", "tail -f /dev/null"]

# Switch back to unpriviledged user (using its UID, not name)
# to avoid accidental container runs as root
USER $NX_UID


#COPY nomachine/nxserver.sh /
#RUN sudo chmod 755 /nxserver.sh
#
#COPY nomachine/etc /usr/NX/etc
#
#ENTRYPOINT ["/nxserver.sh"]
