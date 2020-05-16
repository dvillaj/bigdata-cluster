source /etc/profile.d/hadoop.sh
source /etc/profile.d/spark.sh
source /etc/profile.d/java.sh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

$SPARK_HOME/sbin/stop-all.sh

$HADOOP_PREFIX/sbin/hadoop-daemons.sh --config $HADOOP_CONF_DIR --script hdfs stop datanode
$HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs stop namenode