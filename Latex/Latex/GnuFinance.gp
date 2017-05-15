set label 1 "Acme Widgets" at graph 0.5, graph 0.9 center front
set label 2 "Courtesy of Bollinger Capital" at graph 0.01, 0.07
set label 3 "  www.BollingerBands.com" at graph 0.01, 0.03
set logscale y
set yrange [75:105]
set ytics (105, 100, 95, 90, 85, 80)
set xrange [50:253]
set grid
set lmargin 9
set rmargin 2
set format x ""
set xtics (66, 87, 109, 130, 151, 174, 193, 215, 235)
set terminal png size 2000,1500 enhanced font "Helvetica,20"
set output 'Finance.png'
set multiplot
set title "Change to Bollinger Boxes"
set size 1, 0.7
set origin 0, 0.3
set bmargin 0
set ylabel "price" offset 1
plot 'finance.dat' using 0:3:3:($2>$5?$2:$5):($2>$5?$2:$5) notitle with candlesticks lt 3, \
'finance.dat' using 0:($2<$5?$5:1/0):($2<$5?$5:1/0):($2<$5?$2:1/0):($2<$5?$2:1/0) notitle with candlesticks lt 2, \
'finance.dat' using 0:($2>$5?$2:1/0):($2>$5?$2:1/0):($2>$5?$5:1/0):($2>$5?$5:1/0) notitle with candlesticks lt 1, \
'finance.dat' using 0:($2<$5?$2:$5):($2<$5?$2:$5):4:4 notitle with candlesticks lt 3, \
'finance.dat' using 0:9 notitle with lines lt 3, \
'finance.dat' using 0:10 notitle with lines lt 1, \
'finance.dat' using 0:11 notitle with lines lt 2, \
'finance.dat' using 0:8 axes x1y2 notitle with lines lt 4
unset label 1
unset label 2
unset label 3
unset title
set bmargin
set format x
set size 1.0, 0.3
set origin 0.0, 0.0
set tmargin 0
unset logscale y
set autoscale y
set format y "%1.0f"
set ytics 500
set xtics ("6/03" 66, "7/03" 87, "8/03" 109, "9/03" 130, "10/03" 151, "11/03" 174, "12/03" 193, "1/04" 215, "2/04" 235)
set ylabel "volume (0000)" offset 1
plot 'finance.dat' using 0:($6/10000) notitle with impulses lt 3, \
'finance.dat' using 0:($7/10000) notitle with lines lt 1
unset multiplot
set output