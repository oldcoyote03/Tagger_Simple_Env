#!/bin/bash

while getopts "t:d:c" flag
do
    case "${flag}" in
        t) tag=${OPTARG};;
        d) dockerfile=${OPTARG};;
        c) cache=1;;
    esac
done

if [ -z "$tag" ]
then
    echo "Missing tag argument"
    exit 1
fi

if [ -z "$dockerfile" ]
then
    buildpath="../Flask"
else
    buildpath=$dockerfile
fi

if [ -z "$cache" ]
then
    docker build --no-cache -t tagger-api:$tag $buildpath
else
    docker build -t tagger-api:$tag $buildpath
fi

docker tag tagger-api:$tag oldcoyote03/tagger-api:$tag
docker push oldcoyote03/tagger-api:$tag