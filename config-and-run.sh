#!/bin/bash


if [ -z "SERVER_ID" ] [ -z "MAX_SERVERS" ]; then
  echo "Starting up in clustered mode"
  for i in 1...$MAX_SERVERS;do
    echo "server.$i=zookeeper-$i:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
  done

  # Persists the ID of the current instance of Zookeeper
  echo ${SERVER_ID} > /opt/zookeeper/data/myid
  else
	  echo "Starting up in standalone mode"
fi

exec /opt/zookeeper/bin/zkServer.sh start-foreground
