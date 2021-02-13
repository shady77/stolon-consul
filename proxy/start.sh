#!/bin/sh
echo "CLUSTER_NAME=$CLUSTER_NAME"
echo "CONSUL_URL=$CONSUL_URL"
echo "LOG_LEVEL=$LOG_LEVEL"
/usr/local/bin/stolon-proxy --listen-address 0.0.0.0 --cluster-name $CLUSTER_NAME --store-backend=consul --store-endpoints $CONSUL_URL --log-level $LOG_LEVEL
