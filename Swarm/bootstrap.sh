#!/bin/bash

# Añadir el ppa de GlusterFS a Ubuntu
# add-apt-repository -y ppa:gluster/glusterfs-7
# apt-get -y update 

## 
## Install Docker y Swarm
##
DEBIAN_FRONTEND='noninteractive' apt-get dist-upgrade  -o Dpkg::Options::="--force-confdef" -o Dpkg::Options="--force-confold" -y

apt-get --quiet install -y \
   apt-transport-https \
   ca-certificates \
   software-properties-common \
   curl \
   lsof \
   vim \
   jq \
   git \
   wget \
   glusterfs-server

apt -y clean
apt -y autoremove

systemctl enable --now glusterd

## 
## Instalar Docker
##
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

## 
# Los nodos deben conocerse unos a otros por su nombre. Por eso, en cada uno de ellos añadimos las lineas necesarias en
# /etc/hosts -- Asi todos los nodos pueden localizar a los demás.
cat << EOT > /etc/hosts
127.0.0.1       localhost

192.168.56.10   manager
192.168.56.11	docker1
192.168.56.12	docker2

EOT

# Formatear el disco duro que se pone a cada uno de los nodos con XFS y meter la entrada correspondiente en /etc/fstab.
if [ -e /dev/sdc ]; then
  mkfs -t xfs /dev/sdc 
  mkdir /storage 
  echo "/dev/sdc /storage xfs defaults 1 2" >> /etc/fstab 
  mount /dev/sdc /storage

fi

# Para el último Host que se cree, debe conectar el Cluster de Gluster, con los nodos anteriores. Ya conocemos cuales
# Son los nodos anteriores.
if [ `hostname` == "docker2" ]; then
  gluster peer probe docker1 
  gluster peer probe manager
fi

# Para el nodo manager (el primer nodo del cluster Swarm), generamos un fichero extra que se debe ejecutar en el
# resto de los nodos de forma que estos puedan unirse al cluster Swarm. Se deja en /vagrant ya que es accesible por
# todas las maquinas virtuales que creemos y asi el resto de nodos pueden localizarlo y ejecutarlo.
if [ `hostname` == "manager" ]; then
  [ -f /vagrant/join_swarm.sh ] && rm /vagrant/join_swarm.sh
  
  docker swarm init --advertise-addr 192.168.56.10
  token=$(docker swarm join-token manager -q)

  echo "docker swarm join --token ${token} 192.168.56.10:2377" > /vagrant/join_swarm.sh
else
  # Esto lo ejecutan aquellos nodos que no son manager.
  source "/vagrant/join_swarm.sh"
fi
