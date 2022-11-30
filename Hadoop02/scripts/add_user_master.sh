## 
## Add user Hadoop and directories
# useradd -m -d /home/hadoop -s /bin/bash vagrant

# su -c "mkdir -p ~/.ssh || true" vagrant
su -c "cat /vagrant/id_rsa.pub >>  ~vagrant/.ssh/authorized_keys" vagrant
su -c "cp /vagrant/id_rsa ~vagrant/.ssh/id_rsa" vagrant
su -c "chmod 400 ~vagrant/.ssh/id_rsa" vagrant

chown -R vagrant:vagrant ~vagrant/.ssh

rm /vagrant/id_rsa*
