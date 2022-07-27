#!/bin/bash
docker build -t tagger-api:$1 .
docker tag tagger-api:$1 oldcoyote03/tagger-api:$1
docker push oldcoyote03/tagger-api:$1