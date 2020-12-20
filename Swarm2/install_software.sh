#!/bin/bash

## 
## Install Docker
##
add-apt-repository -y ppa:gluster/glusterfs-7
apt-get -y update 

DEBIAN_FRONTEND='noninteractive' apt-get dist-upgrade  -o Dpkg::Options::="--force-confdef" -o Dpkg::Options="--force-confold" -y

 apt-get install -y \
   apt-transport-https \
   ca-certificates \
   software-properties-common \
   curl \
   lsof \
   vim \
   docker \
   docker.io \
   glusterfs-client \
   glusterfs-server

apt -y clean
apt -y autoremove

systemctl enable docker
systemctl start docker

## 
## Install Docker-compose
##
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Format and mount drive
if [ -e /dev/sdc ]; then
  mkfs -t xfs /dev/sdc 
  mkdir /storage 
  echo "/dev/sdc /storage xfs defaults 1 2" >> /etc/fstab 
  mount /dev/sdc /storage || true
fi
