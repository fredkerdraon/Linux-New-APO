function [xoptim,v,inf]=evt(x0,x,u)
  
// PURPOSE: Estimate the parameters ("xi" and "beta") of a
//          Generalized Pareto Density with Maximum Likelihood
//
// f(x) = (1+xi*(x-u)/beta)^(-1/xi-1)/beta
//------------------------------------------------------------------
// INPUT:  
// * x0  = starting values for the parameters "xi" and "beta"
// * x   = historical asset returns
// * u   = threshold parameter
// -----------------------------------------------------------------
// OUTPUT:
// * xoptim  = maximum likelihood value of the parameters
//              "xi" and "beta"
// * v       = same value as "v" in the "fsolve" function
// * inf     = same values as "inf" in the "fsolve" function
// -----------------------------------------------------------------
// Francesco Menoncin (2010)
  
  x=x(x>u);
  deff('[y]=eq(z)','y=[1/z(1)/z(2)-(1/z(1)+1)/z(2)*mean((1+z(1)*(x-u)/z(2))^(-1));...
     -(1/z(1)+1)/z(1)+1/z(1)^2*mean(log(1+z(1)*(x-u)/z(2)))+(1/z(1)+1)/z(1)*mean((1+z(1)*(x-u)/z(2))^(-1))]');
  [xoptim,v,inf]=fsolve(x0,eq);
endfunction