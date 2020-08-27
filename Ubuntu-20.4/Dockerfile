FROM hossein20s/docker-workstation:conda-R
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:bioconductor .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000

ENV PATH /opt/conda/bin:$PATH

ARG BIOCONDUCTOR_DOCKER_VERSION=3.12.17

LABEL name="bioconductor/bioconductor_docker" \
      version=$BIOCONDUCTOR_DOCKER_VERSION \
      url="https://github.com/Bioconductor/bioconductor_docker" \
      vendor="Bioconductor Project" \
      maintainer="maintainer@bioconductor.org" \
      description="Bioconductor docker image with system dependencies to install most packages." \
      license="Artistic-2.0"

# nuke cache dirs before installing pkgs; tip from Dirk E fixes broken img
RUN sudo rm -f /var/lib/dpkg/available && sudo rm -rf  /var/cache/apt/*

# issues with '/var/lib/dpkg/available' not found
# this will recreate
RUN sudo dpkg --clear-avail

# This is to avoid the error
# 'debconf: unable to initialize frontend: Dialog'
ENV DEBIAN_FRONTEND noninteractive

# Update apt
RUN sudo apt update \
	&& sudo apt install -y --no-install-recommends apt-utils \
	&& sudo apt install -y --no-install-recommends \
	## Basic deps
	gdb \
	libxml2-dev \
	python3-pip \
	libz-dev \
	liblzma-dev \
	libbz2-dev \
	libpng-dev \
	## sys deps from bioc_full
	pkg-config \
	fortran77-compiler \
	byacc \
	automake \
	curl \
	## This section installs libraries
	libpcre2-dev \
	libnetcdf-dev \
	libhdf5-serial-dev \
	libfftw3-dev \
	libopenbabel-dev \
	libopenmpi-dev \
	libxt-dev \
	libudunits2-dev \
	libgeos-dev \
	libproj-dev \
	libcairo2-dev \
	libtiff5-dev \
	libreadline-dev \
	libgsl0-dev \
	libgslcblas0 \
	libgtk2.0-dev \
	libgl1-mesa-dev \
	libglu1-mesa-dev \
	libgmp3-dev \
	libhdf5-dev \
	libncurses-dev \
	libbz2-dev \
	libxpm-dev \
	liblapack-dev \
	libv8-dev \
	libgtkmm-2.4-dev \
	libmpfr-dev \
	libmodule-build-perl \
	libapparmor-dev \
	libprotoc-dev \
	librdf0-dev \
	libmagick++-dev \
	libsasl2-dev \
	libpoppler-cpp-dev \
	libprotobuf-dev \
	libpq-dev \
	libperl-dev \
	## software - perl extentions and modules
	libarchive-extract-perl \
	libfile-copy-recursive-perl \
	libcgi-pm-perl \
	libdbi-perl \
	libdbd-mysql-perl \
	libxml-simple-perl \
	libmysqlclient-dev \
	default-libmysqlclient-dev \
	libgdal-dev \
	## new libs
	libglpk-dev \
	## Databases and other software
	sqlite \
	openmpi-bin \
	mpi-default-bin \
	openmpi-common \
	openmpi-doc \
	tcl8.6-dev \
	tk-dev \
	default-jdk \
	imagemagick \
	tabix \
	ggobi \
	graphviz \
	protobuf-compiler \
	jags \
	## Additional resources
	xfonts-100dpi \
	xfonts-75dpi \
	biber \
	&& sudo apt clean \
	&& sudo rm -rf /var/lib/apt/lists/*

## Python installations
RUN sudo apt update \
	&& sudo apt install -y software-properties-common \
	&& sudo add-apt-repository universe \
	&& sudo apt update \
	&& sudo apt -y --no-install-recommends install python2 python-dev \
	&& sudo curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py \
	&& sudo python2 get-pip.py \
	&& sudo pip2 install wheel \
	## Install sklearn and pandas on python
	&& sudo pip2 install sklearn \
	pandas \
	pyyaml \
	cwltool \
	&& sudo apt clean \
	&& sudo rm -rf /var/lib/apt/lists/* \
	&& sudo rm -rf get-pip.py

## FIXME
## These two libraries don't install in the above section--WHY?
RUN sudo apt update \
	&& sudo apt -y --no-install-recommends install \
	libmariadb-dev-compat \
	libjpeg-dev \
	libjpeg-turbo8-dev \
	libjpeg8-dev \
	&& sudo apt clean \
	&& sudo rm -rf /var/lib/apt/lists/*

# # Install libsbml and xvfb
RUN sudo cd /tmp \
	## libsbml
	&& sudo curl -O https://s3.amazonaws.com/linux-provisioning/libSBML-5.10.2-core-src.tar.gz \
	&& sudo tar zxf libSBML-5.10.2-core-src.tar.gz \
	&& sudo cd libsbml-5.10.2 \
	&& sudo ./configure --enable-layout \
	&& sudo make \
	&& sudo make install \
	## Clean libsbml, and tar.gz files
	&& sudo rm -rf /tmp/libsbml-5.10.2 \
	&& sudo rm -rf /tmp/libSBML-5.10.2-core-src.tar.gz \
	## apt clean and remove cache
	&& sudo apt clean \
	&& sudo rm -rf /var/lib/apt/lists/*

RUN sudo echo "R_LIBS=/usr/local/lib/R/host-site-library:\${R_LIBS}" > /usr/local/lib/R/etc/Renviron.site \
	&& sudo echo "options(defaultPackages=c(getOption('defaultPackages'),'BiocManager'))" >> /usr/local/lib/R/etc/Rprofile.site

ADD install.R /tmp/

RUN R -f /tmp/install.R

# DEVEL: Add sys env variables to DEVEL image
RUN sudo curl -O http://bioconductor.org/checkResults/devel/bioc-LATEST/Renviron.bioc \
	&& sudo cat Renviron.bioc | grep -o '^[^#]*' | sed 's/export //g' >>/etc/environment \
	&& sudo cat Renviron.bioc >> /usr/local/lib/R/etc/Renviron.site \
	&& sudo echo BIOCONDUCTOR_DOCKER_VERSION=${BIOCONDUCTOR_DOCKER_VERSION} >> /usr/local/lib/R/etc/Renviron.site \
	&& sudo rm -rf Renviron.bioc

ENV BIOCONDUCTOR_DOCKER_VERSION=$BIOCONDUCTOR_DOCKER_VERSION

ENTRYPOINT ["/nxserver.sh"]

USER $UID
WORKDIR /home/${USER}
