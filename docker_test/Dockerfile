FROM ubuntu:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install wget curl 

RUN useradd -ms /bin/bash vodorok
USER vodorok:vodorok
WORKDIR /home/vodorok

CMD bash
