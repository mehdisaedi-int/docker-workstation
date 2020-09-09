FROM hossein20s/docker-workstation:dev
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

ARG TIMEZONE="America/Los_Angeles"
RUN echo ${TIMEZONE} > /etc/timezone

RUN sudo apt install -y rsync rubygems && sudo gem install gemfury
RUN sudo apt install -y ffmpeg python3-tk python3-opencv
RUN sudo apt install -y ansible redis
RUN sudo apt install -y python-dev python3-dev libmysqlclient-dev default-libmysqlclient-dev
RUN sudo apt update && sudo apt install -y hardinfo hwinfo lshw mesa-utils grub-efi-amd64-bin nvidia-cuda-toolkit
# nvidia-driver-440


COPY env_ml.yml .
#RUN conda env update --name ml --file env_ml.yml
RUN conda env create --file env_ml.yml

RUN sudo apt -y upgrade

RUN sudo mkdir -p /opt/apps/bin && sudo chgrp users /opt/apps/bin && sudo chmod g+w /opt/apps/bin
ENV PATH /opt/apps/bin:/opt/conda/envs/ml/bin:$PATH

# install Kafka tools from the installed archive
RUN sudo mkdir -p /opt/apps && cd /opt/apps \
&& curl -fSL "https://www.dropbox.com/s/7g7o7wco148ausk/kafkatool2-opt-apps-installed.tgz?dl=0" -o /tmp/kafkatool.tgz \
&& sudo tar zxvf /tmp/kafkatool.tgz \
&& sudo rm /tmp/kafkatool.tgz
# && cp /opt/apps/kafkatool2/.install4j/install4j_x8ox99-kafkatool.desktop /usr/share/applications/kafkatool.desktop

RUN cp /bin/bash /bin/sh
RUN source ~/.bashrc


# install nomachone nxserver accessible by $USER
COPY nomachine/nxserver.sh /
RUN chown developer:users /nxserver.sh && chmod 755 /nxserver.sh

# ENV SHELL=/bin/bash
ENTRYPOINT ["/nxserver.sh"]

#USER $UID
#WORKDIR /home/${USER}
