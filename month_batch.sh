#!/bin/bash

YEAR=$1
MONTH=$2

python venmo.py ${YEAR}_${MONTH}_01 ${YEAR}_${MONTH}_02 data &
python venmo.py ${YEAR}_${MONTH}_02 ${YEAR}_${MONTH}_03 data &
python venmo.py ${YEAR}_${MONTH}_03 ${YEAR}_${MONTH}_04 data &
python venmo.py ${YEAR}_${MONTH}_04 ${YEAR}_${MONTH}_05 data &
python venmo.py ${YEAR}_${MONTH}_05 ${YEAR}_${MONTH}_06 data &
python venmo.py ${YEAR}_${MONTH}_06 ${YEAR}_${MONTH}_07 data &
python venmo.py ${YEAR}_${MONTH}_07 ${YEAR}_${MONTH}_08 data &
python venmo.py ${YEAR}_${MONTH}_08 ${YEAR}_${MONTH}_09 data &
python venmo.py ${YEAR}_${MONTH}_09 ${YEAR}_${MONTH}_10 data &
python venmo.py ${YEAR}_${MONTH}_10 ${YEAR}_${MONTH}_11 data &
python venmo.py ${YEAR}_${MONTH}_11 ${YEAR}_${MONTH}_12 data &
python venmo.py ${YEAR}_${MONTH}_12 ${YEAR}_${MONTH}_13 data &
python venmo.py ${YEAR}_${MONTH}_13 ${YEAR}_${MONTH}_14 data &
python venmo.py ${YEAR}_${MONTH}_14 ${YEAR}_${MONTH}_15 data &
python venmo.py ${YEAR}_${MONTH}_15 ${YEAR}_${MONTH}_16 data &
python venmo.py ${YEAR}_${MONTH}_16 ${YEAR}_${MONTH}_17 data &
python venmo.py ${YEAR}_${MONTH}_17 ${YEAR}_${MONTH}_18 data &
python venmo.py ${YEAR}_${MONTH}_18 ${YEAR}_${MONTH}_19 data &
python venmo.py ${YEAR}_${MONTH}_19 ${YEAR}_${MONTH}_20 data &
python venmo.py ${YEAR}_${MONTH}_20 ${YEAR}_${MONTH}_21 data &
python venmo.py ${YEAR}_${MONTH}_21 ${YEAR}_${MONTH}_22 data &
python venmo.py ${YEAR}_${MONTH}_22 ${YEAR}_${MONTH}_23 data &
python venmo.py ${YEAR}_${MONTH}_23 ${YEAR}_${MONTH}_24 data &
python venmo.py ${YEAR}_${MONTH}_24 ${YEAR}_${MONTH}_25 data &
python venmo.py ${YEAR}_${MONTH}_25 ${YEAR}_${MONTH}_26 data &
python venmo.py ${YEAR}_${MONTH}_26 ${YEAR}_${MONTH}_27 data &
python venmo.py ${YEAR}_${MONTH}_27 ${YEAR}_${MONTH}_28 data &
python venmo.py ${YEAR}_${MONTH}_28 ${YEAR}_${MONTH}_29 data &
python venmo.py ${YEAR}_${MONTH}_29 ${YEAR}_${MONTH}_30 data &
python venmo.py ${YEAR}_${MONTH}_30 ${YEAR}_${MONTH}_31 data &

wait

echo "Finished ${MONTH}/${YEAR}"
