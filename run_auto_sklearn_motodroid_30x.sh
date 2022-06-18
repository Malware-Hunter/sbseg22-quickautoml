#!/bin/bash
AUTO_SKLEARN_PYTHON=./env-auto-sklearn/bin/python3
if ! [[ -f $AUTO_SKLEARN_PYTHON ]]
then
        echo "Can't find python3 at '$AUTO_SKLEARN_PYTHON', please make sure to run the build script first"
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
	for DATASET in datasets/m*.csv
	do
		echo "Begin tests with dataset $DATASET"
		$AUTO_SKLEARN_PYTHON auto_sklearn.py $DATASET
	done
done

