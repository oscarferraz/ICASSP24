#!/bin/sh

make -f print

for i in {1..20}
do
    sleep 1
   ./min_sum

done

rm GPU_min_sum_equations_and_decision.txt
rm GPU_min_sum_sindrome.txt
rm GPU_min_sum_bar.txt
rm HtoD.txt
rm DtoH.txt

make

for i in {1..20}
do
    sleep 1
    /usr/local/cuda-10.2/bin/nvprof --log-file profiler_GPU.log ./min_sum
    grep -F "GPU_min_sum_equations_and_decision" profiler_GPU.log >> GPU_min_sum_equations_and_decision.txt
    grep -F "GPU_min_sum_sindrome" profiler_GPU.log >> GPU_min_sum_sindrome.txt
    grep -F "GPU_min_sum_bar" profiler_GPU.log >> GPU_min_sum_bar.txt
    grep -F "[CUDA memcpy HtoD]" profiler_GPU.log >> HtoD.txt
    grep -F "[CUDA memcpy DtoH]" profiler_GPU.log >> DtoH.txt
done