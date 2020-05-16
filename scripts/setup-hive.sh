#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalHive {
	echo "install hive from local file"
	FILE=/vagrant/resources/$HIVE_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteHive {
	echo "install spark from remote file"
	curl -o /vagrant/resources/$HIVE_ARCHIVE -O -L $HIVE_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$HIVE_ARCHIVE -C /usr/local
}

function setupHive {
	echo "setup hive"
	cp -f $HIVE_RES_DIR/conf/* $HIVE_CONF
	sed -i "s/PW_FOR_HIVE/$MYSQL_HIVE_PASSWD/" $HIVE_CONF/hive-site.xml
}

function replaceGuava {
	echo "replace guava"
	rm $HIVE_LIB/guava-19.0.jar
    cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-*-jre.jar $HIVE_LIB
}


function mysqlJavaConnector {
	echo "install mysql connector"
	curl -o /vagrant/resources/$HIVE_CONNECTOR_ARCHIVE -O -L $HIVE_CONNECTOR_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$HIVE_CONNECTOR_ARCHIVE
	cp mysql-connector-java-${HIVE_CONNECTOR_ARCHIVE_VERSION}/*.jar $HIVE_LIB
	rm -rf mysql-connector-java-${HIVE_CONNECTOR_ARCHIVE_VERSION}
}

function setupEnvVars {
	echo "creating spark environment variables"
	cp -f $HIVE_RES_DIR/hive.sh /etc/profile.d/hive.sh
}

function installHive {
	if resourceExists $HIVE_ARCHIVE; then
		installLocalHive
	else
		installRemoteHive
	fi
	ln -s /usr/local/apache-hive-${HIVE_VERSION}-bin /usr/local/hive
}

echo "setup hive"

installHive
setupHive
setupEnvVars
mysqlJavaConnector
#replaceGuava