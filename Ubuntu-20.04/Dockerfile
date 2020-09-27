FROM hossein20s/docker-workstation:conda-pycharm
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:dev-nodejs .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

#RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb \
#&& sudo apt install -y ./mysql-apt-config_0.8.15-1_all.deb \
#&& sudo rm ./mysql-apt-config_0.8.15-1_all.deb \ # it hangs may be the fix is
# RUN echo mysql-apt-config mysql-apt-config/select-server select mysql-5.7 | debconf-set-selections
#&& sudo apt update && sudo apt install -y mysql-workbench

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && \
    sudo apt update && \
    sudo apt install -y python-dev python3-dev libmysqlclient-dev default-libmysqlclient-dev


ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
