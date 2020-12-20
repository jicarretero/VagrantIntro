#!/bin/bash

source /etc/environment
su -c "hdfs namenode -format" vagrant
su -c "hdfs datanode -format" vagrant

su -c "start-dfs.sh" vagrant
su -c "start-yarn.sh" vagrant

