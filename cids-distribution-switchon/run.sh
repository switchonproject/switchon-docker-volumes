#!/bin/bash

docker-compose rm -f cids-integration-base
docker-compose rm -v -f cids-distribution-switchon

# don't delete the volume, it contains the imported dump! 
# use run-import.sh to create a fresh database and volume!
# docker rm -v -f cidsdistributionswitchon_cids-integration-base
docker rm -v -f cidsdistributionswitchon_cids-distribution-switchon

docker volume rm cidsdistributionswitchon_cids-integration-base
docker volume rm cidsdistributionswitchon_cids-distribution-switchon

docker-compose -p cidsdistributionswitchon up -d

docker-compose ps
