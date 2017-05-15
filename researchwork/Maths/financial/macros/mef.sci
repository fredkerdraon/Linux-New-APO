function [E]=mef(x);
  
// PURPOSE: Draw the "Mean Excess Function"
//------------------------------------------------------------------
// INPUT:  
// * x = column vector of historical returns on an asset
// -----------------------------------------------------------------
// OUTPUT:
// * E = values of the Mean Excess Function for any possible
//       threshold (i.e. alternatively taking any historical
//       retur as a threshold)
//
// Finally the Mean Excess Function is plotted
// -----------------------------------------------------------------
// Francesco Menoncin (2010)

  xo=gsort(x,'r','i');
  for i=1:size(x,1)-1
    E(i)=mean(xo(i+1:$)-xo(i));
  end
  plot(xo(1:$-1),E,'.');
endfunction