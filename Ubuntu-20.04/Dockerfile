FROM hossein20s/docker-workstation:dev-go-ruby
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:dev-kubectl .
# use developer as the main user to install-> use sudo for any RUN command
# remember to run
# gcloud auth login && gcloud auth configure-docker


ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
&& sudo apt install -y apt-transport-https ca-certificates gnupg \
&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
&& sudo apt update -y && sudo apt install google-cloud-sdk -y \
&& sudo apt install google-cloud-sdk-app-engine-java -y \

# https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
&& sudo chmod +x ./kubectl \
&& sudo mv ./kubectl /usr/local/bin/kubectl

#RUN sudo apt --only-upgrade install google-cloud-sdk-datastore-emulator google-cloud-sdk-cloud-build-local google-cloud-sdk-pubsub-emulator google-cloud-sdk-kpt kubectl \
#google-cloud-sdk-skaffold google-cloud-sdk-firestore-emulator google-cloud-sdk-bigtable-emulator google-cloud-sdk-app-engine-python-extras google-cloud-sdk-kind \
#google-cloud-sdk-datalab google-cloud-sdk-spanner-emulator google-cloud-sdk-app-engine-grpc google-cloud-sdk-app-engine-go google-cloud-sdk-cbt \
#google-cloud-sdk-minikube google-cloud-sdk google-cloud-sdk-app-engine-python google-cloud-sdk-anthos-auth google-cloud-sdk-app-engine-java

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
