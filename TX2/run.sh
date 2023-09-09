#!/bin/sh

routine1(){
echo $@
bash validate.sh $1 > validate_report.txt

tail -n +4 validate_report.txt > aux.txt

if cmp -s "aux.txt"  "$HOME/ICASSP24/${1}.txt"; then
     echo -e "VALIDATION PASSED" > report.txt
     bash measurements.sh $1 > measurements_report.txt

    ##############################################################
    grep -F "Execution time" measurements_report.txt | awk '{print $4}' > values.txt
    if awk '{print $4}' GPU_min_sum.txt | grep -q 'ns'; then
        echo "matched ns"
        targets=($(awk '{print $4}' GPU_min_sum.txt | grep 'ns' | tr -d 'ns'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n/1000000" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    elif awk '{print $4}' GPU_min_sum.txt | grep -q 'us'; then
        echo "matched us"
        targets=($(awk '{print $4}' GPU_min_sum.txt | grep 'us' | tr -d 'us'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n/1000" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    elif awk '{print $4}' GPU_min_sum.txt | grep -q 'ms'; then
        echo "matched ms"
        targets=($(awk '{print $4}' GPU_min_sum.txt | grep 'ms' | tr -d 'ms'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    fi


    ###############################################################
    if awk '{print $2}' HtoD.txt | grep -q 'ns'; then
        echo "matched ns"
        targets=($(awk '{print $2}' HtoD.txt | grep 'ns' | tr -d 'ns'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n/1000000" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    elif awk '{print $2}' HtoD.txt | grep -q 'us'; then
        echo "matched us"
        targets=($(awk '{print $2}' HtoD.txt | grep 'us' | tr -d 'us'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n/1000" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    elif awk '{print $2}' HtoD.txt | grep -q 'ms'; then
        echo "matched ms"
        targets=($(awk '{print $2}' HtoD.txt | grep 'ms' | tr -d 'ms'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    fi

    ###############################################################
    if awk '{print $2}' DtoH.txt | grep -q 'ns'; then
        echo "matched ns"
        targets=($(awk '{print $2}' DtoH.txt | grep 'ns' | tr -d 'ns'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n/1000000" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    elif awk '{print $2}' DtoH.txt | grep -q 'us'; then
        echo "matched us"
        targets=($(awk '{print $2}' DtoH.txt | grep 'us' | tr -d 'us'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n/1000" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    elif awk '{print $2}' DtoH.txt | grep -q 'ms'; then
        echo "matched ms"
        targets=($(awk '{print $2}' DtoH.txt | grep 'ms' | tr -d 'ms'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    fi
    rm aux.txt
    rm aux2.txt
    col=$(awk '{print NF}' values.txt | sort -nu | tail -n 1)
    if [ "$col" -eq 4 ]; then
        echo -e "MEASUREMENTS PASSED" >> report.txt
    else
        echo -e "MEASUREMENTS FAILED" >> report.txt
    fi

else
    echo -e "VALIDATION FAILED" > report.txt
fi

}

routine2(){
echo $@
bash validateb.sh $1 > validate_report.txt

tail -n +5 validate_report.txt > aux.txt

if cmp -s "aux.txt"  "$HOME/ICASSP24/${2}.txt"; then
     echo -e "VALIDATION PASSED" > report.txt
     bash measurements.sh $1 > measurements_report.txt

    ##############################################################
    grep -F "Execution time" measurements_report.txt | awk '{print $4}' > values.txt
    if awk '{print $4}' GPU_min_sum.txt | grep -q 'ns'; then
        echo "matched ns"
        targets=($(awk '{print $4}' GPU_min_sum.txt | grep 'ns' | tr -d 'ns'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n/1000000" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    elif awk '{print $4}' GPU_min_sum.txt | grep -q 'us'; then
        echo "matched us"
        targets=($(awk '{print $4}' GPU_min_sum.txt | grep 'us' | tr -d 'us'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n/1000" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    elif awk '{print $4}' GPU_min_sum.txt | grep -q 'ms'; then
        echo "matched ms"
        targets=($(awk '{print $4}' GPU_min_sum.txt | grep 'ms' | tr -d 'ms'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    fi


    ###############################################################
    if awk '{print $2}' HtoD.txt | grep -q 'ns'; then
        echo "matched ns"
        targets=($(awk '{print $2}' HtoD.txt | grep 'ns' | tr -d 'ns'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n/1000000" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    elif awk '{print $2}' HtoD.txt | grep -q 'us'; then
        echo "matched us"
        targets=($(awk '{print $2}' HtoD.txt | grep 'us' | tr -d 'us'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n/1000" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    elif awk '{print $2}' HtoD.txt | grep -q 'ms'; then
        echo "matched ms"
        targets=($(awk '{print $2}' HtoD.txt | grep 'ms' | tr -d 'ms'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    fi

    ###############################################################
    if awk '{print $2}' DtoH.txt | grep -q 'ns'; then
        echo "matched ns"
        targets=($(awk '{print $2}' DtoH.txt | grep 'ns' | tr -d 'ns'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n/1000000" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    elif awk '{print $2}' DtoH.txt | grep -q 'us'; then
        echo "matched us"
        targets=($(awk '{print $2}' DtoH.txt | grep 'us' | tr -d 'us'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n/1000" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    elif awk '{print $2}' DtoH.txt | grep -q 'ms'; then
        echo "matched ms"
        targets=($(awk '{print $2}' DtoH.txt | grep 'ms' | tr -d 'ms'))
        rm aux2.txt
        for n in "${targets[@]}"; do
            bc <<<"scale=12; $n" >> aux2.txt
        done
        awk 'NR==FNR{a[NR]=$0;next}{print a[FNR],$0}' values.txt aux2.txt > values2.txt
        mv values2.txt values.txt
    fi
    rm aux.txt
    rm aux2.txt
    col=$(awk '{print NF}' values.txt | sort -nu | tail -n 1)
    if [ "$col" -eq 4 ]; then
        echo -e "MEASUREMENTS PASSED" >> report.txt
    else
        echo -e "MEASUREMENTS FAILED" >> report.txt
    fi
    mv report.txt report${1}.txt
    mv values.txt values${1}.txt

else
    echo -e "VALIDATION FAILED" > report.txt
fi

}

cd $HOME/ICASSP24/64_code/Benchmarks/Shared_mem/one_kernel/
routine1 64
cd $HOME/ICASSP24/64_code/multiple_blocks/
routine2 32 64
routine2 32768 64

cd $HOME/ICASSP24/128_code/Benchmarks/Shared_mem/one_kernel/
routine1 128
cd $HOME/ICASSP24/128_code/multiple_blocks/
routine2 16 128
routine2 8192 128

cd $HOME/ICASSP24/256_code/Benchmarks/Shared_mem/one_kernel/
routine1 256
cd $HOME/ICASSP24/256_code/multiple_blocks/
routine2 8 256
routine2 2048 256



