#!/bin/bash

TPOT_PYTHON=./env-tpot/bin/python3
if ! [[ -f $TPOT_PYTHON ]]
then
        echo "Can't find python3 at '$TPOT_PYTHON', please make sure to run the build script first"
        exit 1
fi

[[ $1 ]] && [[ -f $1 ]] || echo "Uso: $0 DATASET [DATASET]...">&2 && exit 1
for DATASET in $*
do
        echo "Begin tests with dataset $DATASET"
        $TPOT_PYTHON tpot_test.py $DATASET
done


