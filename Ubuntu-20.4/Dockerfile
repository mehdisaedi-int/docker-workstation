FROM hossein20s/docker-workstation:x11
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:lbuntu .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0

RUN sudo apt update &&  sudo apt install -y dialog apt-utils
RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
RUN sudo apt install -y lubuntu-desktop lubuntu-restricted-addons lubuntu-restricted-extras
RUN sudo apt install -y mate-desktop-environment-core

COPY nomachine/nxserver.sh /
RUN sudo chmod 755 /nxserver.sh

COPY nomachine/etc /usr/NX/etc

ENTRYPOINT ["/nxserver.sh"]
# ENTRYPOINT ["/bin/sh", "-c", "$0 \"$@\"", "tail -f /dev/null"]