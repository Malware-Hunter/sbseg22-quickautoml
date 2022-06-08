#!/bin/bash
[[ $1 ]] && [[ -f $1 ]] || echo "Uso: $0 DATASET [DATASET]...">&2 && exit 1

bash run_auto_gluon.sh $* &
bash run_auto_sklearn.sh $* &
bash run_quick.sh $* &
bash run_tpot.sh $* &
wait # The current program won't close until all above are done