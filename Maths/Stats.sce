t=[1     1     1     1
   2     3     4     5
   3     4     5     6
   4     5     6     7];

//Special case 2
// Case where only x or y is a square matrix
//x : matrix (t) and y  : vector ([1 2 3 4])
plot(t,[1 2 3 4]) // equivalent to plot(t,[1 1 1 1;2 2 2 2;3 3 3 3;4 4 4 4])
plot(t,[1;2;3;4]) // the same plot
f=get("current_figure");
f.figure_size=[600,300];
xs2png(0,'Stats.png')
exit
