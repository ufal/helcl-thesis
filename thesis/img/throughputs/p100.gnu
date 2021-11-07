#set term png
set term lua tikz latex size 13.5,8
set output "p100.tex"

# set bmargin 3.2
# set lmargin 4
# set rmargin 1
# set tmargin 0

path = "p100.tsv"
set datafile separator "\t"
set key inside right top vertical spacing 1.5 sample 1 autotitle columnhead
set logscale x 2

set xlabel "Batch size"
set xrange [1:128]

set decimal locale
set format "%'.0f"
set ylabel "Decoding time (seconds)" offset -1.5

plot path using 1:2 with linespoints lw 2.5 lt rgb "#cc0000", \
     path using 1:3 with linespoints lw 2.5 lt rgb "#ffcc00" , \
     path using 1:4 with linespoints lw 2.5 lt rgb "#cc00ff", \
     path using 1:5 with linespoints lw 2.5 lt rgb "#0000cc", \
     path using 1:6 with linespoints lw 2.5 lt rgb "#00cc00"