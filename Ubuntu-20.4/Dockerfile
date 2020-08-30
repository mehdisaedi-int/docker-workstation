FROM ubuntu:20.04
MAINTAINER HosseinAkhlaghpour@gmail.com

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

RUN echo ${TIMEZONE} > /etc/timezone

# Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt update -y && apt install -y google-chrome-stable chromium-browser

# Option1: Using unencrypted password/ specifying password
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd \
&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
&& adduser ${USER} users && adduser ${USER} sudo

# Option2: Using the same encrypted password as host
#COPY /etc/group /etc/group
#COPY /etc/passwd /etc/passwd
#COPY /etc/shadow /etc/shadow

# Nomachine even though there is no desktop installed
RUN apt install -y pulseaudio
RUN apt install -y cups
# http://download.nomachine.com/download/6.11.2_1/Linux/nomachine_6.11.2_1_amd64.deb doesn't exist
# so I download it from https://www.nomachine.com/download/download&id=2 and store it in goolge drive
# RUN curl -fSL "http://download.nomachine.com/download/${NOMACHINE_VERSION}/Linux/${NOMACHINE_PACKAGE_NAME}" -o nomachine.deb \
RUN curl -fSL "https://drive.google.com/uc?export=download&id=1SxqpwHXjiWl8h_a-jDUcD8J1WozbkOKB" -o /tmp/nomachine.deb \
# && "${NOMACHINE_MD5} nomachine.deb" | md5sum -c - \
&& dpkg -i /tmp/nomachine.deb && rm /tmp/nomachine.deb
RUN groupadd -r nomachine -g 433 && adduser ${USER} nomachine

ENTRYPOINT ["/bin/sh", "-c", "$0 \"$@\"", "tail -f /dev/null"]
