set term x11 persist
set key left bottom
set ylabel "y"
set xlabel "x"
set grid xtics ytics

plot    'extendedVortex500Samples_theta.txt' w p  pt 5  title 'theta', \
        'extendedVortex500Samples_sensors.txt' w p pt 5 title 'sensors'
