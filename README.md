# Tagger_Local_Env

./push-img.sh -t v0.7 -c

Build the image
Note: Image will rebuild if app 'develop' branch changes. Ref: [How to prevent Dockerfile caching git clone](https://stackoverflow.com/questions/36996046/how-to-prevent-dockerfile-caching-git-clone)
`docker build -t tagger-api:vX .`

Run container from docker compose
`docker-compose up`

Tag the image
```
docker tag tagger-api:vX oldcoyote03/tagger-api:vX
docker tag tagger-api:vX oldcoyote03/tagger-api:latest
```

Push the image to docker hub
`docker push oldcoyote03/tagger-api:vX`

Push all tags to docker hub
`docker push --all-tags oldcoyote03/tagger-api`

NOTE: On MacOS, [AirPlay uses port 5000 and 7000](https://developer.apple.com/forums/thread/682332)

Remove services
`docker-compose down`