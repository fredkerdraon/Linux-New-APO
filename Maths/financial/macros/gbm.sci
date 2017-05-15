function [mu,sigma]=gbm(data,dt);

// PURPOSE: Estimate the parameters of a Geometric Brownian
//          Motion - GBM (through the method of moments) and
//          graphically show the result
//----------------------------------------------------------------
// INPUT:  
// * data      = historical data (in a column vector)
// * dt        = data frequencty (e.g. dt=1 for annual data,
//               dt=1/4 for quarter data, and so on...)
// ----------------------------------------------------------------
// OUTPUT:
// * mu        = drift term of the GBM
// * sigma     = diffusion term of the GBM
// In the final figure:
// in black       : the historical data
// in blue        : the mean of the process
// in dotted blue : the confidence interval
//                  (mean +/- st_dev and
//                   mena +/- 2 times st_dev)
//            
// ----------------------------------------------------------------
// Francesco Menoncin (2010)

  dln=diff(log(data));
  sigma=sqrt(mvvacov(dln)/dt);
  mu=mean(dln)/dt+1/2*sigma^2;
  N=size(data,1);
  t=[1:N]'*dt;
  M=data(1)*exp(mu*t);
  Std=data(1)*exp(mu*t).*sqrt(exp(sigma^2*t)-1);
  plot(data,'black');
  plot(M,'blue');
  plot([M-Std M-2*Std M+2*Std M+Std],'blue--');
endfunction
