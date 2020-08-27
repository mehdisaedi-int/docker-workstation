FROM hossein20s/docker-workstation:nomachine
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:anaconda .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG UID=1000

# localozation
ARG TIMEZONE="America/Los_Angeles"
RUN echo ${TIMEZONE} > /etc/timezone

ENV PATH /opt/conda/bin:$PATH

RUN sudo apt-get update --fix-missing && sudo apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 git

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh -O ~/anaconda.sh && \
    sudo /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    sudo ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN sudo chown -R root:users /opt/conda && sudo chmod -R g+w /opt/conda
RUN conda install anaconda
RUN conda install netcdf4

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN sudo chmod +x /tini && \
    sudo apt-get clean

ENTRYPOINT ["/nxserver.sh"]

USER $UID