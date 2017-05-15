//Histogramme 3D - OK
clf()
hist3d(10*rand(10,10));
xtitle("Burndown non normalisé")
f=get("current_figure");
f.color_map=jetcolormap(64);
f.figure_size=[600,300];
xs2png(0,'Project.png')
exit
