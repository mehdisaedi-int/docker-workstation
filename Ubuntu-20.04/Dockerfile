FROM hossein20s/docker-workstation:conda-pycharm
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:Unity3D-libs .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000 10000-50000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

RUN sudo apt update; \
    sudo apt install -y \
    netcat \
    nmap \
    ffmpeg \
    gconf-service \
    lib32gcc1 \
    lib32stdc++6 \
    libasound2 \
    libc6 \
    libc6-i386 \
    libcairo2 \
    libcap2 \
    libcups2 \
    libarchive13 \
    libasound2 \
    libcups2 \
    libarchive13 \
    libasound2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libfreetype6 \
    libgcc1 \
#    libgconf2-4 \
     libgdk-pixbuf2.0-0 \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libglu1-mesa \
    libgtk2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango1.0-0 \
#    libsoup2.4 \
    libstdc++6 \
    libx11-6 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxtst6 \
    zlib1g \
     debconf \
    xdg-utils \
    lsb-release \
    libpq5 \
    mesa-common-dev \
    libpq5 \
    openssh-server \
    pulseaudio \
    wget \
    xdg-utils \
    xvfb \
    zlib1g \
    tzdata \
    && sudo apt clean \
    && sudo rm -rf /var/lib/apt/lists/*


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