function [C,P]=bsoption(S,K,r,T,sigma);
  
// PURPOSE: Compute the value of both call and put options
//          with the Black and Scholes formula
//------------------------------------------------------------------
// INPUT:  
// * S     = price of the underlying asset
// * K     = strike price
// * r     = riskless interest rate
// * T     = time to maturity
// * sigma = diffusion of the underlying asset return
// -----------------------------------------------------------------
// OUTPUT:
// * C     = value of the call option
// * P     = value of the put option
// -----------------------------------------------------------------
// Francesco Menoncin (2010)

  d1=-((log(K/S)-(r+1/2*sigma^2)*T)/(sigma*sqrt(T)));
  d2=-((log(K/S)-(r-1/2*sigma^2)*T)/(sigma*sqrt(T)));
  C=S*cdfnor('PQ',d1,0,1)-K*exp(-r*T)*cdfnor('PQ',d2,0,1);
  P=C+K*exp(-r*T)-S;
endfunction
