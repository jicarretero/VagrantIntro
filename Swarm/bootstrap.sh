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

cat << EOT > /etc/hosts
127.0.0.1       localhost

192.168.50.10   manager
192.168.50.11	docker1
192.168.50.12	docker2

EOT

if [ -e /dev/sdc ]; then
  mkfs -t xfs /dev/sdc 
  mkdir /storage 
  echo "/dev/sdc /storage xfs defaults 1 2" >> /etc/fstab 
  mount /dev/sdc /storage

fi

if [ `hostname` == "docker2" ]; then
  gluster peer probe docker1 
  gluster peer probe manager
fi

if [ `hostname` == "manager" ]; then
  [ -f /vagrant/join_swarm.sh ] && rm /vagrant/join_swarm.sh
  
  docker swarm init --advertise-addr 192.168.50.10
  token=$(docker swarm join-token manager -q)

  echo "docker swarm join --token ${token} 192.168.50.10:2377" > /vagrant/join_swarm.sh
else
  source "/vagrant/join_swarm.sh"
fi
