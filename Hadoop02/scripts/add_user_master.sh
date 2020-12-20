## 
## Add user Hadoop and directories
# useradd -m -d /home/hadoop -s /bin/bash vagrant

# su -c "mkdir -p ~/.ssh || true" vagrant
su -c "cat /vagrant/id_rsa.pub >>  ~/.ssh/authorized_keys" vagrant
su -c "cp /vagrant/id_rsa ~/.ssh/id_rsa" vagrant
su -c "chmod 400 ~/.ssh/id_rsa" vagrant

rm /vagrant/id_rsa*
