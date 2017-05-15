function [es,var,xoptim,v,inf]=esvarevt(x0,data,u,alpha)
  
// PURPOSE: Estimate the parameters ("xi" and "beta") of a
//          Generalized Pareto Density f(x) with Maximum Likelihood
//          and compute both VaR and Expected Shortfall
//
// f(x) = (1+xi*(x-u)/beta)^(-1/xi-1)/beta
//------------------------------------------------------------------
// INPUT:  
// * x0    = starting values for the parameters "xi" and "beta"
// * data  = historical data
// * u     = threshold parameter
// * alpha = confidence level fot the risk measures
// -----------------------------------------------------------------
// OUTPUT:
// * var     = Value at Risk (at "alpha" confidence level)
// * es      = Expected Shortfall (at "alpha" confidence level)
// * xoptim  = maximum likelihood value of the parameters
//             "xi" and "beta"
// * v       = same value as "v" in the "fsolve" function
// * inf     = same values as "inf" in the "fsolve" function
// -----------------------------------------------------------------
// Francesco Menoncin (2010)
  
  x=data(data>u);
  deff('[y]=eq(z)','y=[1/z(1)/z(2)-(1/z(1)+1)/z(2)*mean((1+z(1)*(x-u)/z(2))^(-1));...
  -(1/z(1)+1)/z(1)+1/z(1)^2*mean(log(1+z(1)*(x-u)/z(2)))+(1/z(1)+1)/z(1)*mean((1+z(1)*(x-u)/z(2))^(-1))]');
  [xoptim,v,inf]=fsolve(x0,eq);
  N=size(data,1); Nu=size(x,1);
  var=u+xoptim(2)/xoptim(1)*((N*alpha/Nu)^(-xoptim(1))-1);
  es=(var+xoptim(2)-u*xoptim(1))/(1-xoptim(1));
endfunction