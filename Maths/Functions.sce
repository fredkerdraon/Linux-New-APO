///Pour faire une intégration de fontion
x0=-2.58;x1=2.58:1:0;
X=integrate('1/sqrt(2*%pi)*exp(-1*(x^2)/2)','x',x0,x1);
X;

x0=0;x1=0:0.1:2*%pi;
X=integrate('sin(x)','x',x0,x1);
norm(cos(x1)-(1-X))

x1=-10:0.1:10;
X=integrate(['if x==0 then 1,';
             'else sin(x)/x,end'],'x',0,x1)

//Histogramme 3D - OK
clf()
hist3d(10*rand(10,10));
xtitle("l''histogramme non normalisé")
f=get("current_figure");
f.figure_size=[600,300];
xs2png(0,'Histo3D.png')

//Surface 3D - OK
deff('z=f(x,y)','z=x^4-y^4')
x=-3:0.2:3 ;y=x ;
clf() ;fplot3d1(x,y,f,alpha=5,theta=31)
xtitle("l''histogramme non normalisé")
xs2png(0,'Surface3D.png')

//Milk drop plot - OK
x=-2:0.1:2; y=x;
z=eval3d(milk_drop,x,y);
clf();
plot3d(x,y,z)
xs2png(0,'MilkDrop.png')

//Racine d'une fonction - OK?
function y=f(x),y=x-cos(x),endfunction;x=fsolve(0,f);
function y=f(x),y=(x^3+3*x+8,endfunction;x=fsolve(0,f);
x = [-10:0.01:10]';
plot(x,f);
y=fsolve(0,f);

//Example de subplot - OK ;-)
x=binomial(0.6,20);
clf();
subplot(121);
plot2d3(0:20,x);
subplot(122);
bar(0:20,x)
xs2png(0,'ExampleSubplot.png')
exit
