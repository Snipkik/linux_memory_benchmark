#!/bin/bash
source colors.sh

#
CORE_ID=3
#cpupower -c $CORE_ID frequency-set -f 2.50GHz --governor performance

#execute makefile
echo -e "${lightPurple}Compilation des fichiers ${neutral}"
for makefile in `find -name "makefile"`; do
  folder=$(dirname $makefile)

  #make clean -C ./$folder
  make all -C ./$folder
done

#generate benchmark
echo -e "\n${lightPurple}Execution des benchmarks${neutral}"
for executable in `find . -type f -executable -name "*_*"`; do
  folder=$(dirname $executable)
  bench_name=$(basename $executable)

  #L1_cache
  taskset -c $CORE_ID $executable $(( 24 * 2**10 )) 1000 | cut -d';' -f1,8,9 > ${folder}/${bench_name}_L1.dat
  echo -e "[${lightGreen}${bench_name}_L1.dat${neutral}] Compilation terminée"

  #L2_cache
  taskset -c $CORE_ID $executable $(( 200 * 2**10 )) 1000 | cut -d';' -f1,8,9 > ${folder}/${bench_name}_L2.dat
  echo -e "[${lightGreen}${bench_name}_L2.dat${neutral}] Compilation terminée"

  #L3_cache
  taskset -c $CORE_ID $executable $(( 1000 * 2**10 )) 1000 | cut -d';' -f1,8,9 > ${folder}/${bench_name}_L3.dat
  echo -e "[${lightGreen}${bench_name}_L3.dat${neutral}] Compilation terminée"

  #RAM
  #taskset -c $CORE_ID $executable $(( 7000 * 2**10 )) 1000 | cut -d';' -f1,8,9 > ${folder}/${bench_name}_RAM.dat
  #echo -e "[${lightGreen}${bench_name}_RAM.dat${neutral}] Compilation terminée"
done



#generate charts
echo -e "\n${lightPurple}Création des graphiques${neutral}"
for bench in `find . -type f -executable -name "*_*"`; do
  folder=$(dirname $bench)
  bench_name=$(basename $bench)

  echo -e "[${lightGreen}${bench_name}.png${neutral}] création terminée"
  gnuplot -e "dir='$folder' ; bench_name='$bench_name'" ./plot_bw.gp > ${folder}/${bench_name}.png
done
