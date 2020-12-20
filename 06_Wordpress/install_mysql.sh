#!/bin/bash

sudo apt update
sudo apt -y install mysql-server

# Crear BD, usuario y conceder permisos:
mysql -u root -e "create database wordpress"
mysql -u root -e "create user wordpress@'%' identified by 'wordpress'"
mysql -u root -e "grant all on wordpress.* to wordpress@'%' ; flush privileges"

# Permitir que MySQL escuche en todos los interfaces y no sólo en 127.0.0.1
sed -i 's/^bind-address.*/bind-address = 0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql
