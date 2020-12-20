#!/bin/bash

echo $PWD > /tmp/bootstrap.logs
apt-get -y update
sudo apt -y dist-upgrade
apt-get -y install python3-pip r-base

pip3 install jupyter notebook voila
pip3 install numpy
pip3 install matplotlib
pip3 install pandas

mkdir ~vagrant/.jupyter
cp /vagrant/jupyter_notebook_config.json ~vagrant/.jupyter
chown -R vagrant.vagrant ~vagrant/.jupyter

cp /vagrant/jupyter.service  /etc/systemd/system/
systemctl enable jupyter
systemctl start jupyter

# Configurar R para usarse con Jupyter.
R --no-save << EOT
install.packages('IRkernel')
IRkernel::installspec(user = FALSE) 
install.packages(c('ggplot2','plyr','dplyr','reshape2','Rmisc','fBasics','MASS'))
EOT
