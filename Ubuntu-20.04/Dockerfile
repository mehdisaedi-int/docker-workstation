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
COPY environment.yml .
RUN conda env update --name ag --file environment.yml
# RUN conda env create --file environment.yml

# RUN sudo apt -y upgrade

RUN sudo mkdir -p /opt/apps/bin && sudo chgrp users /opt/apps/bin && sudo chmod g+w /opt/apps/bin
ENV PATH /opt/apps/bin:$PATH

COPY /opt/apps/kafkatool2/.install4j/install4j_qqmdbk-kafkatool.desktop /usr/share/applications/

COPY nomachine/nxserver.sh /
RUN chown developer:users /nxserver.sh && chmod 755 /nxserver.sh

ENTRYPOINT ["/nxserver.sh"]

#USER $UID
#WORKDIR /home/${USER}
