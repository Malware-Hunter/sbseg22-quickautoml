#!/bin/bash

if ! [[ -d quickautoml ]]
then
        echo "Can't find quickautoml directory, please make sure to run the build script first"
        exit 1
fi

bash setup_datasets.sh
[[ $? != 0 ]] && exit 1
for DATASET in datasets/*.csv
do
        echo "Begin tests with dataset $DATASET"
        python3 quickautoml/quickautoml_test.py $DATASET
done


