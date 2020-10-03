FROM hossein20s/docker-workstation:unity3D-libs
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:Unity3D-x11 .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000 10000-50000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

# from https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-20-04-focal-fossa-linux
RUN sudo add-apt-repository ppa:graphics-drivers/ppa
RUN ubuntu-drivers devices
RUN sudo ubuntu-drivers autoinstall

ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}

# https://github.com/PoisonousJohn/TanksNetworkingInAzure
#RUN useradd -ms /bin/bash unity
#WORKDIR /home/unity
#COPY builds/linuxserver.x86_64 /home/unity/
#COPY builds/linuxserver_Data /home/unity/linuxserver_Data/
#RUN chown -R unity:unity /home/unity/linuxserver*
#USER unity
#
#EXPOSE 7777-7787
#ENV SERVERS_REGISTRY_URL http://jpgjsr.azurewebsites.net/api/servers
#ENV HEARTBEAT_PERIOD 3

#CMD ["./linuxserver.x86_64", "-logFile", "/dev/stdout", "-batchmode", "-nographics"]