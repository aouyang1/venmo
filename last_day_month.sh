#!/bin/bash

YEAR=$1
MONTH=$2

#python venmo.py ${YEAR}_${MONTH}_28 ${YEAR}_$((MONTH+1))_01 data &
python venmo.py ${YEAR}_${MONTH}_29 ${YEAR}_$((MONTH+1))_01 data &
#python venmo.py ${YEAR}_${MONTH}_30 ${YEAR}_$((MONTH+1))_01 data &
#python venmo.py ${YEAR}_${MONTH}_31 ${YEAR}_$((MONTH+1))_01 data &

wait

echo "Finished ${MONTH}/${YEAR}"
