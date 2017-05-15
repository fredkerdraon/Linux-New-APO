//Black scholes

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
clf()
plot2d(x,F);
xtitle("Sensi au sous-jacent")
xs2png(0,'Sensi1.png')

x=10; 
t=linspace(0,19.99,10000) ; 
T=20 ; 
K =10 ; 
r =0.05 ; 
sigma=0.1; 
F=sensibilite(x, t, T, K, r, sigma); 
clf()
plot2d(t,F);
xtitle("Sensi au temps")
xs2png(0,'Sensi2.png')

x=10; 
t=15 ; 
T=20 ; 
K =10 ; 
r =linspace(0,0.2,10000) ; 
sigma=0.1; 
F=sensibilite(x, t, T, K, r, sigma); 
clf()
plot2d(r,F)
xtitle("Sensi au taux sans risque")
xs2png(0,'Sensi3.png')

//Volatility

// Copyright (C) 2009 - 2010 - Francesco Menoncin
//
// This file must be used under the terms of the GPL (3.0):
// http://gplv3.fsf.org/

function [sigmaC,sigmaP]=bsimpvol(option,S,K,r,T,sigma0);
  
// PURPOSE: Compute the implicit volatility for the Black and Scholes
//          model when the price of an option is known, for both
//          call option and put option
//------------------------------------------------------------------
// INPUT:  
// * option  = option price
// * S       = price of the underlying asset
// * K       = strike price
// * r       = riskless interest rate
// * T       = time to maturity
// * sigma0  = starting guess value for the iterations
// -----------------------------------------------------------------
// OUTPUT:
// * sigmaC  = implied volatility of a call option
// * sigmaP  = implied volatility of a put option
// -----------------------------------------------------------------
// Francesco Menoncin (2010)

function [Y]=difference(s);
    d1=-((log(K/S)-(r+1/2*s^2)*T)/(s*sqrt(T)));
    d2=-((log(K/S)-(r-1/2*s^2)*T)/(s*sqrt(T)));
    Y=segno*S*cdfnor('PQ',segno*d1,0,1)-segno*K*exp(-r*T)*cdfnor('PQ',segno*d2,0,1)-option;
  endfunction
  segno=1;
  [sigmaC,d,inf]=fsolve(sigma0,difference);
  if inf==1 then disp('Call: good convergence'); else disp('Call: bad convergence'); end
  segno=-1;
  [sigmaP,d,inf]=fsolve(sigma0,difference);
  if inf==1 then disp('Put: good convergence'); else disp('Put: bad convergence'); end
endfunction

