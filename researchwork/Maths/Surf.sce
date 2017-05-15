[x,y]=meshgrid(-2:.15:2,-2:.15:2);
z=x .*exp(-(x.^2+y.^2));
surf(x,y,z);
f=get("current_figure");
f.color_map=jetcolormap(64);
f.figure_size=[400,400];
xs2png(0,'Surf.png');
