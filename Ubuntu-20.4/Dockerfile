FROM hossein20s/docker-workstation:ubuntu-20.04-nomachine
MAINTAINER HosseinAkhlaghpour@gmail.com

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0

ENV PATH /opt/conda/bin:$PATH

RUN sudo apt-get update --fix-missing && sudo apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion

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
RUN chmod +x /tini && \
    sudo apt-get clean

ENTRYPOINT ["/nxserver.sh"]
