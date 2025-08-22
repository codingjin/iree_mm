#!/bin/bash

echo "Case 1"
# -1
./run_multithread.sh 4095 127 4095
# Standard
./run_multithread.sh 4096 128 4096
# +1
./run_multithread.sh 4097 129 4097




echo "Case 2"
./run_multithread.sh 127 8191 4095

./run_multithread.sh 128 8192 4096

./run_multithread.sh 129 8193 4097




echo "Case 3"
./run_multithread.sh 127 4095 8191

./run_multithread.sh 128 4096 8192

./run_multithread.sh 129 4097 8193




echo "Case 4"
./run_multithread.sh 4095 4095 4095

./run_multithread.sh 4096 4096 4096

./run_multithread.sh 4097 4097 4097

