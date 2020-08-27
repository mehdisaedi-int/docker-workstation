FROM hossein20s/docker-workstation:nomachine
MAINTAINER HosseinAkhlaghpour@gmail.com

# docker build -t hossein20s/docker-workstation:genome-desktop .
# use developer as the main user to install-> use sudo for any RUN command

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000
ENV DISPLAY :0

# localozation
ARG TIMEZONE="America/Los_Angeles"
RUN echo ${TIMEZONE} > /etc/timezone

RUN sudo apt update && sudo apt install -y ubuntu-unity-desktop
# from https://www.nomachine.com/AR04K00667
RUN sudo sed -i '/DefaultDesktopCommand/c\DefaultDesktopCommand "/etc/X11/Xsession \'gnome-session -session=ubuntu\' "' $NX_NODE_CFG
# sudo apt -y install gnome-session gnome-terminal
# RUN sudo apt install -y tasksel && sudo tasksel install ubuntu-desktop-minimal

ENTRYPOINT ["/nxserver.sh"]
