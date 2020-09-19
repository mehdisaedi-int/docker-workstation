FROM hossein20s/docker-workstation:dev-nodejs
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:dev .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

RUN sudo apt install -y rsync rubygems && sudo gem install gemfury
RUN sudo apt install -y ansible redis
RUN sudo apt update && sudo apt install -y hardinfo hwinfo lshw

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
