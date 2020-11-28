FROM hossein20s/docker-workstation:robo-gym-melodic
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:mobile .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

user root
RUN apt update && apt install -y swig cmake ffmpeg
RUN cd /opt \
   && git clone --recursive https://github.com/DLR-RM/rl-baselines3-zoo

ARG TIMEZONE="America/Los_Angeles"
RUN echo ${TIMEZONE} > /etc/timezone

COPY env_ml.yml .
RUN conda update -n base -c defaults conda \
  && conda env create --name ml --file env_ml.yml \
  && conda init bash

# RUN sudo chgrp -R users /opt/conda/envs/ml && sudo chmod -R g+w /opt/conda/envs/ml

ENTRYPOINT ["/nxserver.sh"]
