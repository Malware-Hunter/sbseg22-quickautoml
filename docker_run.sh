#!/bin/bash

[[ $1 && -f $1 && $2 ]] || { echo "Uso: $0 <run_script.sh> <dataset1> <dataset2> ... <datasetN>

    exemplo: $0 run_quick.sh datasets/androcrawl_limpo.csv">&2; exit 1; }

SCRIPT=$1
shift 
DATASETS=$(echo $* | sed 's/ /-/g;s/\//-/g')
TS=$(date +%Y%m%d%H%M%S)
CONTAINER_DIR="/home/automl"
CONTAINER_NAME="container-$SCRIPT-$DATASETS-$TS"
echo "Nome do container: $CONTAINER_NAME"
{ time sudo docker run --name $CONTAINER_NAME -it automl /bin/bash -c "bash $CONTAINER_DIR/$SCRIPT $*"; } 2> time-$SCRIPT-$DATASETS-$TS.txt