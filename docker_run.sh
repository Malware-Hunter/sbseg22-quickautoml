#!/bin/bash

[[ $1 ]] && [[ -f $1 ]] && [[ $2 ]] && [[ -f $2 ]] || { echo "Uso: $0 <run_script.sh> <dataset1> <dataset2> ... <datasetN>"; exit; }

SCRIPT=$1
shift 
DATASETS=$(echo $* | sed 's/ /-/g')
TS=$(date +%Y%m%d%H%M%S) 
{ time sudo docker run -it automl /bin/bash -c "bash /home/automl/$SCRIPT $*"; } 2> time-$SCRIPT-$DATASETS-$TS.txt 
