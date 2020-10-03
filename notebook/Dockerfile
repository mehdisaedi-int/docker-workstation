FROM hossein20s/docker-workstation:conda-pycharm
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:notebook .
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

RUN adduser developer staff
RUN sudo apt update -y && sudo apt install jupyter-notebook jupyter-core  -y


#RUN conda env update --name ml --file env_python3.6.yml
COPY env_python3.8.yml .
RUN conda env create --file env_python3.8.yml

RUN chgrp -R users /opt/conda/envs && chmod -R g+w /opt/conda/envs

USER ${USER}
SHELL ["conda", "run", "-n", "python3.8", "python", "-m", "ipykernel", "install", "--user", "--name=python3.8"]
SHELL ["/bin/sh", "-c"]

RUN sudo rm -rf /var/lib/apt/lists/*


# ENTRYPOINT ["/tini", "--"]
# Run your program under Tini

# COPY start-notebook.sh .
# CMD ["/bin/sh", "/start-notebook.sh"]
USER ${USER}
CMD ["jupyter", "notebook", "--notebook-dir=/opt/dev/workspace", "--ip=0.0.0.0", "--port=8888", "--NotebookApp.token=''", "--no-browser", "--NotebookApp.base_url='/notebook/'"]
