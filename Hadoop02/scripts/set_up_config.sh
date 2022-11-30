#!/bin/bash

sed -i '/127.0.1.1.*/d' /etc/hosts
sed -i '/127.0.2.1.*/d' /etc/hosts

> /opt/hadoop/etc/hadoop/workers

for ((i=0;  i<$NODES; i++)); do
echo "${BASE_IP}$((${i}+20))        hadoop${i}" >> /etc/hosts
done

for ((i=1;  i<$NODES; i++)); do
echo "hadoop${i}" >> /opt/hadoop/etc/hadoop/workers
done
