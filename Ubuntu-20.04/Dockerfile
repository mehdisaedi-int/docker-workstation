FROM hossein20s/docker-workstation:unity3D-6
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:Unity3D .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

RUN sudo mkdir -p $HOME/.local/share/unity3d/Certificates/

# I use this to create CACerts.pem
# openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out CACerts.pem

ADD CACerts.pem $HOME/.local/share/unity3d/Certificates/
ADD combined_entry.sh /
ADD write_license_file.sh /
ADD xvfb_build.sh /
ADD xvfb_runtests.sh /

RUN sudo chgrp -R users /opt/Unity && sudo chmod -R g+w /opt/Unity

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
