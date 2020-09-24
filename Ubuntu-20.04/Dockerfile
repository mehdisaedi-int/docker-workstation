FROM hossein20s/docker-workstation:dev-nvidia-toolkit
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:dev-tools .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

RUN wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz \
&& sudo tar -xzf postman.tar.gz -C /opt/apps \
&& rm postman.tar.gz \
&& sudo ln -s /opt/apps/Postman/Postman /usr/bin/postman \
&& npm install -g newman newman-reporter-html

COPY postman.desktop /usr/share/applications/

# install Kafka tools from the installed archive
RUN sudo mkdir -p /opt/apps && cd /opt/apps \
&& curl -fSL "https://www.dropbox.com/s/7g7o7wco148ausk/kafkatool2-opt-apps-installed.tgz?dl=0" -o /tmp/kafkatool.tgz \
&& sudo tar zxvf /tmp/kafkatool.tgz \
&& sudo rm /tmp/kafkatool.tgz \
&& sudo chgrp -R users /opt/apps/kafkatool2 && sudo chmod -R a+g /opt/apps/kafkatool2 \
&& sudo ln -s /opt/apps/kafkatool2/kafkatool /usr/local/bin/kafkatool
# && cp /opt/apps/kafkatool2/.install4j/install4j_x8ox99-kafkatool.desktop /usr/share/applications/kafkatool.desktop

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
