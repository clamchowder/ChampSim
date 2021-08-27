#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage: ./fullrun.sh [BINARY] [OPTION]"
    exit 1
fi

TRACE_DIR=$PWD/dpc3_traces
BINARY=${1}
N_WARM=20
N_SIM=1000
OPTION=${2}

# Sanity check
if [ -z $TRACE_DIR ] || [ ! -d "$TRACE_DIR" ] ; then
    echo "[ERROR] Cannot find a trace directory: $TRACE_DIR"
    exit 1
fi

if [ ! -f "bin/$BINARY" ] ; then
    echo "[ERROR] Cannot find a ChampSim binary: bin/$BINARY"
    exit 1
fi

re='^[0-9]+$'
if ! [[ $N_WARM =~ $re ]] || [ -z $N_WARM ] ; then
    echo "[ERROR]: Number of warmup instructions is NOT a number" >&2;
    exit 1
fi

re='^[0-9]+$'
if ! [[ $N_SIM =~ $re ]] || [ -z $N_SIM ] ; then
    echo "[ERROR]: Number of simulation instructions is NOT a number" >&2;
    exit 1
fi

mkdir -p results_${BINARY}
rm results_${BINARY}/*

echo $TRACE_DIR

for TRACE in ${TRACE_DIR}/*
do
    TRACENAME=`basename "$TRACE"`
    echo $TRACENAME
    (./bin/${BINARY} -warmup_instructions ${N_WARM}000000 -simulation_instructions ${N_SIM}000000 ${OPTION} -traces ${TRACE_DIR}/${TRACENAME}) &> results_${BINARY}/${TRACENAME} &
done

# wait for background jobs to finish
wait $(jobs -rp)

cd results_${BINARY} 
grep "CPU 0 cumulative IPC" *
grep "LLC HITRATE" *
