FROM hossein20s/docker-workstation:dev-tk-opencv
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:dev-tk-opencv .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

RUN sudo apt update && sudo apt install -y hardinfo hwinfo lshw mesa-utils grub-efi-amd64-bin nvidia-cuda-toolkit


ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
