FROM hossein20s/docker-workstation:dev
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:personal .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

COPY nomachine/nxserver.sh /
RUN chown developer:users /nxserver.sh && chmod 755 /nxserver.sh

ENTRYPOINT ["/nxserver.sh"]

USER $UID
WORKDIR /home/${USER}
