#!/bin/sh
apk add --no-cache curl
echo "curl installed"

echo "Wait for services to initialize"
sleep 7

docker ps
#docker exec roach1 ./cockroach init --insecure
docker exec -d flask-api apt-get -y install nano net-tools

echo "Services initialized"
sleep 1

docker exec roach ./cockroach sql --insecure --execute="CREATE DATABASE IF NOT EXISTS tagger_db;"

echo "DB schema initialized"
#sleep infinity
sleep 2

#docker exec -it db-init /bin/sh
docker exec -d flask-api python /tagger_api/run.py
sleep 7
echo "API deployed"

#docker exec -it flask-api /bin/bash
#netstat -tulnp | grep :5000
#kill 

sleep infinity
