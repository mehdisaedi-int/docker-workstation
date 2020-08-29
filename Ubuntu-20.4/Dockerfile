FROM hossein20s/docker-workstation:conda-pycharm
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:unreal .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV PATH /opt/conda/bin:$PATH
ARG DOWNLOAD_URL=https://beta.unity3d.com/download/dad990bf2728/UnitySetup-2018.2.7f1
ARG SHA1=13c24c5268a1a97e1e212321dc47a8890f0934ca

RUN sudo apt-get update && sudo apt-get install -y git git sudo tzdata && sudo rm -rf /var/lib/apt/lists/*

# add credentials on build
RUN mkdir /home/${USER}/.ssh/
COPY id_rsa /home/${USER}/.ssh/id_rsa
COPY .gitconfig /home/${USER}/.gitconfig

# make sure your domain is accepted
RUN touch /home/${USER}/.ssh/known_hosts
RUN ssh-keyscan github.com >> /home/${USER}/.ssh/known_hosts


RUN cd /home/${USER} && \
     git clone --depth=1 https://github.com/EpicGames/UnrealEngine.git && \
	cd UnrealEngine && \
	./Setup.sh && \
	./GenerateProjectFiles.sh && \
	make

# I use this to create CACerts.pem
# openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out CACerts.pem

ENTRYPOINT ["/nxserver.sh"]

USER $UID
WORKDIR /home/${USER}
