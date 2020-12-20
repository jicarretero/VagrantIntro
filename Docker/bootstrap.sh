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

systemctl enable docker
systemctl start docker

