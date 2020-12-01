FROM hossein20s/docker-workstation:nomachine
#MAINTAINER mehdi.saedi.int@gmail.com

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 4440 4000
ENV DISPLAY :0

#remove all JDK and OPENJDK First
RUN sudo update-alternatives --remove-all "java"
RUN sudo update-alternatives --remove-all "javac"
#RUN sudo update-alternatives --remove-all "javaws"
# RUN sudo apt-get remove openjdk
# RUN sudo apt-get remove --auto-remove openjdk
# RUN sudo apt-get purge openjdk*
# RUN sudo apt-get purge --auto-remove openjdk* 
# RUN sudo rm -r /usr/lib/jvm/java-11-oracle
RUN sudo dpkg --list | grep -i jdk
RUN sudo rm -Rf /usr/lib/jvm/

# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget mc nano software-properties-common apt-transport-https

# Set up new user
# RUN useradd -ms /bin/bash developer
# USER developer
WORKDIR /home/developer

# Prepare Android directories and system variables
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg

# Set up Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools"

#install VsCode
#RUN sudo snap install --classic code
#VSCODE Installation
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
RUN sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt update && apt install code
#install webstorm 
# RUN apt install ubuntu-make
# RUN umake ide webstorm
# RUN chmod +x ~/.local/share/applications/jetbrains-webstorm.desktop
#istall android studio
#RUN sudo snap install android-studio --classic

# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/developer/flutter/bin"

# Run basic check to download Dark SDK
RUN flutter doctor

