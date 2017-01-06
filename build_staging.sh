#!/bin/bash

docker build -t insightdatascience/venmo-monster:latest -f conf/Dockerfile.prod .
docker push insightdatascience/venmo-monster:latest
