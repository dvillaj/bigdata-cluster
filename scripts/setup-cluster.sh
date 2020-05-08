#!/bin/bash
source "/vagrant/scripts/common.sh"
NODE=0

while getopts n: option
do
	case "${option}"
	in
		n) NODE=${OPTARG};;
	esac
done

function copyCluserUtils {
	cp -f "$CLUSTER_RES_DIR/start-cluster-node$NODE.sh" /usr/bin/start-cluster
	cp -f "$CLUSTER_RES_DIR/start-cluster-node$NODE.sh" /usr/bin/stop-cluster
	chmod +x /usr/bin/st*-cluster
}


echo "setup cluster"
copyCluserUtils