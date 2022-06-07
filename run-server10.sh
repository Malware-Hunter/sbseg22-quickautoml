#!/bin/bash

TPOT_PYTHON=./env-tpot/bin/python3
AUTOGLUON_PYTHON=./env-autogluon/bin/python3

if ! [[ -f $TPOT_PYTHON ]] || ! [[ -f $AUTOGLUON_PYTHON ]]
then
        echo "Can't find virtual environments, please make sure to run the build script first"
        exit 1
fi

[[ $1 ]] && [[ -f $1 ]] || echo "Uso: $0 DATASET [DATASET]..."

for DATASET in $*
do
        echo "Begin tests with dataset $DATASET"
        $TPOT_PYTHON tpot_test.py $DATASET
        $AUTOGLUON_PYTHON auto_gluon.py $DATASET
done
