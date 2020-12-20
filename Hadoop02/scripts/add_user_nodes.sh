## 
## Add user Hadoop
# useradd -m -d /home/hadoop -s /bin/bash hadoop || true

# su -c "mkdir -p ~/.ssh || true" vagrant
su -c "cat /vagrant/id_rsa.pub >>  ~/.ssh/authorized_keys" vagrant
