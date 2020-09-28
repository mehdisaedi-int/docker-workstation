FROM hossein20s/docker-workstation:dev-nodejs
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:dev .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

# installing Ruby Gemfry Redis
RUN sudo apt install -y rsync rubygems && sudo gem install gemfury
RUN sudo apt install -y ansible redis
RUN sudo apt update && sudo apt install -y hardinfo hwinfo lshw

# installing go-lang
RUN sudo wget https://golang.org/dl/go1.15.1.linux-amd64.tar.gz \
&& sudo tar -C /opt/apps -xzf go1.15.1.linux-amd64.tar.gz \
&& sudo rm go1.15.1.linux-amd64.tar.gz

# installing google-cloud-sdk
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
&& sudo apt install -y ca-certificates gnupg \
&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
&& sudo apt update -y && sudo apt install google-cloud-sdk -y \
&& sudo apt install google-cloud-sdk-app-engine-java -y

# installing kubernetes kubectl
# https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl
RUN sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 \
&& curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
&& echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list \
&& sudo apt update \
&& sudo apt install -y kubectl \
&& rm -rf /var/lib/apt/lists/*

#RUN sudo apt --only-upgrade install google-cloud-sdk-datastore-emulator google-cloud-sdk-cloud-build-local google-cloud-sdk-pubsub-emulator google-cloud-sdk-kpt kubectl \
#google-cloud-sdk-skaffold google-cloud-sdk-firestore-emulator google-cloud-sdk-bigtable-emulator google-cloud-sdk-app-engine-python-extras google-cloud-sdk-kind \
#google-cloud-sdk-datalab google-cloud-sdk-spanner-emulator google-cloud-sdk-app-engine-grpc google-cloud-sdk-app-engine-go google-cloud-sdk-cbt \
#google-cloud-sdk-minikube google-cloud-sdk google-cloud-sdk-app-engine-python google-cloud-sdk-anthos-auth google-cloud-sdk-app-engine-java

# install Kafka tools from the installed archive
RUN sudo mkdir -p /opt/apps && cd /opt/apps \
&& curl -fSL "https://www.dropbox.com/s/7g7o7wco148ausk/kafkatool2-opt-apps-installed.tgz?dl=0" -o /tmp/kafkatool.tgz \
&& sudo tar zxvf /tmp/kafkatool.tgz \
&& sudo rm /tmp/kafkatool.tgz \
&& sudo chgrp -R users /opt/apps/kafkatool2 && sudo chmod -R a+g /opt/apps/kafkatool2 \
&& sudo ln -s /opt/apps/kafkatool2/kafkatool /usr/local/bin/kafkatool

COPY icons/kafkatool.desktop /usr/share/applications/

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
