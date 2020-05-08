source /etc/profile.d/hadoop.sh
source /etc/profile.d/spark.sh
source /etc/profile.d/java.sh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if [ -e /var/hadoop/.init ]; then

    hdfs namenode -format
fi

start-dfs.sh

if [ -e /var/hadoop/.init ]; then

    hdfs dfs -mkdir -p /user/vagrant
    hdfs dfs -chown vagrant /user/vagrant

    hdfs dfs -mkdir -p /user/hive/warehouse
    hdfs dfs -chmod -R a+rw /user/hive

    rm /var/hadoop/.init

fi

$SPARK_HOME/sbin/start-all.sh