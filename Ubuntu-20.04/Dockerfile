FROM hossein20s/docker-workstation:unity3D-3-2
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:unity3D-4-1 .
# use developer as the main user to install-> use sudo for any RUN command

RUN curl -fSL "https://www.dropbox.com/s/j4i2i6i7bcl7jic/Unity-Editor-Data-4-1.tgz?dl=0" -o /tmp/part.tgz && \
  cd /opt/Unity/Editor && sudo tar zxf /tmp/part.tgz

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
