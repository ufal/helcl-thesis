set term lua tikz latex createstyle size 9,7

set output "speed.tex"
set datafile separator "\t"

set bmargin 3.2
set lmargin 5
set rmargin 1
set tmargin 0

lin_ar(x) = a1*x + b1
fit lin_ar(x) 'decoding_speed.txt' u 1:2 via a1, b1

lin_nar(x) = a2*x + b2
fit lin_nar(x) 'decoding_speed.txt' u 1:3 via a2, b2

set key inside right center vertical spacing 1.5 sample 0

set ylabel "Latency (seconds)" offset -1.5
set yrange [0:6]
set ytics autofreq 0, 1, 6

set xlabel "Source tokens" offset 0
set xrange [0:100]
set xtics autofreq 0, 20, 100

plot lin_ar(x) \
     linecolor rgb "#CC0000" \
     linewidth 5.5 \
     notitle, \
\
     lin_nar(x) \
     linecolor rgb "#0000CC" \
     linewidth 5.5 \
     notitle, \
     "decoding_speed.txt" \
     using 1:2 \
     title '\acs{ar}' \
     with points linecolor rgb "#DD0000" \
     linewidth 0.8, \
\
     "" \
     using 1:3 \
     with points linecolor rgb "#0000DD" \
     lt 1 linewidth 0.8 \
     title '\acs{nar}'
