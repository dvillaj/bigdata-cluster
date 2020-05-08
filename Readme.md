# BigData Cluster

## Download Resources

- Java 8

https://download.oracle.com/otn/java/jdk/8u251-b08/3d5a2bb8f8d4428bbe94aed7ec7ae784/jdk-8u251-linux-x64.tar.gz


- Hadoop & Spark

```
./download-resources.sh
```


## Setup Cluster

- Login into `node1` and start cluster services

```
vagrant ssh node-1
sudo start-cluster
```

- Login into `node2` and start cluster services

```
vagrant ssh node-2
sudo start-cluster
```


- Append the cluster nodes ips to `/etc/hosts` in the host machine:

```
10.211.55.101 node1
10.211.55.102 node2
10.211.55.103 node3
10.211.55.104 node4
```


## Hadoop

http://node1:9870

## Yarn

http://node2:8088

## JobHistory

http://node2:19888

## Spark

http://node1:8080

## Hive

http://node:10002