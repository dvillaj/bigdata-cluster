source /etc/profile.d/hadoop.sh
source /etc/profile.d/hive.sh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


if [ -e /var/hadoop/.init ]; then

    schematool --verbose -dbType mysql -initSchema
    mkdir -p /usr/local/hive/logs
    rm /var/hadoop/.init
fi

start-yarn.sh

yarn --config $HADOOP_CONF_DIR --daemon start proxyserver
mapred --config $HADOOP_CONF_DIR --daemon start historyserver

hive --service hiveserver2  > /usr/local/hive/logs/hive2.log 2>&1 &
hive --service metastore  > /usr/local/hive/logs/metastore.log 2>&1 &

