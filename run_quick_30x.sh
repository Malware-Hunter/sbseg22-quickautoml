#!/bin/bash

if ! [[ -d quickautoml ]]
then
        echo "Can't find quickautoml directory, please make sure to run the build script first"
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
        	python3 quickautoml/quickautoml_test.py $DATASET
	done
done


