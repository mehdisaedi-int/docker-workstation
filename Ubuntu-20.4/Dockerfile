FROM hossein20s/docker-workstation:base
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:x11 .
ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0

ARG TIMEZONE="America/Los_Angeles"
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN echo ${TIMEZONE} > /etc/timezone

ARG USER=developer
ARG UID=1000
ARG GID=1000

COPY ${USER} /home/${USER}
RUN chown -R ${USER}:users /home/${USER}

# Setup default user, when enter docker container
USER ${UID}:${GID}
WORKDIR /home/${USER}

# ENTRYPOINT ["/bin/sh", "-c", "$0 \"$@\"", "xterm"]
ENTRYPOINT ["/bin/sh", "-c", "tail -f /dev/null"]
