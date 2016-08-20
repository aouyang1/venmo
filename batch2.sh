#!/bin/bash

YEAR=$1
MONTH=$2

python venmo.py ${YEAR}_${MONTH}_16 ${YEAR}_${MONTH}_17 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_17 ${YEAR}_${MONTH}_18 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_18 ${YEAR}_${MONTH}_19 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_19 ${YEAR}_${MONTH}_20 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_20 ${YEAR}_${MONTH}_21 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_21 ${YEAR}_${MONTH}_22 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_22 ${YEAR}_${MONTH}_23 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_23 ${YEAR}_${MONTH}_24 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_24 ${YEAR}_${MONTH}_25 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_25 ${YEAR}_${MONTH}_26 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_26 ${YEAR}_${MONTH}_27 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_27 ${YEAR}_${MONTH}_28 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_28 ${YEAR}_${MONTH}_29 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_29 ${YEAR}_${MONTH}_30 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_30 ${YEAR}_${MONTH}_31 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_31 ${YEAR}_$((MONTH+1))_1 data & sleep 1

wait

echo "Finished ${MONTH}/${YEAR}"
