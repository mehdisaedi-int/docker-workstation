FROM hossein20s/docker-workstation:dev-nodejs
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:redis-ruby-kafkatool .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

RUN sudo apt install -y rsync rubygems && sudo gem install gemfury
RUN sudo apt install -y ansible redis
RUN sudo apt update && sudo apt install -y hardinfo hwinfo lshw

# install Kafka tools from the installed archive
RUN sudo mkdir -p /opt/apps && cd /opt/apps \
&& curl -fSL "https://www.dropbox.com/s/7g7o7wco148ausk/kafkatool2-opt-apps-installed.tgz?dl=0" -o /tmp/kafkatool.tgz \
&& sudo tar zxvf /tmp/kafkatool.tgz \
&& sudo rm /tmp/kafkatool.tgz \
&& sudo chgrp -R users /opt/apps/kafkatool2 && sudo chmod -R a+g /opt/apps/kafkatool2 \
&& sudo ln -s /opt/apps/kafkatool2/kafkatool /usr/local/bin/kafkatool

COPY postman.desktop /usr/share/applications/

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
