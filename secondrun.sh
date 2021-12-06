#!/bin/bash
#find srv_traces -name 'srv*' | xargs -n 1 -P 32 ./singlerun.sh 8m_l3
#find srv_traces -name 'srv*' | xargs -n 1 -P 32 ./singlerun.sh 16m_l3
#find srv_traces -name 'srv*' | xargs -n 1 -P 32 ./singlerun.sh 32m_l3
#find srv_traces -name 'srv*' | xargs -n 1 -P 32 ./singlerun.sh 96m_l3

#find dpc3_traces -name '*' | xargs -n 1 -P 32 ./singlerun.sh zen3_16kpage
#find dpc3_traces -name '*' | xargs -n 1 -P 32 ./singlerun.sh zen3_3200mhz
#find dpc3_traces -name '*' | xargs -n 1 -P 32 ./singlerun.sh m1
#find dpc3_traces -name '*' | xargs -n 1 -P 32 ./singlerun.sh m1core_zen3cache

find dpc3_traces -name '*' | xargs -n 1 -P 32 ./singlerun.sh glc 
find clamtraces -name '*' | xargs -n 1 -P 32 ./singlerun.sh glc 
find dpc3_traces -name '*' | xargs -n 1 -P 32 ./singlerun.sh glc_32k
find clamtraces -name '*' | xargs -n 1 -P 32 ./singlerun.sh glc_32k 
