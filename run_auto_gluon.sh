#!/bin/bash

AUTOGLUON_PYTHON=./env-autogluon/bin/python3
if ! [[ -f $AUTOGLUON_PYTHON ]]
then
        echo "Can't find python3 at '$AUTOGLUON_PYTHON', please make sure to run the build script first"
        exit 1
fi

bash setup_datasets.sh
[[ $? != 0 ]] && exit 1
for DATASET in datasets/*.csv
do
        echo "Begin tests with dataset $DATASET"
        $AUTOGLUON_PYTHON auto_gluon.py $DATASET
done


