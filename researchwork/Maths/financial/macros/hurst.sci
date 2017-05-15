function [H]=hurst(price,varargin);
  
// PURPOSE: Compute the Hurst index on
//          historical prices
//--------------------------------------------------------------
// INPUT:  
// * price    = vector of historical prices
// * period   = (optional input, by default 250) first number of
//              prices used for computing the index
// * step     = (optional input, by default 10) each increment
//              in the number of prices used for computing
//              the index
// -------------------------------------------------------------
// OUTPUT:
// H          = Hurst index
// -------------------------------------------------------------
// Francesco Menoncin (2010)

  select size(varargin)
    case 0 then period=250; step=10;
    case 1 then period=varargin(1); step=10;
    case 2 then period=varargin(1); step=varargin(2);
  end   
  for i=1:(length(price)-period)/step
    dlnS=diff(log(price(1:period+step*(i-1))));
    x(i)=log(length(dlnS));
    y(i)=log((max(cumsum(dlnS-mean(dlnS)))-min(cumsum(dlnS-mean(dlnS))))/stdev(dlnS));
  end
  plot(x,y,'.');
  x=[ones(x) x];
  bhat=(x'*x)^(-1)*x'*y;
  H=bhat(2);
endfunction
