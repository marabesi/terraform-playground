#!/bin/bash

ECS_REPOSITORY='814206347167.dkr.ecr.us-east-2.amazonaws.com'
IMAGE='dev-terraform-playground-registry:latest'

docker build --no-cache -t $IMAGE .

docker tag $IMAGE $ECS_REPOSITORY/$IMAGE

docker push $ECS_REPOSITORY/$IMAGE