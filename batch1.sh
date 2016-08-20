#!/bin/bash

YEAR=$1
MONTH=$2

python venmo.py ${YEAR}_${MONTH}_01 ${YEAR}_${MONTH}_02 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_02 ${YEAR}_${MONTH}_03 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_03 ${YEAR}_${MONTH}_04 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_04 ${YEAR}_${MONTH}_05 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_05 ${YEAR}_${MONTH}_06 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_06 ${YEAR}_${MONTH}_07 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_07 ${YEAR}_${MONTH}_08 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_08 ${YEAR}_${MONTH}_09 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_09 ${YEAR}_${MONTH}_10 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_10 ${YEAR}_${MONTH}_11 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_11 ${YEAR}_${MONTH}_12 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_12 ${YEAR}_${MONTH}_13 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_13 ${YEAR}_${MONTH}_14 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_14 ${YEAR}_${MONTH}_15 data & sleep 1
python venmo.py ${YEAR}_${MONTH}_15 ${YEAR}_${MONTH}_16 data & sleep 1

wait

echo "Finished ${MONTH}/${YEAR}"
