#!/bin/sh

routine1(){
echo $@
bash validate.sh $1 > validate_report.txt

tail -n +4 validate_report.txt > aux.txt

if cmp -s "aux.txt"  "/home/nvidia/ICASSP24/${1}.txt"; then
    echo -e "VALIDATION PASSED" > rep.txt
    bash measurements.sh $1 > measurements_report.txt

    ##############################################################
    grep -F "Execution time" measurements_report.txt | awk '{print $4}' > values.txt
    
    targets=($(awk '{print $2}' GPU_min_sum.txt | tr -d ','))
    rm aux2.txt
    for n in "${targets[@]}"; do
        bc <<<"scale=12; $n/1000000" >> aux2.txt
    done
    awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
    mv values2.txt values.txt
    


    ###############################################################
    targets=($(awk '{print $2}' HtoD.txt | awk 'NR%2==1' | tr -d ','))
    rm aux2.txt
    for n in "${targets[@]}"; do
        bc <<<"scale=12; $n/1000000" >> aux2.txt
    done
    awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
    mv values2.txt values.txt


    # ###############################################################
    targets=($(awk '{print $2}' DtoH.txt | awk 'NR%2==1' | tr -d ','))
    rm aux2.txt
    for n in "${targets[@]}"; do
        bc <<<"scale=12; $n/1000000" >> aux2.txt
    done
    awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
    mv values2.txt values.txt

    rm aux.txt
    rm aux2.txt
    col=$(awk '{print NF}' values.txt | sort -nu | tail -n 1)
    if [ "$col" -eq 4 ]; then
        echo -e "MEASUREMENTS PASSED" >> rep.txt
    else
        echo -e "MEASUREMENTS FAILED" >> rep.txt
    fi

else
    echo -e "VALIDATION FAILED" > rep.txt
fi

}

routine2(){
echo $@
bash validateb.sh $1 > validate_report.txt

tail -n +5 validate_report.txt > aux.txt

if cmp -s "aux.txt"  "/home/nvidia/ICASSP24/${2}.txt"; then
     echo -e "VALIDATION PASSED" > rep.txt
     bash measurements.sh $1 > measurements_report.txt

    ##############################################################
    grep -F "Execution time" measurements_report.txt | awk '{print $4}' > values.txt
    
    targets=($(awk '{print $2}' GPU_min_sum.txt | tr -d ','))
    rm aux2.txt
    for n in "${targets[@]}"; do
        bc <<<"scale=12; $n/1000000" >> aux2.txt
    done
    awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
    mv values2.txt values.txt


   ###############################################################
    targets=($(awk '{print $2}' HtoD.txt | awk 'NR%2==1' | tr -d ','))
    rm aux2.txt
    for n in "${targets[@]}"; do
        bc <<<"scale=12; $n/1000000" >> aux2.txt
    done
    awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
    mv values2.txt values.txt


    # ###############################################################
    targets=($(awk '{print $2}' DtoH.txt | awk 'NR%2==1' | tr -d ','))
    rm aux2.txt
    for n in "${targets[@]}"; do
        bc <<<"scale=12; $n/1000000" >> aux2.txt
    done
    awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
    mv values2.txt values.txt
    rm aux.txt
    rm aux2.txt
    col=$(awk '{print NF}' values.txt | sort -nu | tail -n 1)
    if [ "$col" -eq 4 ]; then
        echo -e "MEASUREMENTS PASSED" >> rep.txt
    else
        echo -e "MEASUREMENTS FAILED" >> rep.txt
    fi
    mv rep.txt report${1}.txt
    mv values.txt values${1}.txt

else
    echo -e "VALIDATION FAILED" > rep.txt
fi

}

cd /home/nvidia/ICASSP24/64_code/Benchmarks/Shared_mem/one_kernel/
routine1 64
cd /home/nvidia/ICASSP24/64_code/multiple_blocks/
routine2 128 64
routine2 524288 64

cd /home/nvidia/ICASSP24/128_code/Benchmarks/Shared_mem/one_kernel/
routine1 128
cd /home/nvidia/ICASSP24/128_code/multiple_blocks/
routine2 64 128
routine2 262144 128

cd /home/nvidia/ICASSP24/256_code/Benchmarks/Shared_mem/one_kernel/
routine1 256
cd /home/nvidia/ICASSP24/256_code/multiple_blocks/
routine2 32 256
routine2 131072 256



