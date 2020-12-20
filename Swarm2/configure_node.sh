#!/bin/bash

# TODO --- Set hostnames:
echo "127.0.0.1       localhost" > /etc/hosts
for ((i=1;  i<=$NODES; i++)); do
echo "${BASE_IP}$((${i}+10))        node${i}" >> /etc/hosts
done

# En caso de que sea el ultimo nodo.... sincronizar gluster con los demas nodos
if [ $N -eq $NODES ]; then
  for ((i=1;  i<$NODES; i++)); do
      gluster peer probe node${i}
  done
fi

# En caso de que sea el primer nodo, iniciar Swarm
if [ $N -eq 1 ]; then
  [ -f /vagrant/join_swarm.sh ] && rm /vagrant/join_swarm.sh
  
  docker swarm init --advertise-addr "${BASE_IP}11"
  token=$(docker swarm join-token manager -q)

  echo "docker swarm join --token ${token} node1:2377" > /vagrant/join_swarm.sh
else
  # Si no, unirse al swarm
  source "/vagrant/join_swarm.sh"
fi
