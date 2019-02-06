#!/usr/bin/env bash

# arguements
zk_server="$1"
echo "zk_server: $zk_server"

# Set ZooKeeper zoo.cfg
cat << EOF | tee /tmp/zoo.cfg
tickTime=2000
initLimit=100
syncLimit=5
dataDir=/tmp/zookeeper
clientPort=2181
$zk_server
EOF

mkdir /tmp/zookeeper

# over-write default zoo.cfg
sudo cp /tmp/zoo.cfg /usr/lib/zookeeper/conf/zoo.cfg
sudo cp /tmp/zoo.cfg /etc/zookeeper/conf/zoo.cfg

# restart zookeeper
sudo /usr/lib/zookeeper/bin/zkServer.sh restart
