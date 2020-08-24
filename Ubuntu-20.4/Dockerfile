FROM ubuntu:20.04
MAINTAINER Hossein Akhlaghpour

ARG TIMEZONE="America/Los_Angeles"
ARG USER=developer
ARG UID=1000
ARG GID=1000
# default password for user
ARG PW=developer

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

# Desktop
RUN apt-get install -y lubuntu-desktop lubuntu-restricted-addons lubuntu-restricted-extras

# Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt update -y && apt install -y google-chrome-stable chromium-browser


# Option1: Using unencrypted password/ specifying password
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd \
&& echo '${USER} ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
&& adduser ${USER} users

# Option2: Using the same encrypted password as host
#COPY /etc/group /etc/group
#COPY /etc/passwd /etc/passwd
#COPY /etc/shadow /etc/shadow

# Setup default user, when enter docker container
USER ${UID}:${GID}
WORKDIR /home/${USER}

# ENTRYPOINT ["/bin/sh", "-c", "$0 \"$@\"", "xterm"]
ENTRYPOINT ["/bin/sh", "-c", "tail -f /dev/null"]
