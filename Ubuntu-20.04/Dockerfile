FROM hossein20s/docker-workstation:pytorch-nvidia
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


COPY env_ml.yml .

USER $UID

RUN sudo chgrp -R users /opt/conda/pkgs/cache && sudo chmod -R g+w /opt/conda/pkgs/cache
RUN conda env update --prefix ./env --file env_ml.yml --prune
# RUN sudo chgrp -R users /opt/conda/envs/ml && sudo chmod -R g+w /opt/conda/envs/ml


ENTRYPOINT ["/nxserver.sh"]

#USER $UID
#WORKDIR /home/${USER}
