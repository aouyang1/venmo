#!/bin/bash

DIR_ROOT=$(dirname ${BASH_SOURCE})

CLUSTER_NAME=ao-cluster

peg up ${DIR_ROOT}/master.yml &
peg up ${DIR_ROOT}/workers.yml &

wait

peg fetch ${CLUSTER_NAME}

peg install ${CLUSTER_NAME} aws
peg install ${CLUSTER_NAME} ssh
peg install ${CLUSTER_NAME} hadoop
peg install ${CLUSTER_NAME} spark

peg service ${CLUSTER_NAME} spark start

peg scp to-rem ${CLUSTER_NAME} 1 run.sh /home/ubuntu/
peg scp to-rem ${CLUSTER_NAME} 1 venmo-json2parquet.py /home/ubuntu/

echo "Sleep for 10 seconds to wait for all Spark Workers"
sleep 10

peg sshcmd-node ${CLUSTER_NAME} 1 "cd /home/ubuntu; ./run.sh"

echo "Waiting for files to settle on S3 before shutting down"
sleep 10

yes "y" | peg down ${CLUSTER_NAME}

