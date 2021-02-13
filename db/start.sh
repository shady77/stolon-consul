#!/bin/sh
echo "CLUSTER_NAME=$CLUSTER_NAME"
echo "CONSUL_URL=$CONSUL_URL"
echo "LOG_LEVEL=$LOG_LEVEL"

echo "UID=$UID"
echo "LISTEN_ADDR=$LISTEN_ADDR"
echo "PASSWORD_FILE=$PASSWORD_FILE"
echo "REPL_PASSWORD_FILE=$REPL_PASSWORD_FILE"

/usr/local/bin/gosu stolon /usr/local/bin/stolon-keeper\
 --pg-listen-address $LISTEN_ADDR\
 --pg-repl-username replication\
 --uid $UID --pg-su-username postgres\
 --pg-su-passwordfile /run/secrets/$PASSWORD_FILE\
 --pg-repl-passwordfile /run/secrets/$REPL_PASSWORD_FILE\
 --data-dir /var/lib/postgresql/data\
 --cluster-name $CLUSTER_NAME\
 --store-backend=consul\
 --store-endpoints $CONSUL_URL\
 --log-level $LOG_LEVEL
