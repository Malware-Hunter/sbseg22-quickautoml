#!/bin/bash

if ! [[ -d quickautoml ]]
then
        echo "Can't find quickautoml directory, please make sure to run the build script first"
        exit 1
fi

[[ $1 ]] && [[ -f $1 ]] || { echo "Uso: $0 DATASET [DATASET]...">&2; && exit 1; }
for DATASET in $*
do
        echo "Begin tests with dataset $DATASET"
        python3 quickautoml/quickautoml_test.py $DATASET
done


