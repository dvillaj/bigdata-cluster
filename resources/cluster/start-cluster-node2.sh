$HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR --daemon start resourcemanager
$HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR --daemon start nodemanager
$HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR --daemon start proxyserver
$HADOOP_HOME/bin/mapred --config $HADOOP_CONF_DIR --daemon start historyserver
