# Docker image of Stolon - PostgreSQL with pg_cron

PostgreSQL: 13-alpine

PgCron: 1.3.0

## Install
* ```docker run --network=db -it stolon-cli stolonctl --cluster-name stolon-db --store-backend consul --store-endpoints=http://consul.service:8500 init```


## Links
* [Github](https://github.com/sorintlab/stolon)
