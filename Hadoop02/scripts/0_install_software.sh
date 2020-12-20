## 
## Install Needed Software
##

apt -y update

# DEBIAN_FRONTEND='noninteractive' apt-get dist-upgrade  -o Dpkg::Options::="--force-confdef" -o Dpkg::Options="--force-confold" -y

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

cat << EOT >> /opt/hadoop/etc/hadoop/hadoop-env.sh
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
## Set up Environment variables
## 
cat << EOT > /etc/environment
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/hadoop/bin:/opt/hadoop/sbin"
JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"
EOT

