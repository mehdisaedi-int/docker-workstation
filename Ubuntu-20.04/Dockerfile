FROM hossein20s/docker-workstation:notebook
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:dev-nodejs .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

USER root
#RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb \
#&& sudo apt install -y ./mysql-apt-config_0.8.15-1_all.deb \
#&& sudo rm ./mysql-apt-config_0.8.15-1_all.deb \ # it hangs may be the fix is
# RUN echo mysql-apt-config mysql-apt-config/select-server select mysql-5.7 | debconf-set-selections
#&& sudo apt update && sudo apt install -y mysql-workbench

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && \
    sudo apt update && \
    sudo apt install -y nodejs

RUN sudo npm install -g newman newman-reporter-html express eslint express-generator
RUN sudo snap install postman

#RUN wget https://dl.pstmn.io/download/latest/linux64 -O /tmp/postman.tar.gz \
#&& sudo tar -xzf /tmp/postman.tar.gz -C /opt/apps \
#&& rm /tmp/postman.tar.gz \
#&& sudo ln -s /opt/apps/Postman/Postman /usr/bin/postman \
#
#
#COPY postman.desktop /usr/share/applications/

SHELL ["/bin/sh", "-c"]
COPY env_python3.8.yml .
RUN conda env update --name python3.8 --file python3.8.yml

RUN sudo rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
