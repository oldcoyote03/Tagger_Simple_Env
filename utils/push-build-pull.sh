#!/bin/sh

while getopts m:t:c flag
do
    case "${flag}" in
        m) msg=${OPTARG};;
        t) tag=${OPTARG};;
        c) cache=1;;
    esac
done

echo "push"
git add -A
git commit -m "$msg"
git push --set-upstream origin develop

sleep 10

echo "build"
if [ -z "$cache" ]
then
    docker build --no-cache -t tagger-api:$tag .
else
    docker build -t tagger-api:$tag .
fi

sleep 10

echo "pull"
docker exec flask-api git pull

sleep 5