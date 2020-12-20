#!/bin/bash

## 
## Instalacion de Docker
##
apt-get -y update 

DEBIAN_FRONTEND='noninteractive' apt-get dist-upgrade  -o Dpkg::Options::="--force-confdef" -o Dpkg::Options="--force-confold" -y

# Instalacion de algunos paquetes interesantes.
apt-get install -y \
   apt-transport-https \
   ca-certificates \
   software-properties-common \
   curl \
   lsof \
   vim \
   jq \
   docker \
   docker.io

apt -y clean
apt -y autoremove

##
## Install Docker-compose
##
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


# Asegurarse que el servicio arraca y queda activo.
systemctl enable docker
systemctl start docker


