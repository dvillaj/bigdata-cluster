$HADOOP_HOME/bin/hdfs namenode -format myhadoop

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR --daemon start namenode
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR --daemon start datanode