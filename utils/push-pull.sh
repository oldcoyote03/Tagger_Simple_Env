#!/bin/sh

# ./push-pull.sh -m "commit message"

while getopts m: flag
do
    case "${flag}" in
        m) msg=${OPTARG};;
    esac
done

if [ -z "$msg" ]
then
    echo "missing commit message -m"
    exit 1
else
    echo "commit message: $msg"
fi

echo "push"
git add -A
git commit -m "$msg"
git push --set-upstream origin develop

sleep 10

#echo "pull"
#docker exec flask-api git pull

sleep 5