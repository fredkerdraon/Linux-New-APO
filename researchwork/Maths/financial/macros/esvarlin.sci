function [ES,VaR,M]=esvarlin(price,alpha);
  
// PURPOSE: With historical simulation, computes three
//          risk measures (as percentage of loss):
//          Expected Shortfall, Value at Risk,
//          and a Spectral Measure with linear spectrum
//--------------------------------------------------------------
// INPUT:  
// * price   = matrix whose columns contain the historical
//             prices of each asset
// * alpha   = confidence level of risk measures;
//             it can be a vector for simlutaneously computing
//             the risk meausures at different confidence levels
// -------------------------------------------------------------
// OUTPUT:
// * ES      = Expected Shortfall
// * VaR     = Value at Risk
// * M       = Linear Spectral Risk Measure
// -------------------------------------------------------------
// Francesco Menoncin (2010)

  y=diff(price,1,1)./price(1:$-1,:);
  y=gsort(y,'r','i');
  n=size(y,1);
  for i=1:max(size(alpha))
    k=size(y(1:$*alpha(i),:),1);
    ES(i,:)=-(sum(y(1:k,:),1)/n+y(k+1,:)*(alpha(i)-k/n))/alpha(i);
    VaR(i,:)=-y(ceil(size(y,1)*alpha(i)),:);
    if k<2 then k=2, end;
    fi=max(2*n*(k-[1:n]')/(k*(k-1)),0);
    M(i,:)=-fi'*y/n;
  end
endfunction