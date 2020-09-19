FROM hossein20s/docker-workstation:unity3D-libs
MAINTAINER HosseinAkhlaghpour@gmail.com
# TODO: You need to copy CACerts.pem to here before runing this

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


RUN sudo wget -nv ${DOWNLOAD_URL} -O UnitySetup; \
    # compare sha1 if given
    sudo chmod +x UnitySetup; \
    if [ -n "${SHA1}" -a "${SHA1}" != "" ]; then \
      sudo echo "${SHA1}  UnitySetup" | shasum -a 1 --check -; \
    else \
      sudo echo "no sha1 given, skipping checksum"; \
    fi
# make sure your domain is accepted
# RUN touch /home/${USER}/.ssh/known_hosts
# RUN ssh-keyscan github.com >> /home/${USER}/.ssh/known_hosts

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
