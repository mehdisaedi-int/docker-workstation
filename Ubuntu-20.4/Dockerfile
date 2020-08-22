FROM ubuntu:20.04
MAINTAINER Hossein Akhlaghpour

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000


RUN apt-get update -y && apt-get install -y aptitude && aptitude dist-upgrade --purge-unused -y && aptitude clean
RUN apt -y upgrade
RUN apt-get install -y software-properties-common
RUN apt install -y python3-pip
RUN apt install -y build-essential libssl-dev libffi-dev python3-dev python3-setuptools
RUN apt install -y sudo

RUN apt-get install -y nano htop vim xterm ssh openssh-server curl wget git
RUN apt-get install -y openjdk-8-jdk default-jdk

RUN add-apt-repository universe
RUN apt-get update -y

RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN echo "America/Los_Angeles" > /etc/timezone

RUN apt-get install -y lubuntu-desktop lubuntu-restricted-addons lubuntu-restricted-extras

#Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update -y && apt-get install -y google-chrome-stable chromium-browser

#RUN useradd -m -s /bin/bash -p developer developer
#RUN adduser developer sudo

ENV DISPLAY :0

# RUN apt-get install -y vim xterm pulseaudio cups curl
ENV NOMACHINE_VERSION 6.11.2_1
ENV NOMACHINE_PACKAGE_NAME nomachine_6.11.2_1_amd64.deb
ENV NOMACHINE_MD5 d268d38823489c9b3cffd5d618c05b22

RUN sudo apt-get install -y mate-desktop-environment-core

# Installation of ssh is required if you want to connect to NoMachine server using SSH protocol when supported.
# Comment it out if you don't need it or if you use NoMachine free.

RUN apt-get install -y ssh \
&& service ssh start

# http://download.nomachine.com/download/6.11.2_1/Linux/nomachine_6.11.2_1_amd64.deb doesn't exist
# so I download it from https://www.nomachine.com/download/download&id=2 and store it in goolge drive
# RUN curl -fSL "http://download.nomachine.com/download/${NOMACHINE_VERSION}/Linux/${NOMACHINE_PACKAGE_NAME}" -o nomachine.deb \
RUN curl -fSL "https://drive.google.com/uc?export=download&id=1SxqpwHXjiWl8h_a-jDUcD8J1WozbkOKB" -o nomachine.deb \
 && echo "${NOMACHINE_MD5} *nomachine.deb" | md5sum -c - \
&& dpkg -i nomachine.deb
RUN groupadd -r nomachine -g 433 \
&& useradd -u 1001 -r -g nomachine -d /home/developer -s /bin/bash -c "Developer" developer \
&& echo 'developer:developer' | chpasswd \
&& echo 'developer ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
&& adduser developer users

ADD developer.tgz /home/
RUN chown -R developer:users /home/developer

ADD nomachine/etc.tgz /usr/NX/
RUN chown -R nx:root /usr/NX/etc
ADD nomachine/nxserver.sh /
ENTRYPOINT ["/nxserver.sh"]