set term lua tikz latex size 9,7

set output "speed.tex"
set datafile separator "\t"

set bmargin 3.2
set lmargin 5
set rmargin 1
set tmargin 0

lin_nar(x) = a1*x + b1
fit lin_nar(x) 'decoding_speed.tsv' u 1:2 via a1, b1

lin_ours(x) = a2*x + b2
fit lin_ours(x) 'decoding_speed.tsv' u 1:3 via a2, b2

lin_ar_greedy(x) = a3*x + b3
fit lin_ar_greedy(x) 'decoding_speed.tsv' u 1:4 via a3, b3

set key inside right center vertical spacing 1.5 sample 0

set ylabel "Latency (seconds)" offset -1.5
set yrange [0:5]
set ytics autofreq 0, 1, 5

set xlabel "Source tokens" offset 0
set xrange [0:60]
set xtics autofreq 0, 10, 60

plot lin_nar(x) \
     linecolor rgb "#0000CC" \
     linewidth 5.5 \
     notitle, \
\
     lin_ours(x) \
     linecolor rgb "#00CC00" \
     linewidth 5.5 \
     notitle, \
\
     lin_ar_greedy(x) \
     linecolor rgb "#CC0000" \
     linewidth 5.5 \
     notitle, \
\
     "decoding_speed.tsv" \
     using 1:4 \
     title '\acs{ar}' \
     with points linecolor rgb "#DD0000" \
     lt 3 linewidth 0.8, \
\
     "decoding_speed.tsv" \
     using 1:2 \
     title '\acs{nar}' \
     with points linecolor rgb "#0000DD" \
     lt 1 linewidth 0.8, \
\
     "decoding_speed.tsv" \
     using 1:3 \
     title '\acs{nar}+\acs{lm}' \
     with points linecolor rgb "#00DD00" \
     lt 2 linewidth 0.8
