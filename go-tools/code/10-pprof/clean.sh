#!/bin/bash

set -e

rm -f cpuprofile_*.out *.txt
rm -f nohup.out
rm -f mypkg.test
pkill go pprof
