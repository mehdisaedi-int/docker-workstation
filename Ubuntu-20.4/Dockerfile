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
RUN apt-get update -y && apt-get install -y dnsutils iputils-ping

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

RUN useradd -m -s /bin/bash -p developer developer \
&& echo 'developer ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
&& adduser developer users

ENV DISPLAY :0

USER developer
# ENTRYPOINT ["/bin/sh", "-c", "$0 \"$@\"", "xterm"]
ENTRYPOINT ["/bin/sh", "-c", "tail -f /dev/null"]
