#!/bin/bash
echo Installing TPOT...
python3 -m venv env-tpot
PIP=./env-tpot/bin/pip3

$PIP install -q setuptools wheel
$PIP install -q torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu
$PIP install -q numpy scipy scikit-learn pandas joblib 
$PIP install -q deap update_checker tqdm stopit xgboost
$PIP install -q tpot
echo Done

echo Installing autogluon...
python3 -m venv env-autogluon
PIP=./env-autogluon/bin/pip3

$PIP install -q setuptools wheel
$PIP install -q torch==1.10.1+cpu -f https://download.pytorch.org/whl/cpu/torch_stable.html
$PIP install -q autogluon.tabular
echo Done

echo Installing auto-sklearn...
python3 -m venv env-auto-sklearn
PIP=./env-auto-sklearn/bin/pip3

$PIP install -q setuptools wheel
$PIP install -q auto-sklearn
echo Done

