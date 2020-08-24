FROM hossein20s/docker-workstation:ubuntu-20.04-anaconda
MAINTAINER HosseinAkhlaghpour@gmail.com

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update && apt-get install -y mysql-client && rm -rf /var/lib/apt
# RUN sudo apt install -y build-essential python-dev libmysqlclient-dev libmysqlcppconn-dev
RUN sudo apt-get update -y && sudo apt install -y pkg-config && sudo apt install -y libfreetype6-dev


COPY ag38.yml /ag38.yml
RUN conda env create -f /ag38.yml
ENV PATH /opt/conda/envs/ag38/bin:$PATH

COPY developer /home/developer
RUN sudo chown -R developer:users /home/developer

# COPY nomachine/nxserver.sh /
ENTRYPOINT ["/nxserver.sh"]