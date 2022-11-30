## 
## Add user Hadoop
# useradd -m -d /home/hadoop -s /bin/bash hadoop || true

# su -c "mkdir -p ~/.ssh || true" vagrant
su -c "cat /vagrant/id_rsa.pub >>  ~vagrant/.ssh/authorized_keys" vagrant
sudo chown -R vagrant.vagrant ~vagrant/.ssh
