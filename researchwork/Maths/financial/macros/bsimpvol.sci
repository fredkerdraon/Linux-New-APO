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