# set term png
# set output "noam.png"
set term lua tikz latex size 11.5,6
set output "noam.tex"

set xrange [0:100000]
set yrange [0:0.0005]

set format y "%.0t$\\cdot$10\\textsuperscript{%T}"
set ylabel 'Learning rate $\alpha$' offset -1
set xlabel 'Training step' offset -1

set xtics rotate by 45 right
set format x "%.0s%c"

# IN THE GENERATED TEX FILE, I CHANGED Y-AXIS TO 0 IN THE TRAINING STEP NODE
# ALSO I DELETED THE ZERO YTICK label

set key inside right top vertical spacing 1.5 sample 1

d=512
w=16000

min(x,y) = (x < y) ? x : y
noam(x) = d ** (-0.5) * min(x ** (-0.5), x * (w ** (-1.5)))


plot d=512 w=8000 noam(x) title '$d=512$, $w=8000$' lw 2.5 lt rgb "#cc0000", \
     d=512 w=16000 noam(x) title '$d=512$, $w=16000$' lw 2.5 lt rgb "#ffcc00", \
     d=1024 w=8000 noam(x) title '$d=1024$, $w=8000$' lw 2.5 lt rgb "#cc00ff", \
     d=768 w=32000 noam(x) title '$d=768$, $w=32000$' lw 2.5 lt rgb "#0000cc"
