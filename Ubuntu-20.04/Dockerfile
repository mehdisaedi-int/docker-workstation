FROM hossein20s/docker-workstation:detectron2
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:detectron2 .
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

RUN sudo apt update && sudo apt install -y ffmpeg python3-tk python3-opencv
RUN sudo apt update && sudo apt install -y hardinfo hwinfo lshw mesa-utils grub-efi-amd64-bin nvidia-cuda-toolkit

COPY env_ml.yml .

RUN conda env update --name ml --file env_ml.yml
RUN sudo chgrp -R users /opt/conda/envs/ml && sudo chmod -R g+w /opt/conda/envs/ml


ENTRYPOINT ["/nxserver.sh"]

#USER $UID
#WORKDIR /home/${USER}
