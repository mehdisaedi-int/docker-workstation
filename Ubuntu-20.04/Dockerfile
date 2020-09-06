FROM hossein20s/docker-workstation:conda
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:conda-pycharm .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV PATH /opt/conda/bin:$PATH

RUN sudo apt-get update && sudo apt-get install -y mysql-client
# RUN sudo apt install -y build-essential python-dev libmysqlclient-dev libmysqlcppconn-dev
RUN sudo apt install -y pkg-config && sudo apt install -y libfreetype6-dev

# install PyCharm community
RUN sudo mkdir -p /opt/apps && cd /opt/apps && \
    sudo wget -q http://download.jetbrains.com/python/pycharm-community-2020.2.1.tar.gz -outfile pycharm-community.tar.gz && \
    sudo tar xvfz pycharm-community.tar.gz && \
    sudo rm pycharm-community.tar.gz

# install PyCharm professional
RUN sudo mkdir -p /opt/apps && cd /opt/apps && \
    sudo wget -q http://download.jetbrains.com/python/pycharm-professional-2020.2.1.tar.gz -outfile && pycharm-professional.tar.gz \
    sudo tar xvfz pycharm-professional.tar.gz && \
    sudo rm pycharm-professional.tar.gz

COPY pycharm/jetbrains-pycharm-community.desktop /usr/share/applications/
COPY pycharm/jetbrains-pycharm.desktop /usr/share/applications/

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
