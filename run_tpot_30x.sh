#!/bin/bash

TPOT_PYTHON=./env-tpot/bin/python3
if ! [[ -f $TPOT_PYTHON ]]
then
        echo "Can't find python3 at '$TPOT_PYTHON', please make sure to run the build script first"
        exit 1
fi

cd datasets/
for DATASET in *.zip
do
	unip -f $DATASET
done
cd ..

for i in `seq 1 30`
do
	echo "********* exec $i de 30 *********"
	for DATASET in datasets/*.csv
	do
        	echo "Begin tests with dataset $DATASET"
        	$TPOT_PYTHON tpot_test.py $DATASET
	done
done

