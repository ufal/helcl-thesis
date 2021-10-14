set term lua tikz latex size 13.5,8
set output "de-en.curves.tex"

# set term png
# set output "curves.png"

### WARNING, THIS GENERATES E.G. 800.0k, WHICH I CHANGED MANUALLY IN THE
### GENERATED TEX FILE
### ALSO I MOVED THE X AXIS LABEL BY .250 UP

set bmargin -1
# set rmargin 1
# set tmargin 0
# set lmargin 5

set datafile separator "\t"

set ylabel '\acs{bleu}' offset -1.5
set yrange [15:45]

set xlabel "Number of updates" offset 0,-1
set xtics rotate by 45 right
set format x "%.1s%c"

set key inside right bottom vertical spacing 1.5 sample 1

plot "de-en.scores.tsv" using 1:2 title "large" with lines lw 2.5 lt rgb "#cc0000",\
     "de-en.scores.tsv" using 1:3 title "base" with lines lw 2.5 lt rgb "#ffcc00", \
     "de-en.scores.tsv" using 1:4 title "small" with lines lw 2.5 lt rgb "#cc00ff", \
     "de-en.scores.tsv" using 1:5 title "micro" with lines lw 2.5 lt rgb "#0000cc", \
     "de-en.scores.tsv" using 1:6 title "tiny" with lines lw 2.5 lt rgb "#00cc00",