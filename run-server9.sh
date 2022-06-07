#!/bin/bash

AUTO_SKLEARN_PYTHON=./env-auto-sklearn/bin/python3 
if ! [[ -f $AUTO_SKLEARN_PYTHON ]] || ! [[ -d quickautoml ]]
then
        echo "Can't find virtual environments, please make sure to run the build script first"
        exit 1
fi

[[ $1 ]] && [[ -f $1 ]] || echo "Uso: $0 DATASET [DATASET]..."

for DATASET in $*
do
        echo "Begin tests with dataset $DATASET"
        $AUTO_SKLEARN_PYTHON auto_sklearn.py $DATASET
        python3 quickautoml/quickautoml_test.py $DATASET
done


