#!/bin/bash

RUNNING=$(docker ps | grep disbalancer | wc -l)
EXPECTED_COUNT=4

if (( $RUNNING < $EXPECTED_COUNT ))
then
 echo "$(date +\%Y-\%m-\%d-\%H:\%M:\%S): ONLY $RUNNING containers are running ($EXPECTED_COUNT required)"
 docker kill $(docker ps -q)
 docker container prune -f
 . ./restart.sh
 RUNNING=$(docker ps | grep disbalancer | wc -l)
 echo "$(date +\%Y-\%m-\%d-\%H:\%M:\%S): RESTARTED. RUNNING $RUNNING containers"
else
 echo "$(date +\%Y-\%m-\%d-\%H:\%M:\%S): ALL $EXPECTED_COUNT containers are running"
fi