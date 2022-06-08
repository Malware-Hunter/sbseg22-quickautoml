#!/bin/bash

[[ $1 && $2 && -f $2 && $3 && -f $3 ]] || { echo "Uso: $0 <shared-dir> <run_script.sh> <dataset1> <dataset2> ... <datasetN>

    exemplo: $0 /home/<user>/shared-dir run_quick.sh datasets/androcrawl_limpo.csv">&2; exit 1; }

SHARED_DIR=$1
[[ -d $SHARED_DIR && `echo $SHARED_DIR | grep -o '^/'` == "/"  ]] || { echo "$SHARED_DIR deve ser um caminho absoluto para um diretório existente"; exit 1; }
shift

SCRIPT=$1
shift 
DATASETS=$(echo $* | sed 's/ /-/g;s/\//-/g')
TS=$(date +%Y%m%d%H%M%S)
CONTAINER_DIR="/home/automl"
{ time sudo docker run -it -v $SHARED_DIR:$CONTAINER_DIR automl /bin/bash -c "bash $CONTAINER_DIR/$SCRIPT $*"; } 2> time-$SCRIPT-$DATASETS-$TS.txt