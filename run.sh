#!/bin/bash

TPOT_PYTHON=./env-tpot/bin/python3
AUTOGLUON_PYTHON=./env-autogluon/bin/python3
AUTO_SKLEARN_PYTHON=./env-auto-sklearn/bin/python3 
if ! [[ -f $TPOT_PYTHON ]] || ! [[ -f $AUTOGLUON_PYTHON ]] || ! [[ -f $AUTO_SKLEARN_PYTHON ]] 
then
	echo "Can't find virtual environments, please make sure to run the build script first"
	exit 1
fi

echo Begin tests
$TPOT_PYTHON tpot_test.py > results-tpot.txt
$AUTOGLUON_PYTHON auto_gluon.py > results-autogluon.txt
$AUTO_SKLEARN_PYTHON auto_sklearn.py > results-auto-sklearn.txt



