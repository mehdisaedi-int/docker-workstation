FROM hossein20s/docker-workstation:unity3D-1
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:unity3D-2 .
# use developer as the main user to install-> use sudo for any RUN command

RUN curl -fSL "https://www.dropbox.com/s/xkd7el8buke3vl2/Unity-Editor-Data-1.tgz?dl=0" -o /tmp/part.tgz && \
  cd /opt/Unity/Editor && sudo tar zxf /tmp/part.tgz

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
