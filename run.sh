#!/bin/bash

TPOT_PYTHON=./env-tpot/bin/python3
AUTOGLUON_PYTHON=./env-autogluon/bin/python3
AUTO_SKLEARN_PYTHON=./env-auto-sklearn/bin/python3 
if ! [[ -f $TPOT_PYTHON ]] || ! [[ -f $AUTOGLUON_PYTHON ]] || ! [[ -f $AUTO_SKLEARN_PYTHON ]]
then
        echo "Can't find virtual environments, please make sure to run the build script first"
        exit 1
fi

[[ $1 ]] && [[ -f $1 ]] || echo "Uso: $0 DATASET [DATASET]..."

for DATASET in $*
do
        echo "Begin tests with dataset $DATASET"
        ## TO DO: passar o dataset como argumento para tpot_test.py; o script deve ser modificado para aceitar o parametro como os demais
        $TPOT_PYTHON tpot_test.py > results-tpot.txt
        $AUTOGLUON_PYTHON auto_gluon.py $DATASET
        $AUTO_SKLEARN_PYTHON auto_sklearn.py $DATASET
done


