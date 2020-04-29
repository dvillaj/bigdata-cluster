#!/bin/bash

SPARK_VERSION=2.4.5
SPARK_HADOOP_VERSION=2.7
HADOOP_VERSION=3.1.3

echo "Hadoop"
wget https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz
mv  hadoop-${HADOOP_VERSION}.tar.gz resources

echo "Spark"
wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION}.tgz
mv spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION}.tgz resources
