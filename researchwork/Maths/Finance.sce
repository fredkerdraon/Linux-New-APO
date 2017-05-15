//Ta = read_csv('/home/myriam/table.csv')
//strtod(Ta)
A=[1,2,10;7,7.1,7.01];
mean(A)
mean(A,'r')
mean(A,'c')
A=matrix(1:12,[1,1,2,3,2]);
// in this case mean(A,'m') is equivalent to mean(A,3), the first non singleton dimension of A
y=mean(A,'m')
// x initialisation
x=[-6:0.01:6]';


//Lemme de Shur
A = rand(5,5);
spec(A);
ans;

/// Pour faire des histogrammes avec les données
d=rand(1,10000,'normal');
clf();histplot(80,d);
plot(x, 1/sqrt(2*%pi)*exp(-1*(x^2)/2), 0.85 )
xs2png(0,'LoiNormale2.png')
//clf();histplot(20,d,normalization=%f)
//clf();histplot(20,d,leg='rand(1,10000,''normal'')',style=5)
//clf();histplot(20,d,leg='rand(1,10000,''normal'')',style=16, rect=[-3,0,3,0.5]);

//Champ de vecteurs aléatoires
clf()
champ1(-5:5,-5:5,rand(11,11),rand(11,11),rect=[-10,-10,10,10],arfact=2)
xtitle("l''histogramme non normalisé")
xs2png(0,'Champ.png')


//Black scholes
function [M] = marcheAleatoire(N) 
Y = 2*grand(N,1,'bin',1,1/2) - 1;
M = [0;cumsum(Y)]; 
endfunction

N = 100; 
abscisse = 0 :1 : N; 
xset('window',1); 
marcheAleatoire(100) ;  
plot2d(abscisse,M,1)  ;
marcheAleatoire(100) ;  
plot2d(abscisse,M,2) ; 
marcheAleatoire(100) ;  
plot2d(abscisse,M,5); 

N = 100000 ; 
Y = 2*grand( N,1,'bin',1,1/2) - 1;
M = [0 ;cumsum(X)] ; 

function [B] =  brownien(N,couleur) 
B = M(1 :N+1)/sqrt(N) ; 
abscisse = 0 :1/N :1 ;  
plot2d(abscisse,B,style=couleur )  
endfunction

xset("window",1)   
brownien(100,1);  
xset("window",2)   
brownien(1000,2);  
xset("window",3)   
brownien(10000,3);  
xset("window",4)   
brownien(100000,5);

function S = BS(mu,sigma) 
S = exp(mu*t-((sigma^2)/2)*t+sigma*B); 
endfunction

xset('window',1)  
S=BS(0.1,0.01);  
plot2d(t,S); 
S=BS(0.1,0.05);  
plot2d(t,S,2); 
S=BS(0.1,0.1);  
plot2d(t,S,3); 
S=BS(0.1,0.15);  
plot2d(t,S,4); 
S=BS(0.1,0.2);  
plot2d(t,S,5); 
legends(['sigma=1%';'sigma=5%';'sigma=10%';'sigma=15%';'sigma=20%'],[1,2,3,4,5],'ur'); 

function F=sensibilite(x,t,T,K ,r,sigma) 
d1=(log(x/K )+(r+((sigma^2)/2)).*(T-t))./(sigma.*sqrt(T-t)); 
d2=d1-(sigma.*sqrt(T-t)); 
moy=zeros(1:10000); 
ecartType=ones(1:10000);  
Nd1=cdfnor ("PQ",d1,moy,ecartType);  
Nd2=cdfnor ("PQ",d2,moy,ecartType);
F=x.* Nd1-K .*exp(-r.*(T-t)).* Nd2; 
endfunction

x=linspace(0.01,20,10000); 
t=15 ; 
T=20 ; 
K =10 ; 
r =0.05 ; 
sigma=0.1; 
F=sensibilite(x, t, T, K, r, sigma); 
xset('window',0)   
plot2d(x,F);

x=10; 
t=linspace(0,19.99,10000) ; 
T=20 ; 
K =10 ; 
r =0.05 ; 
sigma=0.1; 
F=sensibilite(x, t, T, K, r, sigma); 
xset('window',1)   
plot2d(t,F);

x=10; 
t=15 ; 
T=20 ; 
K =10 ; 
r =linspace(0,0.2,10000) ; 
sigma=0.1; 
F=sensibilite(x, t, T, K, r, sigma); 
xset('window',2)   
plot2d(r,F)

