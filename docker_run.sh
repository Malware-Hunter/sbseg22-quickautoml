#!/bin/bash

[[ $1 && $2 && -f $2 && $3 && -f $3 ]] || { echo "Uso: $0 <volume> <run_script.sh> <dataset1> <dataset2> ... <datasetN>

    exemplo: $0 shared_volume run_quick.sh datasets/androcrawl_limpo.csv">&2; exit 1; }

VOLUME=$1
VOLUME_PATH=`docker volume inspect $VOLUME | awk '/Mountpoint/ {print $2}' | sed 's/[",]//g'`
[[ $VOLUME_PATH != "" ]] || { echo "Crie o volume '$VOLUME' primeiro: docker volume create $VOLUME"; exit 1; }
shift

SCRIPT=$1
shift 
DATASETS=$(echo $* | sed 's/ /-/g;s/\//-/g')
TS=$(date +%Y%m%d%H%M%S)
CONTAINER_DIR="/home/automl"
{ time sudo docker run -it -v $VOLUME:$CONTAINER_DIR automl /bin/bash -c "bash $CONTAINER_DIR/$SCRIPT $*"; } 2> time-$SCRIPT-$DATASETS-$TS.txt

echo "Diretório local que é compartilhado com o container:
$VOLUME_PATH"
