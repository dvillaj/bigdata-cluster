#!/bin/bash

source ./scripts/common.sh


echo "Hadoop"
curl $HADOOP_MIRROR_DOWNLOAD -o resources/$HADOOP_ARCHIVE

echo "Spark"
curl $SPARK_MIRROR_DOWNLOAD -o resources/$SPARK_ARCHIVE

echo "Hive"
curl $HIVE_MIRROR_DOWNLOAD -o resources/$HIVE_ARCHIVE
