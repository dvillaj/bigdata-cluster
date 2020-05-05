#!/bin/bash

#java
JAVA_ARCHIVE=jdk-8u251-linux-x64.tar.gz

#hadoop
HADOOP_HOME=/usr/local/hadoop
HADOOP_CONF=$HADOOP_HOME/etc/hadoop
HADOOP_VERSION=hadoop-3.1.3
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=https://downloads.apache.org/hadoop/common/${HADOOP_VERSION}/${HADOOP_VERSION}.tar.gz
HADOOP_RES_DIR=/vagrant/resources/hadoop

#spark
SPARK_VERSION=spark-2.4.5
SPARK_ARCHIVE=$SPARK_VERSION-bin-hadoop2.7.tgz
SPARK_MIRROR_DOWNLOAD=../resources/$SPARK_ARCHIVE
SPARK_RES_DIR=/vagrant/resources/spark
SPARK_CONF_DIR=/usr/local/spark/conf

CLUSTER_RES_DIR=/vagrant/resources/cluster

#ssh
SSH_RES_DIR=/vagrant/resources/ssh
RES_SSH_COPYID=$SSH_RES_DIR/ssh-copy-id.sh
RES_SSH_CONFIG=$SSH_RES_DIR/config

function resourceExists {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}
