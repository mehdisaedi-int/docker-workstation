FROM hossein20s/docker-workstation:base
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:nomachine .
ARG TIMEZONE="America/Los_Angeles"
ARG USER=developer

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0

# localozation
RUN apt install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ARG TIMEZONE="America/Los_Angeles"
RUN echo ${TIMEZONE} > /etc/timezone

RUN apt update &&  apt install -y dialog apt-utils
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt install -y lubuntu-desktop lubuntu-restricted-addons lubuntu-restricted-extras
RUN apt install -y mate-desktop-environment-core


# edit the Nomachine node configuration;
# caution: both node.cfg and server.cfg files
# must be edited for the changes to take effect;
# define the location and names of the config files
ARG NX_NODE_CFG=/usr/NX/etc/node.cfg
#ARG NX_SRV_CFG=/usr/NX/etc/server.cfg
# (note we edit the config files *[i]n place* (hence sed -i)
# and replace *[c]omplete* lines using "c\" switch):
# - replace the default desktop command (DefaultDesktopCommand) used by NoMachine with the preferred (lightweight) desktop
RUN sudo sed -i '/DefaultDesktopCommand/c\DefaultDesktopCommand "/usr/bin/startlxqt"' $NX_NODE_CFG
# RUN sed -i '/AvailableSessionTypes/c\AvailableSessionTypes physical-desktop,unix-xsession-default' $NX_SRV_CFG

# # - replace the location of the nxserver log file, because the default one required sudo
# # (but first create a new folder and empty logfile inside the user home folder)
# COPY nxserver.log /tmp
# RUN chown $NX_USER:$NX_GID /tmp/nxserver.log
# RUN sed -i "/SystemLogFile/c\SystemLogFile ${LOG_FOLDER}nxserver.log" $NX_NODE_CFG && \
# 	sed -i "/SystemLogFile/c\SystemLogFile ${LOG_FOLDER}nxserver.log" $NX_SRV_CFG

# # instead of blind editing using sed, simply edit the config files
# # outside the container (in git), and then copy them to the container
# COPY nomachine/etc/node.cfg /usr/NX/etc/node.cfg
# COPY nomachine/etc/server.cfg /usr/NX/etc/server.cfg

# use environment variables USER and PASSWORD (passed by docker run -e)
# to create a priviledged user account, and set it up for use by SSH and NoMachine;
# note that ADD is executed by the host, not the container (unlike RUN)
ADD nomachine/nxserver.sh /
RUN chmod 755 /nxserver.sh

ENTRYPOINT ["/nxserver.sh"]
# ENTRYPOINT ["/bin/sh", "-c", "$0 \"$@\"", "tail -f /dev/null"]

# Switch back to unpriviledged user
# to avoid accidental container runs as root
# this will cause problem, giving this error
# effective uid is not 0, is /usr/bin/sudo on a file system with the 'nosuid' option set or an NFS file system without root privileges
#USER ${USER}
#WORKDIR /home/${USER}
