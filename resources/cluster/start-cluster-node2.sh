source /etc/profile.d/hadoop.sh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

start-yarn.sh

yarn --config $HADOOP_CONF_DIR --daemon start proxyserver
mapred --config $HADOOP_CONF_DIR --daemon start historyserver
