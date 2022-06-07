#!/bin/bash
AUTO_SKLEARN_PYTHON=./env-auto-sklearn/bin/python3
if ! [[ -f $AUTO_SKLEARN_PYTHON ]]
then
        echo "Can't find python3 at '$AUTO_SKLEARN_PYTHON', please make sure to run the build script first"
        exit 1
fi

bash setup_datasets.sh
[[ $? != 0 ]] && exit 1
for DATASET in datasets/*.csv
do
        echo "Begin tests with dataset $DATASET"
        $AUTO_SKLEARN_PYTHON auto_sklearn.py $DATASET
done


