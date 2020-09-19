FROM hossein20s/docker-workstation:dev-tools
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

COPY env_ml.yml .
#RUN conda env update --name ml --file env_ml.yml
RUN conda env create --file env_ml.yml

RUN sudo apt -y upgrade

RUN cp /bin/bash /bin/sh
RUN source ~/.bashrc

# install nomachone nxserver accessible by $USER
COPY nomachine/nxserver.sh /
RUN chown developer:users /nxserver.sh && chmod 755 /nxserver.sh

# ENV SHELL=/bin/bash
ENTRYPOINT ["/nxserver.sh"]

#USER $UID
#WORKDIR /home/${USER}
