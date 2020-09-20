FROM hossein20s/docker-workstation:unity3D-4
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:unity3D-5 .
# use developer as the main user to install-> use sudo for any RUN command

RUN curl -fSL "https://www.dropbox.com/s/39w33s9cof0ou09/Unity-Editor-Data-5.tgz?dl=0" -o /tmp/part.tgz && \
  cd /opt/Unity/Editor && sudo tar zxf /tmp/part.tgz

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
