#!/bin/sh

# CMD_PATH=/Users/nickolasvela/Documents/dev/Repositories/Tagger_Simple_Env/utils
# $CMD_PATH/push-pull.sh -m "commit message"

while getopts m:d flag
do
    case "${flag}" in
        m) msg=${OPTARG};;
        p) pull=1;;
    esac
done

if [ -z "$msg" ]
then
    echo "missing commit message -m"
    exit 1
fi

echo; echo "push"
git add -A
git commit -m "$msg"
git push --set-upstream origin develop

sleep 10

echo; echo "pull"
#docker exec flask-api git pull
docker exec flask-api git fetch
docker exec flask-api git reset --hard HEAD
docker exec flask-api git merge origin/develop
sleep 5

