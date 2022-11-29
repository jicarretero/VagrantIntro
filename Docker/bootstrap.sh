#!/bin/bash

## 
## Instalacion de Docker
##
apt-get -y update 

DEBIAN_FRONTEND='noninteractive' apt-get dist-upgrade  -o Dpkg::Options::="--force-confdef" -o Dpkg::Options="--force-confold" -y

# Instalacion de algunos paquetes interesantes.
apt-get --quiet install -y \
   apt-transport-https \
   ca-certificates \
   software-properties-common \
   curl \
   lsof \
   vim \
   jq \
   git \
   wget

apt -y clean
apt -y autoremove

# Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt-cache policy docker-ce
sudo apt-get --quiet install -y docker-ce


sudo systemctl start docker.service
sudo systemctl enable docker.service

usermod -aG docker vagrant

curl -L "https://github.com/docker/compose/releases/download/v2.11.1/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose

mkdir -p ~vagrant/.docker/cli-plugins
ln -s /usr/local/bin/docker-compose ~vagrant/.docker/cli-plugins/docker-compose
chown -R vagrant.vagrant ~vagrant/.docker

mkdir -p ~root/.docker/cli-plugins
ln -s /usr/local/bin/docker-compose ~root/.docker/cli-plugins/docker-compose

chmod +x /usr/local/bin/docker-compose
