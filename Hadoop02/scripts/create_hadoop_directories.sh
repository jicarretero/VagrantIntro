#!/bin/bash

mkdir -p /data/nameNode || true ; chown -R vagrant.vagrant /data/nameNode
mkdir -p /data/dataNode || true ; chown -R vagrant.vagrant /data/dataNode
mkdir -p /opt/hadoop/logs || true ; chown -R vagrant.vagrant /opt/hadoop/logs

cp /vagrant/config/*.xml /opt/hadoop/etc/hadoop/

