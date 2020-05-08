#!/bin/bash
source "/vagrant/scripts/common.sh"

function installPython {
	echo "installing python 3"
	dnf install -y python3
    # dnf -y groupinstall development
    # dnf install mysql-devel

}

function installPackages {
	echo "install python packages"
	pip3 install jupyterlab pandas ipython-sql  matplotlib pyspark==${SPARK_VERSION}
    # pip3 install mysqlclient
}


echo "setup python"
installPython
installPackages
