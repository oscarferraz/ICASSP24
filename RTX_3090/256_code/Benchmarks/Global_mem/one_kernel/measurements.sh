#!/bin/sh

make -f print

for i in {1..20}
do
    sleep 1
   ./min_sum
    
done

rm profiler_GPU.log
rm GPU_min_sum.txt
rm memset.txt
rm HtoD.txt
rm DtoH.txt


make

for i in {1..20}
do
    sleep 1
    /usr/local/bin/nsys nvprof ./min_sum >> profiler_GPU.log
    sudo rm report*

done

    grep -F "GPU_min_sum" profiler_GPU.log >> GPU_min_sum.txt
    grep -F "[CUDA memset]" profiler_GPU.log >> memset.txt
    grep -F "[CUDA memcpy HtoD]" profiler_GPU.log >> HtoD.txt
    grep -F "[CUDA memcpy DtoH]" profiler_GPU.log >> DtoH.txt