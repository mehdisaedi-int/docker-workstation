FROM hossein20s/docker-workstation:conda-pycharm
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:dev .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

#RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb \
#&& sudo apt install -y ./mysql-apt-config_0.8.15-1_all.deb \
#&& sudo rm ./mysql-apt-config_0.8.15-1_all.deb \ # it hangs may be the fix is
# RUN echo mysql-apt-config mysql-apt-config/select-server select mysql-5.7 | debconf-set-selections
#&& sudo apt update && sudo apt install -y mysql-workbench

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - \
&& sudo apt install -y nodejs && sudo apt install -y build-essential

RUN wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz \
&& sudo tar -xzf postman.tar.gz -C /opt/apps \
&& rm postman.tar.gz \
&& sudo ln -s /opt/apps/Postman/Postman /usr/bin/postman \
&& npm install -g newman newman-reporter-html

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
&& sudo apt install -y apt-transport-https ca-certificates gnupg \
&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
&& sudo apt update && sudo apt install -y google-cloud-sdk \
&& sudo apt install -y google-cloud-sdk-app-engine-java

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
&& sudo chmod +x ./kubectl \
&& sudo mv ./kubectl /usr/local/bin/kubectl

RUN sudo wget https://golang.org/dl/go1.15.1.linux-amd64.tar.gz \
&& sudo tar -C /opt/apps -xzf go1.15.1.linux-amd64.tar.gz \
&& sudo rm go1.15.1.linux-amd64.tar.gz

ENV PATH /opt/conda/bin:/opt/apps/go/bin:$PATH


ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
