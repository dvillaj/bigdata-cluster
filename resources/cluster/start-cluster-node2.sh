source /etc/profile.d/hadoop.sh

start-yarn.sh

#yarn --config $HADOOP_CONF_DIR --daemon start resourcemanager
#yarn --config $HADOOP_CONF_DIR --daemon start nodemanager
yarn --config $HADOOP_CONF_DIR --daemon start proxyserver
mapred --config $HADOOP_CONF_DIR --daemon start historyserver
