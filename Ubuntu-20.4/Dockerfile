FROM hossein20s/docker-workstation:nomachine
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:pycharm .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG UID=1000

# localozation
ARG TIMEZONE="America/Los_Angeles"
RUN echo ${TIMEZONE} > /etc/timezone

ENV PATH /opt/conda/bin:$PATH

# install PyCharm community
RUN sudo mkdir -p /opt/apps && cd /opt/apps && \
    sudo wget -q http://download.jetbrains.com/python/pycharm-community-2020.2.tar.gz && \
    sudo tar xvfz pycharm-community-2020.2.tar.gz && \
    sudo rm pycharm-community-2020.2.tar.gz

# install PyCharm professional
RUN sudo mkdir -p /opt/apps && cd /opt/apps && \
    sudo wget -q http://download.jetbrains.com/python/pycharm-professional-2020.2.tar.gz && \
    sudo tar xvfz pycharm-professional-2020.2.tar.gz && \
    sudo rm pycharm-professional-2020.2.tar.gz

COPY pycharm/jetbrains-pycharm-community.desktop /usr/share/applications/
COPY pycharm/jetbrains-pycharm.desktop /usr/share/applications/

ENTRYPOINT ["/nxserver.sh"]

USER $UID