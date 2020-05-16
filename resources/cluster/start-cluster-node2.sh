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

$HADOOP_YARN_HOME/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager
$HADOOP_YARN_HOME/sbin/yarn-daemons.sh --config $HADOOP_CONF_DIR start nodemanager
$HADOOP_YARN_HOME/sbin/yarn-daemon.sh start proxyserver --config $HADOOP_CONF_DIR
$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver --config $HADOOP_CONF_DIR


hive --service hiveserver2  > /usr/local/hive/logs/hive2.log 2>&1 &
hive --service metastore  > /usr/local/hive/logs/metastore.log 2>&1 &

