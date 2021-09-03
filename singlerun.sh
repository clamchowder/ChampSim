#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage: ./fullrun.sh [BINARY] [OPTION]"
    exit 1
fi

BINARY=${1}
TRACE=${2}
N_WARM=20
N_SIM=1000

mkdir -p results_${BINARY}

TRACENAME=`basename "$TRACE"`
echo $TRACENAME
(./bin/${BINARY} -warmup_instructions ${N_WARM}000000 -simulation_instructions ${N_SIM}000000 ${OPTION} -traces ${TRACE}) &> results_${BINARY}/${TRACENAME} 

