function [r,X]=diagramme(n,x0)
X=[1:3001];
X=ones(X);
k=1;
for i=[2.5:0.0005:4.00] 
  x=[1:n];
  x=ones(x);
  x1=x0;
  for  p= [1:n] 
    x(p)=i*x1*(1-x1);
    x1=x(p);
  end
  X(k)=x1;
  k=k+1;
end
r=[2.50:0.0005:4.00];
endfunction

n=20
//pas = 0.02
pas = 0.02
compteur = 0
x0 = 0.01
f = figure()
f.background = 8
//while (x0+compteur<0.9)
while (x0+compteur<4)
    compteur = compteur+pas
    [i,X] = diagramme(n, x0+compteur)
    plot2d(i, X, 1)
    //plot2d(i, X,'r')
end

//n=input("Entrez nombre de points : ");
//pas=input("Entrez le pas : ");
//compteur=0;
//x0=0.001;
//tic();
//while (x0+compteur<0.9)
//  compteur=compteur+pas
//[i,X]=diagramme(n, x0+compteur);
//p=plot(i,X, 'd');
 
//end
//toc()
