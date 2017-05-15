function [delta,gama,theta,rho,vega]=bsgreeks(S,K,r,T,sigma);
  
// PURPOSE: Compute the greeks in the Black and Scholes
//          option model for both call and put
//------------------------------------------------------------------
// INPUT:  
// * S       = price of the underlying asset
// * K       = strike price
// * r       = riskless interest rate
// * T       = time to maturity
// * sigma   = diffusion of the underlying return
// -----------------------------------------------------------------
// OUTPUT:
// * delta  = two element vector: derivative of the call and put
//            option with respect to S
// * gama   = second derivative of the call option with respect
//            to S ("gama" has the same value for a put option)
// * theta  = two element vector: derivative of the call and put
//            option with respect to T
// * rho    = two element vector: derivative of the call and put
//            option with respect to r
// * vega   = sderivative of the call option with respect
//            to sigma ("vega" has the same value for a put option)
// -----------------------------------------------------------------
// Francesco Menoncin (2010)

  d1=-((log(K/S)-(r+1/2*sigma^2)*T)/(sigma*sqrt(T)));
  d2=-((log(K/S)-(r-1/2*sigma^2)*T)/(sigma*sqrt(T)));
  delta=[cdfnor('PQ',d1,0,1);-cdfnor('PQ',-d1,0,1)];
  gama=S*sqrt(T)*exp(-d1^2/2)/sqrt(2*%pi);
  theta=[K*exp(-r*T)*(r*cdfnor('PQ',d2,0,1)+sigma*exp(-d2^2/2)/sqrt(2*%pi)/(2*sqrt(T)));...
         K*exp(-r*T)*(-r*cdfnor('PQ',-d2,0,1)+sigma*exp(-d2^2/2)/sqrt(2*%pi)/(2*sqrt(T)))];
  rho=[T*K*exp(-r*T)*cdfnor('PQ',d2,0,1);-T*K*exp(-r*T)*cdfnor('PQ',-d2,0,1)];
  vega=S*sqrt(T)*exp(-d1^2/2)/sqrt(2*%pi);
endfunction