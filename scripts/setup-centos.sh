#!/bin/bash
source "/vagrant/scripts/common.sh"

function disableFirewall {
	echo "disabling firewall"
    systemctl stop firewalld
    systemctl disable firewalld
}

function enablePasswordAuthentication {
	echo "enabling Password Authentication"
    sed -i "s/PasswordAuthentication no/#PasswordAuthentication no/" /etc/ssh/sshd_config
    sed -i "s/#PasswordAuthentication yes/PasswordAuthentication yes/" /etc/ssh/sshd_config
    systemctl restart sshd
}

function installNetStats {
	yum -y install net-tools
}


echo "setup centos"

disableFirewall
enablePasswordAuthentication
installNetStats