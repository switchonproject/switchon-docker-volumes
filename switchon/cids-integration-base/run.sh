#!/bin/bash

docker stop switchon_cids-integration-base

docker rm -f switchon_cids-integration-base
# don't delete the volume, it contains the imported dump! 
# use run-import.sh to create a fresh database and volume!
#docker volume rm switchon_cids-integration-base

docker run -it -p 5434:5432 --name switchon_cids-integration-base \
    -v switchon_cids-integration-base:/cidsIntegrationBase/pg_data \
    -v ~/switchon-docker-volumes/switchon/cids-integration-base/import/:/import/cidsIntegrationBase/ \
    cismet/cids-integration-base:postgres-9.6.1-2.0 \
    start
