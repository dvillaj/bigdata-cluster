#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalJava {
	echo "installing oracle jdk"
	FILE=/vagrant/resources/$JAVA_ARCHIVE
	tar -xzf $FILE -C /usr/local
    chown root:root /usr/local/jdk1.8.0_251
}

function installRemoteJava {
	echo "install open jdk"
	yum install -y java-1.8.0-openjdk-devel
}

function setupJava {
	echo "setting up java"
	if resourceExists $JAVA_ARCHIVE; then
		ln -s /usr/local/jdk1.8.0_251 /usr/local/java
	else
		ln -s /usr/lib/jvm/jre /usr/local/java
	fi
}

function setupEnvVars {
	echo "creating java environment variables"
	cp -f $JAVA_RES_DIR/java.sh /etc/profile.d/java.sh
}

function installJava {
	if resourceExists $JAVA_ARCHIVE; then
		installLocalJava
	else
		installRemoteJava
	fi
}

echo "setup java"
installJava
setupJava
setupEnvVars
