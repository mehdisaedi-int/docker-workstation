FROM hossein20s/docker-workstation:detectron2
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:pytorch3D .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

user root

ARG TIMEZONE="America/Los_Angeles"
RUN echo ${TIMEZONE} > /etc/timezone

# this can be passed to lower layer images (for example base) and removed from here
RUN sudo apt update -y && sudo apt install fuse sshfs rclone -y \
  && mknod -m 666 /dev/fuse c 10 229 \
  && sudo echo 'user_allow_other' | sudo tee -a /etc/fuse.conf 
  
COPY env_ml.yml .

RUN conda env update --name ml --file /env_ml.yml --prune
RUN sudo chgrp -R users /opt/conda/envs/ml && sudo chmod -R g+w /opt/conda/envs/ml

ENTRYPOINT ["/nxserver.sh"]

#USER $UID
#WORKDIR /home/${USER}
