FROM ubuntu:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install sudo wget curl locales unzip
RUN sh -c "$(curl -fsLS chezmoi.io/get)"


RUN useradd -ms /bin/bash vodorok
RUN echo "vodorok:123" | chpasswd
RUN usermod -aG sudo vodorok

USER vodorok:vodorok
WORKDIR /home/vodorok

RUN mkdir -p /home/vodorok/.local/share

CMD bash
