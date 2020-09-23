FROM conda/miniconda2
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:notebook-ml .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 80 8888
ENV DISPLAY :0
ARG USER=developer
ARG UID=1000
ARG GID=1000
# default password for user
ARG PW=developer

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 8888

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

ARG TIMEZONE="America/Los_Angeles"
RUN echo ${TIMEZONE} > /etc/timezone

RUN apt update -y && apt install sudo jupyter-notebook jupyter-core python-ipykernel -y

RUN apt install -y software-properties-common procps build-essential libssl-dev libffi-dev \
    nginx nano htop vim curl wget git dnsutils iputils-ping

RUN conda update -n base -c defaults conda && ln -sf /usr/local /opt/conda && \
 sudo chown -R root:users /opt/conda/envs && sudo chmod -R g+w /opt/conda/envs

#RUN conda env update --name ml --file env_ml.yml
COPY env_ml.yml .

#RUN conda env update --name ml --file env_ml.yml
RUN conda env create --file env_ml.yml
RUN chgrp -R users /opt/conda/envs && chmod -R g+w /opt/conda/envs

# Option1: Using unencrypted password/ specifying password
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd \
&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
&& adduser ${USER} users && adduser ${USER} sudo

RUN cp /bin/bash /bin/sh
RUN source ~/.bashrc

COPY start-notebook.sh /start-notebook.sh

# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD ["/bin/sh", "/start-notebook.sh"]
# Run your program under Tini
USER ${USER}
# CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
