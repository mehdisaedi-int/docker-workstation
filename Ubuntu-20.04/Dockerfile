FROM hossein20s/docker-workstation:unity3D-libs
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:unity3D-1 .
# use developer as the main user to install-> use sudo for any RUN command

RUN curl -fSL "https://www.dropbox.com/s/hqfk5vwbbx6wwd3/Unity-Editor.tgz?dl=0" -o /tmp/part.tgz && \
  sudo mkdir /opt/Unity && cd /opt/Unity && sudo tar zxf /tmp/part.tgz

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
