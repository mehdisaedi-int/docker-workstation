FROM hossein20s/docker-workstation:robo-gym-melodic
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:rlros-srl .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV PATH /opt/conda/bin:$PATH

COPY env_rlros.yml .
RUN conda update -n base -c defaults conda \
  && conda env create --name rlros --file env_rlros.yml \
  && conda init bash

RUN sudo chgrp -R users /opt/conda/envs/rlros && sudo chmod -R g+w /opt/conda/envs/rlros

ENTRYPOINT ["/nxserver.sh"]

#
# WORKDIR /home/${USER}
