FROM hossein20s/docker-workstation:detectron2
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:dropbox .
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

RUN cd /root &&  sudo wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - \
   && cp /root/.dropbox-dist/dropboxd /usr/local/bin/

ENTRYPOINT ["/nxserver.sh"]

#USER $UID
#WORKDIR /home/${USER}
