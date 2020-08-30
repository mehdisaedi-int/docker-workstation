FROM hossein20s/docker-workstation:conda-pycharm
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:unity3D .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV PATH /opt/conda/bin:$PATH
ARG DOWNLOAD_URL=https://beta.unity3d.com/download/dad990bf2728/UnitySetup-2018.2.7f1
ARG SHA1=13c24c5268a1a97e1e212321dc47a8890f0934ca

RUN sudo apt update; \
    sudo apt install -y \
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
    npm \
    xdg-utils \
    lsb-release \
    libpq5 \
    xvfb \
    wget \
    && sudo apt clean \
    && sudo rm -rf /var/lib/apt/lists/*
RUN sudo apt-get update && sudo apt-get install -y git git sudo tzdata && sudo rm -rf /var/lib/apt/lists/*

# add credentials on build
RUN mkdir /home/${USER}/.ssh/
COPY id_rsa /home/${USER}/.ssh/id_rsa
COPY .gitconfig /home/${USER}/.gitconfig

RUN sudo wget -nv ${DOWNLOAD_URL} -O UnitySetup; \
    # compare sha1 if given
    sudo chmod +x UnitySetup; \
    if [ -n "${SHA1}" -a "${SHA1}" != "" ]; then \
      sudo echo "${SHA1}  UnitySetup" | shasum -a 1 --check -; \
    else \
      sudo echo "no sha1 given, skipping checksum"; \
    fi
# make sure your domain is accepted
RUN touch /home/${USER}/.ssh/known_hosts
RUN ssh-keyscan github.com >> /home/${USER}/.ssh/known_hosts

# install unity
RUN yes | sudo ./UnitySetup --verbose --unattended \
        --components=Unity \
        -l /opt/Unity && \
    yes | sudo ./UnitySetup --verbose --unattended \
        --components=Android \
        -l /opt/Unity && \
    yes | sudo ./UnitySetup --verbose --unattended \
        --components=iOS \
        -l /opt/Unity && \
    yes | sudo ./UnitySetup --verbose --unattended \
        --components=Mac-Mono \
        -l /opt/Unity && \
    yes | sudo ./UnitySetup --verbose --unattended \
        --components=WebGL \
        -l /opt/Unity && \
    yes | sudo ./UnitySetup --verbose --unattended \
        --components=Windows-Mono \
        -l /opt/Unity && \
    yes | sudo ./UnitySetup --verbose --unattended \
        --components=Facebook-Games \
        -l /opt/Unity && \
    # remove setup
    sudo rm UnitySetup && \
    sudo rm -rf /tmp/* /var/tmp/* && \
    # make a directory for the certificate Unity needs to run
    sudo mkdir -p $HOME/.local/share/unity3d/Certificates/

RUN cd /home/${USER} && \
     git clone --depth=1 https://github.com/EpicGames/UnrealEngine.git && \
	cd UnrealEngine && \
	./Setup.sh && \
	./GenerateProjectFiles.sh && \
	make

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
