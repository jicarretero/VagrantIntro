#!/bin/bash

# Instalar el software necesario para Wordprees
sudo apt update
sudo apt -y install apache2 libapache2-mod-php php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip wget wordpress

# Descargar la última version de Wordpress, descomprimirlo y cambiar el usuario a la zona web
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar zxvf /tmp/latest.tar.gz -C /var/www/html
chown -R www-data.www-data /var/www/html/wordpress/

# Copiar el fichero de configuración
cp /vagrant/000-default.conf /etc/apache2/sites-available/000-default.conf

# Reiniciar Wordpress
systemctl restart apache2
