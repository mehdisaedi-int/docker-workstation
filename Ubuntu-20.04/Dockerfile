FROM hossein20s/docker-workstation:mobile
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:personal .
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

RUN sudo apt update -y && sudo apt install fuse sshfs rclone -y \
  && mknod -m 666 /dev/fuse c 10 229 \
  && sudo echo 'user_allow_other' | sudo tee -a /etc/fuse.conf 
  

#RUN sudo wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - \
#   && cp .dropbox-dist/dropboxd /usr/local/bin/

ENTRYPOINT ["/nxserver.sh"]

#USER $UID
#WORKDIR /home/${USER}
