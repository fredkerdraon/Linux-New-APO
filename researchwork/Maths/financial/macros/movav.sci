function [M]=movav(S,varargin);

// PURPOSE: Compute the moving avarages of a time series
//---------------------------------------------------------
// INPUT:  
// * S        = historical data (column vector)
// * varargin = the lenght of the moving avarages
// -------------------------------------------------------------
// OUTPUT:
// * M         = matrix containing, in any column, the moving
//               average of the historical data
// -------------------------------------------------------------
// Francesco Menoncin (2010)

  for i=1:size(varargin)
    m=varargin(i);
    for k=size(S,1):-1:m
      M(k,i)=mean(S(k-m+1:k));
    end
    M(1:m-1,i)=%nan;
  end
  plot([S M]);
endfunction
