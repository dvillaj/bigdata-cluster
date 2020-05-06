source /etc/profile.d/hadoop.sh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if [ -e /var/hadoop/.format ]; then

    hdfs namenode -format
    rm /var/hadoop/.format

fi

start-dfs.sh

hadoop fs -mkdir /user/
hadoop fs -mkdir /user/vagrant
hadoop fs -chown vagrant /user/vagrant