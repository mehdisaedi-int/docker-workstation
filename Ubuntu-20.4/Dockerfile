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

#Install R
RUN sudo apt-get install -y r-base

#Install R-studio - https://www.rstudio.com/products/rstudio/download-server/
RUN sudo apt-get install -y gdebi-core
RUN sudo wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1073-amd64.deb -o /tmp/rstudio-server.deb
# RUN sudo gdebi rstudio-server.deb
# RUN sudo rm rstudio-server.deb

ENTRYPOINT ["/nxserver.sh"]

USER $UID
WORKDIR /home/${USER}
