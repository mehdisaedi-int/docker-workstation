FROM hossein20s/docker-workstation:conda
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:conda-pycharm .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV PATH /opt/conda/bin:$PATH


ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
