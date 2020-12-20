## 
## Install Needed Software
##

apt -y update

DEBIAN_FRONTEND='noninteractive' apt-get dist-upgrade  -o Dpkg::Options::="--force-confdef" -o Dpkg::Options="--force-confold" -y

apt install -y \
   apt-transport-https \
   ca-certificates \
   software-properties-common \
   curl \
   lsof \
   vim \
   openjdk-8-jdk \
   wget

apt clean -y

[ -f /vagrant/hadoop-3.3.0.tar.gz ] || \
    wget -P /vagrant https://mirrors.sonic.net/apache/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz

tar zxvf /vagrant/hadoop-3.3.0.tar.gz  -C /opt
mv /opt/hadoop-3.3.0 /opt/hadoop

cat << EOT >> /opt/hadoop/etc/vagrant.vagrant-env.sh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export HADOOP_HOME=/opt/hadoop
export HDFS_NAMENODE_USER=vagrant
export HDFS_DATANODE_USER=vagrant
export HDFS_SECONDARYNAMENODE_USER=vagrant
export YARN_RESOURCEMANAGER_USER=vagrant
export YARN_NODEMANAGER_USER=vagrant

export HADOOP_COMMON_HOME=\$HADOOP_HOME
export HADOOP_CONF_DIR=\$HADOOP_HOME/etc/hadoop
export HADOOP_HDFS_HOME=\$HADOOP_HOME
export HADOOP_MAPRED_HOME=\$HADOOP_HOME
export HADOOP_YARN_HOME=\$HADOOP_HOME
EOT

## 
## Add user Hadoop and directories
useradd -m -d /home/hadoop -s /bin/bash hadoop

su -c "ssh-keygen  -t rsa -P ''" vagrant << EOT

EOT

su -c "cat ~/.ssh/id_rsa.pub >>  ~/.ssh/authorized_keys" vagrant
cp ~hadoop/.ssh/id_rsa.pub /vagrant

mkdir -p /data/nameNode || true ; chown -R vagrant.vagrant /data/nameNode
mkdir -p /data/dataNode || true ; chown -R vagrant.vagrant /data/dataNode
mkdir -p /opt/hadoop/logs || true ; chown -R vagrant.vagrant /opt/hadoop/logs

##
## Set up hosts and Environment variables
## 
cat << EOT > /etc/environment
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/hadoop/bin:/opt/hadoop/sbin"
JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"
EOT

sed -i '/127.0.1.1.*/d' /etc/hosts
echo "$NODE_IP     $(hostname)" >> /etc/hosts

echo $(hostname) > /opt/hadoop/etc/hadoop/workers

cp /vagrant/config/*.xml /opt/hadoop/etc/hadoop/

source /etc/environment

su -c "hdfs namenode -format" vagrant
su -c "hdfs datanode -format" vagrant


su -c "start-dfs.sh" vagrant
su -c "start-yarn.sh" vagrant
