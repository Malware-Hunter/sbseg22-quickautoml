#!/bin/bash

TPOT_PYTHON=./env-tpot/bin/python3
AUTOGLUON_PYTHON=./env-autogluon/bin/python3
AUTO_SKLEARN_PYTHON=./env-auto-sklearn/bin/python3 
if ! [[ -f $TPOT_PYTHON ]] || ! [[ -f $AUTOGLUON_PYTHON ]] || ! [[ -f $AUTO_SKLEARN_PYTHON ]] || ! [[ -d quickautoml ]]
then
        echo "Can't find virtual environments, please make sure to run the build script first"
        exit 1
fi

[[ $1 ]] && [[ -f $1 ]] || echo "Uso: $0 DATASET [DATASET]..."

for DATASET in $*
do
        echo "Begin tests with dataset $DATASET"
        python3 quickautoml/quickautoml_test.py $DATASET
done

