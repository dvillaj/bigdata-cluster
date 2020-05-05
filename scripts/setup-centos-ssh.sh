#!/bin/bash
# http://unix.stackexchange.com/questions/59003/why-ssh-copy-id-prompts-for-the-local-user-password-three-times
# http://linuxcommando.blogspot.com/2008/10/how-to-disable-ssh-host-key-checking.html
# http://linuxcommando.blogspot.ca/2013/10/allow-root-ssh-login-with-public-key.html
# http://stackoverflow.com/questions/12118308/command-line-to-execute-ssh-with-password-authentication
# http://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/
source "/vagrant/scripts/common.sh"
START=3
TOTAL_NODES=2

while getopts s:t: option
do
	case "${option}"
	in
		s) START=${OPTARG};;
		t) TOTAL_NODES=${OPTARG};;
	esac
done
#echo "start = ${START}, total nodes = ${TOTAL_NODES}"

function installSSHPass {
	#yum -y install wget
	#wget https://cbs.centos.org/kojifiles/packages/sshpass/1.06/8.el8/aarch64/sshpass-1.06-8.el8.aarch64.rpm
	#rpm -ivh sshpass-1.06-8.el8.aarch64.rpm
    yum -y install epel-release
    yum -y install sshpass 
}

function overwriteSSHCopyId {
	cp -f $RES_SSH_COPYID /usr/bin/ssh-copy-id
}


function createSSHKey {
	echo "generating ssh key"
	ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
	cp -f $RES_SSH_CONFIG ~/.ssh
}

function sshCopyId {
	echo "executing ssh-copy-id"
	for i in $(seq $START $TOTAL_NODES)
	do 
		node="node${i}"
		echo "copy ssh key to ${node}"
		ssh-copy-id -i ~/.ssh/id_rsa.pub $node
	done
}


echo "setup ssh"
installSSHPass
createSSHKey
overwriteSSHCopyId
sshCopyId
