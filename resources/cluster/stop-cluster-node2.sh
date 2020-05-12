source /etc/profile.d/hadoop.sh
source /etc/profile.d/spark.sh
source /etc/profile.d/java.sh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


kill -9 `ps aux | grep proc_hiveserver2 | awk '{print $2}' | head -n 1`
kill -9 `ps aux | grep proc_metastore | awk '{print $2}' | head -n 1`

yarn --config $HADOOP_CONF_DIR --daemon stop proxyserver
mapred --config $HADOOP_CONF_DIR --daemon stop historyserver


stop-yarn.sh
