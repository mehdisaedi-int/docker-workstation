FROM hossein20s/docker-workstation:detectron2
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

ARG TIMEZONE="America/Los_Angeles"
RUN echo ${TIMEZONE} > /etc/timezone

# install PyCharm professional
# RUN cd /tmp && \
#    sudo wget -q http://download.jetbrains.com/python/pycharm-professional-2020.2.3.tar.gz -O pycharm.tar.gz && \
#    sudo mkdir -p /opt/apps && cd /opt/apps && sudo tar xvfz /tmp/pycharm.tar.gz && sudo rm /tmp/pycharm.tar.gz

#COPY jetbrains-pycharm.desktop /usr/share/applications/

#RUN sudo chgrp users opt/apps/pycharm-2020.2.3 && sudo chmod g+w opt/apps/pycharm-2020.2.3


COPY env_mobile.yml .
RUN conda env update --name mobile --file env_mobile.yml

RUN sudo chgrp -R users /opt/conda/envs/mobile && sudo chmod -R g+w /opt/conda/envs/mobile

ENTRYPOINT ["/nxserver.sh"]
