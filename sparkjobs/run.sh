#!/bin/bash

. ~/.profile

MEMINFO=($(free -m | sed -n '2p' | sed -e "s/[[:space:]]\+/ /g"))
TOTMEM=${MEMINFO[1]}
EXECMEM=$(echo "0.90 * ($TOTMEM - 1000)" | bc -l)

spark-submit --master spark://$(hostname):7077 \
             --executor-memory ${EXECMEM%.*}M \
             --driver-memory ${EXECMEM%.*}M \
             venmo-json2parquet.py
