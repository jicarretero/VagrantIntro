#!/bin/bash

rm -f /vagrant/id_rsa* || true
ssh-keygen -f /vagrant/id_rsa -P ''
chmod 644 /vagrant/id_rsa
