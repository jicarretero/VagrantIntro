#!/bin/bash

# Actualizamos el sistema y añadimos python y R. Vamos a configurar Jupyter para funcionar con 2 Kernel.
apt-get -y update
sudo apt -y dist-upgrade
apt-get -y install python3-pip r-base

# Instalamos las librerias que probablemente requiera Jupyter notebook para python:
# Numpy, maptplotlib y pandas (además de jupyter, claro)
pip3 install jupyter notebook voila
pip3 install numpy
pip3 install matplotlib
pip3 install pandas

# Configruamos Jupyter para poder acceder sin contraseña
mkdir ~vagrant/.jupyter
cp /vagrant/jupyter_notebook_config.json ~vagrant/.jupyter
chown -R vagrant.vagrant ~vagrant/.jupyter

# Creamos un servicio para que se inicie jupyter notebook siempre con la maquina virtual
cp /vagrant/jupyter.service  /etc/systemd/system/
systemctl enable jupyter
systemctl start jupyter

# Configurar R para usarse con Jupyter. Ponemos ademas algunas librerias que suelen ser interesantes para R y que
# probablemente todo el mundo pueda necesitar en algun momento.
R --no-save << EOT
install.packages('IRkernel')
IRkernel::installspec(user = FALSE) 
install.packages(c('ggplot2','plyr','dplyr','reshape2','Rmisc','fBasics','MASS'))
EOT
