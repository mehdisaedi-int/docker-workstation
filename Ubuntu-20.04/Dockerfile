FROM hossein20s/docker-workstation:dev
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:R .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV PATH /opt/conda/bin:$PATH


ARG R_VERSION=4.0.2
ARG OS_IDENTIFIER=ubuntu-2004

RUN sudo apt update && \
    sudo apt install -y \
    apt-transport-https \
    curl \
    fontconfig \
    libcurl4-openssl-dev \
    locales \
    perl \
    sudo \
    tzdata \
    wget && \
    sudo rm -rf /var/lib/apt/lists/*

# Install TinyTeX
RUN sudo wget -qO- "https://yihui.name/gh/tinytex/tools/install-unx.sh" | sh -s - --admin --no-path && \
    sudo mv ~/.TinyTeX /opt/TinyTeX && \
    sudo /opt/TinyTeX/bin/*/tlmgr path add

## Install pandoc
RUN sudo mkdir -p /opt/pandoc && \
    sudo wget -O /opt/pandoc/pandoc.gz https://files.r-hub.io/pandoc/linux-64/pandoc.gz && \
    sudo gzip -d /opt/pandoc/pandoc.gz && \
    sudo chmod +x /opt/pandoc/pandoc && \
    sudo ln -s /opt/pandoc/pandoc /usr/bin/pandoc

RUN sudo wget -O /opt/pandoc/pandoc-citeproc.gz https://files.r-hub.io/pandoc/linux-64/pandoc-citeproc.gz && \
    sudo gzip -d /opt/pandoc/pandoc-citeproc.gz && \
    sudo chmod +x /opt/pandoc/pandoc-citeproc && \
    sudo ln -s /opt/pandoc/pandoc-citeproc /usr/bin/pandoc-citeproc


# Install R
RUN sudo wget https://cdn.rstudio.com/r/${OS_IDENTIFIER}/pkgs/r-${R_VERSION}_1_amd64.deb && \
    sudo apt update -qq && \
    sudo apt install -f -y ./r-${R_VERSION}_1_amd64.deb && \
    sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/bin/R && \
    sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/bin/Rscript && \
    sudo ln -s /opt/R/${R_VERSION}/lib/R /usr/lib/R && \
    sudo rm r-${R_VERSION}_1_amd64.deb && \
    sudo rm -rf /var/lib/apt/lists/*



ENTRYPOINT ["/nxserver.sh"]

# USER $UID
# WORKDIR /home/${USER}
