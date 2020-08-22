FROM hossein20s/docker-workstation:ubuntu-20.04-anaconda
MAINTAINER HosseinAkhlaghpour@gmail.com

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
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

ADD pycharm/jetbrains-pycharm-community.desktop /usr/share/applications/
ADD pycharm/jetbrains-pycharm.desktop /usr/share/applications/


ADD developer.tgz.lock /home/
ADD nomachine/nxserver.developer.sh /

ENTRYPOINT ["/nxserver.developer.sh"]