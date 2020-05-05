$HADOOP_HOME/bin/hdfs namenode -format myhadoop

## Start Hadoop Daemons (HDFS + YARN)

$HADOOP_HOME/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start namenode