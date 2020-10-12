FROM hossein20s/docker-workstation:detectron2
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:perosnal .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

user root

ARG TIMEZONE="America/Los_Angeles"
RUN echo ${TIMEZONE} > /etc/timezone

RUN sudo apt install fuse sshfs rclone -y \
  && mknod -m 666 /dev/fuse c 10 229 \
  && sudo echo 'user_allow_other' | sudo tee -a /etc/fuse.conf \
  && sudo chgrp users /dev/fuse && sudo chmod g+w /dev/fuse



#RUN sudo wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - \
#   && cp .dropbox-dist/dropboxd /usr/local/bin/

ENTRYPOINT ["/nxserver.sh"]

#USER $UID
#WORKDIR /home/${USER}
