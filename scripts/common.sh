#!/bin/bash

#java
JAVA_ARCHIVE=jdk-8u251-linux-x64.tar.gz
JAVA_RES_DIR=/vagrant/resources/java

#hadoop
HADOOP_HOME=/usr/local/hadoop
HADOOP_CONF=$HADOOP_HOME/etc/hadoop
HADOOP_VERSION=hadoop-3.2.1
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=https://downloads.apache.org/hadoop/common/${HADOOP_VERSION}/${HADOOP_ARCHIVE}
HADOOP_RES_DIR=/vagrant/resources/hadoop

#hive
MYSQL_ROOT_PASSWD="UvwKXqnrfn27CNVz"
MYSQL_HIVE_PASSWD="3MX6fDLN2AQm23bD"
HIVE_VERSION=3.1.2
HIVE_ARCHIVE=apache-hive-${HIVE_VERSION}-bin.tar.gz
HIVE_MIRROR_DOWNLOAD=https://downloads.apache.org/hive/hive-${HIVE_VERSION}/${HIVE_ARCHIVE}
HIVE_RES_DIR=/vagrant/resources/hive
HIVE_CONF=/usr/local/hive/conf
HIVE_LIB=/usr/local/hive/lib

HIVE_CONNECTOR_ARCHIVE_VERSION=8.0.19
HIVE_CONNECTOR_ARCHIVE=mysql-connector-java-${HIVE_CONNECTOR_ARCHIVE_VERSION}.tar.gz
HIVE_CONNECTOR_MIRROR_DOWNLOAD=https://dev.mysql.com/get/Downloads/Connector-J/${HIVE_CONNECTOR_ARCHIVE}

#spark
SPARK_VERSION=2.4.5
SPARK_HADOOP_VERSION=hadoop2.7
SPARK_ARCHIVE=spark-${SPARK_VERSION}-bin-${SPARK_HADOOP_VERSION}.tgz
SPARK_MIRROR_DOWNLOAD=https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/${SPARK_ARCHIVE}
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
