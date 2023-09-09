#!/bin/sh


make -f validate EXTRA_NVCCFLAGS=-DBLOCKS=$1
./min_sum
