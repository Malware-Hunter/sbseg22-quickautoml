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
$PIP install -q pandas scikit-learn 
echo Done

echo Installing auto-sklearn...
python3 -m venv env-auto-sklearn
PIP=./env-auto-sklearn/bin/pip3

$PIP install -q setuptools wheel
$PIP install -q auto-sklearn
$PIP install -q pandas scikit-learn
echo Done

echo Installing quickautoml...

github_update_repo() {
    CHECK_GIT=$(which git)
    [ "$CHECK_GIT" != "" ] || { printf "\nERRO: instale o \"git\" primeiro (e.g., sudo apt -y install git)\n\n"; exit 1; }
    if [ ! -d $1 ] 
    then
        # [IMPORTANTE]
        # Clonar com HTTPS para não precisar usar credenciais 
        git clone https://github.com/Malware-Hunter/$1.git
        ( cd $1; git config pull.rebase false; )
    else 
        pushd $1
        git pull
        popd
    fi
}

github_update_repo quickautoml
cp ./quickautoml_test.py quickautoml
cd quickautoml
sh distribute.sh
python3 quickautoml_test.py
