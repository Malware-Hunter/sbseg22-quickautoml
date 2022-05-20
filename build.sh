#!/bin/bash
echo Installing TPOT...
python3 -m venv env-tpot

PIP=./env-tpot/bin/pip3
$PIP install setuptools wheel
$PIP install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu
# TO DO: instalar demais dependencias
echo Done

echo Installing autogluon
python3 -m venv env-autogluon

PIP=./env-autogluon/bin/pip3
$PIP install setuptools wheel
# TO DO: instalar demais dependencias

echo Done

echo Installing auto-sklearn
python3 -m venv env-auto-sklearn

PIP=./env-auto-sklearn/bin/pip3
$PIP install setuptools wheel
# TO DO: instalar demais dependencias


