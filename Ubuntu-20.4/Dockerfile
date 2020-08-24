FROM hossein20s/docker-workstation:ubuntu-20.04-anaconda
MAINTAINER HosseinAkhlaghpour@gmail.com

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0

RUN sudo apt install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
RUN sudo apt install -y r-base

COPY developer /home/developer
RUN sudo chown -R developer:users /home/developer

# COPY nomachine/nxserver.sh /
ENTRYPOINT ["/nxserver.sh"]