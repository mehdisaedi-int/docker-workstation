FROM hossein20s/docker-workstation:unity3D-5-2
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:unity3D-5-3 .
# use developer as the main user to install-> use sudo for any RUN command

RUN curl -fSL "https://www.dropbox.com/s/29bra8nzuqh3rsw/Unity-Editor-Data-5-3.tgz?dl=0" -o /tmp/part.tgz && \
  cd /opt/Unity/Editor && sudo tar zxf /tmp/part.tgz

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
