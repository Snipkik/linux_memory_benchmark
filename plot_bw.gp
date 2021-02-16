set term png size 1900,1000 enhanced font "Terminal,10"

set grid

set auto x

set key left top

set title "Intel(R) Core(TM) i5-7300HQ bandwidth (in GiB/s) for a '".dir."' benchmark on a single array"

set xlabel "Benchmark variants"
set ylabel "Bandwidth in GiB/s (higher is better)

set style data histogram
set style fill solid border -1
set boxwidth 0.9

set xtic rotate by -45 scale 0

set multiplot layout 2, 2 rowsfirst

set yrange [0:150]

set title "L1 cache"
  plot dir."/".bench_name."_L1.dat" u 4:xtic(1) t "Intel(R) Core(TM) i5-7300HQ"

set title "L2 cache"
  plot dir."/".bench_name."_L2.dat" u 4:xtic(1) t "Intel(R) Core(TM) i5-7300HQ"

set title "L3 cache"
  plot dir."/".bench_name."_L3.dat" u 4:xtic(1) t "Intel(R) Core(TM) i5-7300HQ"

#set title "DRAM"
#  plot dir."/".bench_name."_RAM.dat" u 4:xtic(1) t "Intel(R) Core(TM) i5-7300HQ"

unset multiplot
