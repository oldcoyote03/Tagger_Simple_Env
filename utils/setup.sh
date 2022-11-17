#!/bin/sh

echo "Wait for cockroachdb to initialize"
sleep 20

docker exec roach ./cockroach sql --insecure --execute="CREATE DATABASE IF NOT EXISTS tagger_db;"
echo "Created Database"
sleep 5

docker ps
sleep 2

docker exec -d flask-api python /tagger_api/run.py
echo "API deployed"
sleep 2

docker exec flask-api pytest /tagger_api/app/test/test_mock_app.py -v -s --env=dev
echo "ran mock tests"
sleep 5

docker exec flask-api pytest /tagger_api/app/test/test_app.py -v -s --env=test
echo "ran integration tests"

sleep infinity

#docker exec -it db-init /bin/sh
#docker exec -it flask-api /bin/bash
#netstat -tulnp | grep :5000
#kill 
