#!/bin/bash
source "/vagrant/scripts/common.sh"
HOST_IP=$1

function installMysql {
	echo "installing mysql"
    yum -y install @mysql
}

function enableService {
	echo "enabling mysql service"
    echo "bind-address=$HOST_IP" >> /etc/my.cnf.d/mysql-server.cnf 

    systemctl start mysqld
    systemctl enable --now mysqld
}

function secureInstallation {

    # Make sure that NOBODY can access the server without a password
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWD}'"
}


function setupHiveDatabase {
	echo "setup hive database"
	sed "s/PW_FOR_HIVE/$MYSQL_HIVE_PASSWD/" $HIVE_RES_DIR/hive-init.sql | mysql
}

function writeConfigFile {
      cat << EOF > ~/.my.cnf
[mysql]
user = root
password = $MYSQL_ROOT_PASSWD
EOF
}


echo "setup mysql [$HOST_IP]"

installMysql
enableService
secureInstallation
writeConfigFile
setupHiveDatabase