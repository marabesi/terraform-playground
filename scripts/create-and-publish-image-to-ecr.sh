#!/bin/bash

# refs https://gist.github.com/judy2k/7656bfe3b322d669ef75364a46327836
source .env

docker build --no-cache -t $IMAGE .

docker tag $IMAGE $ECS_REPOSITORY/$IMAGE

docker push $ECS_REPOSITORY/$IMAGE