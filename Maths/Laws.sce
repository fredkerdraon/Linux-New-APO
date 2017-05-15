//Poisson vs Binomiale
x = [0:0.01:10]';
f1 = gamma(100) ./ (gamma(x) .* gamma(100-x)) .* (0.05 .^ x) .* (0.95 .^(100-x) );
f2 = ( 1 ./ gamma(x) ) .* (5 .^ x) .* exp(-5);
f1 = f1 / ( sum(f1) * 0.01 );
f2 = f2 / ( sum(f2) * 0.01 );
plot(x,f1,x,f2);
xlabel('x');
ylabel('f(x)');
title('Binomial (100, 0,05) vs. Poisson (5) pdf');
xs2png(0,'BinomialevsPoisson.png')

a=exp(-0.12);

// Cumulative normal distribution 
h = scf();
Mean = [3.4 0 0 -2];
Std2 = [0.025 1.0 5.0 0.5];
cols = [1 2 3 4];
nf = size(cols,"*");
lgd = [];
for k = 1 : nf
  x = linspace(-5,5,1000);
  P=cdfnor("PQ",x,Mean(k)*ones(x),sqrt(Std2(k))*ones(x));
  plot(x,P)
  str = msprintf("Mean=%s, Std^2=%s",string(Mean(k)),string(Std2(k)));
  lgd($+1) = str;
end
for k = 1 : nf
h.children.children.children(nf - k + 1).foreground = cols(k);
end
legend(lgd);

x = cdfnor("X", 0, 1, 0.975, 0.025)

// fonction carré - KO grave!!!!!
function [y] = f(x)
    y = (1/(0.5*sqrt(2*%pi))*exp(-(x-3.4)^2/(2*.025))
endfunction
// intégrale entre 0 et 4
Y = integrate("f(x)", "x", 2.9, 3.9)
// vérification
Y1 = 4^3/3

//Poisson
x = [0:0.01:10]';
f2 = ( 1 ./ gamma(x) ) .* (5 .^ x) .* exp(-5);
f2 = f2 / ( sum(f2) * 0.01 );
plot(x,f1);
xlabel('x');
ylabel('f(x)');
title('Poisson (5) pdf');
xs2png(0,'Poisson.png')

//Simple plot de la fonction de répartition de la loi normale
clf()
plot(x, 1/sqrt(2*%pi)*exp(-1*(x^2)/2), 0.85 )
xs2png(0,'LoiNormale1.png')

//Loi binomiale 6,0.5
d = grand(1000,1,"bin", 6, 0.5);
c = linspace(-0.5,6.5,8);
clf()
subplot(2,1,1)
histplot(c, d, style=2)
xtitle("l''histogramme normalisé")
subplot(2,1,2)
histplot(c, d, normalization=%f, style=5)
xtitle("l''histogramme non normalisé")
xs2png(0,'LoiBinomiale.png')

//Binomial distribution
X = -3:0.1:3;
mu = zeros(X);
sigma = ones(X);
[P, Q] = cdfnor("PQ", X, mu, sigma);
plot(X', [P', Q'])

//Loi exponentielle
lambda = 2;
X = grand(100000,1,"exp", 1/lambda);
Xmax = max(X);
clf()
histplot(60, X, style=2)
x = linspace(0,max(Xmax),100)';
plot2d(x,lambda*exp(-lambda*x),strf="000",style=2)
legend(["histogramme d''un échantillon E(lambda)" "densité exacte"]);
xs2png(0,'LoiExponentielle.png')

//Loi gamma
N=10000;
A=10;
B=4;
R=grand(1,N,'gam',A,B); 
XS=gsort(R,"g","i")';
PS=(1:N)'/N;
P=cdfgam("PQ",XS,A*ones(XS),B*ones(XS));
clf();
plot(XS,PS,"b-"); // Empirical distribution
plot(XS,P,"r-"); // Theoretical distribution
legend(["Empirical" "Theory"]);
xs2png(0,'LoiGamma.png')

//Loi gamma 2??
clf;clc;
a=0.7 ; b=%e/(a+%e);N=10000
x=0:0.1:5
deff('y=q(x,a)','y=exp(-x)*(x<1)+x^(a-1)*(x>=1)')
deff('y=H(u,a,b)','y=(u/b)^(1/a) .*(u<b)-log((1-u)/a/b) .*(u>=b)')
subplot(1,2,1)
v=2*ones(1,N); z=ones(1,N)
for i=1:N
while(v(i)>q(z(i),a))
z(i)=H(rand(),a,b);
v(i)=rand();
end
end
histplot(x,z,style=2)
xtitle(titre)
subplot(1,2,2)
s=grand(1,N,"gam",a,1)
histplot(x,s,style=5)
titre='Loi gamma de parametres  (1,a='+string(a)+')  via grand - N='+string(N)
xtitle(titre)
xs2png(0,'LoiGamma2.png')

//Loi de poisson
// Renvoit une matrice de taille 400-par-800 de doubles aléatoires, 
// avec une distribution de Poisson de moyenne 5.
R = grand(400,800,"poi",100);
scf();
clf();
histplot(30,R);
xtitle("Nombres aléatoires (loi de Poisson) par grand","X","Fréquence");
xs2png(0,'LoiPoisson.png')

//Loi exponentielle 2
lambda=1.6;
N=100000;
X = grand(1,N,"exp",lambda);
scf();
clf();
classes = linspace(0,12,25);
histplot(classes,X)
x=linspace(0,12,25);
y = (1/lambda)*exp(-(1/lambda)*x);
plot(x,y,"ro-");
legend(["Empirique" "Theorique"]);
xtitle("Loi exponentielle par grand","X","Fréquence");
xs2png(0,'LoiExponentielle2.png')

//Loi Beta
x=linspace(-3,3);
y=cdfbet(’PQ’,x,1-x,ones(x),3*ones(x));
plot2d(x,y)

//Correlation
n = 10; // nombre de valeurs
X = 1:n; // abscisses
Y = 2*X + 5 + 3*rand(X); // ordonnées : droite "bruitée"
plot(X, Y); // tracé des données
F = eye(n, n); // couplage (x, y) : chaque couple est présent une fois, (X(i) & Y(i)) = 1, (X(i) & Y(j)) = 0
 
covariance1 = covar(X, Y, F);
covariance2 = 1/n*sum(X.*Y) - 1/n^2*sum(X)*sum(Y); // calcul "à la main" pour comparer
 
correlation1 = correl(X, Y, F);
correlation2 = covariance2/sqrt(variance(X, "*", 1))/sqrt(variance(Y, "*", 1)); // calcul "à la main"

//Lissage 1
m = 200; // nombre de points mesurés
bruit = 0.2; // amplitude du bruit
x = linspace(0, 2*%pi, m);
y = sin(x) + 0.2*rand(x, "normal"); // valeurs bruitées
// ***** Détermination de la spline *****
n = 6; // nombre de points de contrôle de la spline
xs = linspace(x(1), x($), n); // abscisse des points de contrôle
// répartition uniforme
[ys, d] = lsq_splin(x, y, xs); // détermination de la spline
// ***** Calcul des valeurs lissées de y *****
yliss = interp(x, xs, ys, d); // calcul des données lissées
// ***** Tracé *****
plot(x, y) // données originales
plot(x, yliss, "r") // données lissées

//Lissage 2
p = 10; // largeur de l'intervalle
h = 1/p*ones(1, p); // fonction porte pour le lissage
yliss = conv(h, y);
plot(x, y) // données originales
plot(x, yliss(1+p/2:$-p/2+1), "r") // données lissées
exit
