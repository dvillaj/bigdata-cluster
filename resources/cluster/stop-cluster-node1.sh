source /etc/profile.d/hadoop.sh
source /etc/profile.d/spark.sh
source /etc/profile.d/java.sh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


stop-dfs.sh
$SPARK_HOME/sbin/stop-all.sh