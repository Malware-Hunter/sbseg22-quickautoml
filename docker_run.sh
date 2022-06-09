#!/bin/bash

[[ $1 && $2 && -f $2 && $3 ]] || { echo "Uso: $0 output-dir-1 <run_script.sh> <dataset1> <dataset2> ... <datasetN>

    exemplo: $0 output-dir-1 run_quick.sh datasets/androcrawl_limpo.csv">&2; exit 1; }

SHARED_DIR=$1
[ -d $SHARED_DIR ] || { mkdir -p $SHARED_DIR; }
shift

SCRIPT=$1
shift 
DATASETS=$(echo $* | sed 's/ /-/g;s/\//-/g')
TS=$(date +%Y%m%d%H%M%S)
CONTAINER_DIR="/main"
{ time sudo docker run -it -v $SHARED_DIR:$CONTAINER_DIR/results automl /bin/bash -c "bash $CONTAINER_DIR/$SCRIPT $*"; } 2> time-$SCRIPT-$DATASETS-$TS.txt
