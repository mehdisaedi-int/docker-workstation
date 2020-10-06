FROM hossein20s/docker-workstation:unity3D-libs
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:Unity3D .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

# RUN sudo mkdir -p $HOME/.local/share/unity3d/Certificates/

# I use this to create CACerts.pem
# openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out CACerts.pem

# ADD CACerts.pem $HOME/.local/share/unity3d/Certificates/
RUN curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=1TZOpCYtIrJfWrwLMLgougfOK671GI2jF" > /dev/null \
  && curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=1TZOpCYtIrJfWrwLMLgougfOK671GI2jF" -o /tmp/part.tgz \
  && sudo tar zxf /tmp/part.tgz -C /opt

RUN curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=1r7n3qtkVZaoJptc-Y9mumdNyPMsVunxX" > /dev/null \
  && curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=1r7n3qtkVZaoJptc-Y9mumdNyPMsVunxX" -o /tmp/part.tgz \
  && sudo tar zxf /tmp/part.tgz -C /opt/Unity/Hub

RUN rm /tmp/*tgz

# This will add all files again to docker image and ignore all previous images
RUN sudo chgrp -R users /opt/Unity && sudo chmod -R g+w /opt/Unity


ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
#
#
