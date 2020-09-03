FROM hossein20s/docker-workstation:personal
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:personal .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

#RUN sudo apt install -y ansible
RUN sudo apt install -y python-dev python3-dev libmysqlclient-dev default-libmysqlclient-dev

# Create the environment:
COPY env_ag.yml .
RUN conda env update --name ag --file env_ag.yml

COPY env_ml.yml .
# RUN conda env update --name ag --file env_ag.yml
RUN conda env create --file env_ml.yml

# RUN sudo apt -y upgrade

RUN sudo mkdir -p /opt/apps/bin && sudo chgrp users /opt/apps/bin && sudo chmod g+w /opt/apps/bin
ENV PATH /opt/apps/bin:$PATH

# install Kafka tools from the installed archive
RUN sudo mkdir -p /opt/apps && cd /opt/apps && \
    sudo wget -q https://drive.google.com/u/0/open?id=1QU5MtVeH4e-_XZzs86tqHSs13bSmm4vy -O kafkatool.tgz && \
    sudo tar xvfz kafkatool.tgz && \
    sudo rm kafkatool.tgz
COPY /opt/apps/kafkatool2/.install4j/install4j_qqmdbk-kafkatool.desktop /usr/share/applications/

# install nomachone nxserver accessible by $USER
COPY nomachine/nxserver.sh /
RUN chown developer:users /nxserver.sh && chmod 755 /nxserver.sh

ENTRYPOINT ["/nxserver.sh"]

#USER $UID
#WORKDIR /home/${USER}
