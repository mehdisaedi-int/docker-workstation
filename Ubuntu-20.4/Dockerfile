FROM hossein20s/docker-workstation:ubuntu-20.04-x11
MAINTAINER HosseinAkhlaghpour@gmail.com

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0

# RUN apt-get install -y vim xterm pulseaudio cups curl
ENV NOMACHINE_VERSION 6.11.2_1
ENV NOMACHINE_PACKAGE_NAME nomachine_6.11.2_1_amd64.deb
ENV NOMACHINE_MD5 d268d38823489c9b3cffd5d618c05b22

RUN sudo apt-get install -y mate-desktop-environment-core

# Installation of ssh is required if you want to connect to NoMachine server using SSH protocol when supported.
# Comment it out if you don't need it or if you use NoMachine free.

RUN sudo apt-get install -y ssh \
&& sudo service ssh start

# http://download.nomachine.com/download/6.11.2_1/Linux/nomachine_6.11.2_1_amd64.deb doesn't exist
# so I download it from https://www.nomachine.com/download/download&id=2 and store it in goolge drive
# RUN curl -fSL "http://download.nomachine.com/download/${NOMACHINE_VERSION}/Linux/${NOMACHINE_PACKAGE_NAME}" -o nomachine.deb \
RUN sudo curl -fSL "https://drive.google.com/uc?export=download&id=1SxqpwHXjiWl8h_a-jDUcD8J1WozbkOKB" -o nomachine.deb \
 && echo "${NOMACHINE_MD5} *nomachine.deb" | md5sum -c - \
&& sudo dpkg -i nomachine.deb
RUN sudo adduser developer nomachine

ADD developer.tgz /home/
RUN sudo chown -R developer:users /home/developer

ADD nomachine/etc.tgz /usr/NX/
RUN sudo chown -R nx:root /usr/NX/etc
COPY nomachine/nxserver.sh /
ENTRYPOINT ["/nxserver.sh"]