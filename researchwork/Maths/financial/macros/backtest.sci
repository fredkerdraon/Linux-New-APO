function backtest(price,alpha,varargin);
  
// PURPOSE: Apply the backtest to three different
//          risk measures (as percentage of lost):
//          Expected Shortfall, Value at Risk,
//          and a Spectral Measure with linear spectrum.
//          Finally, show the graph of historical returns and
//          the risk measures.
//          The thresholds of the backtest are also computed
//--------------------------------------------------------------
// INPUT:  
// * price   = matrix whose columns contain the historical
//             prices of each asset
// * alpha   = confidence level of risk measures
// * N       = (optional input) number of observations which
//             the backtest is computed on (default value 250
//             if there are more than 500 historical prices,
//             else N is half the size of "price")
// -------------------------------------------------------------
// OUTPUT:
// Compute the exceptions of three risk sources and show
// them graphically
// -------------------------------------------------------------
// Francesco Menoncin (2010)

  if size(varargin)==1 then 
    N=varargin(1);     
  else 
    if size(price,1)>=500 then
      N=250;
    else
      N=floor(size(price,1)/2);
    end
  end 
  for i=1:N
    [ES(i),VaR(i),M(i)]=esvarlin(price($-2*N+i:$-(N+1)+i),alpha);
  end;
  y=diff(price,1,1)./price(1:$-1,:);
  exeptions=[sum(bool2s(y($-(N-1):$)<=-ES)) sum(bool2s(y($-(N-1):$)<=-VaR)) sum(bool2s(y($-(N-1):$)<=-M))];
  z1=find(cumsum(binomial(alpha,N))>=0.95);
  z1=z1(1)-1;
  z2=find(cumsum(binomial(alpha,N))>=0.9999);
  z2=z2(1)-1;
  disp(['Green zone:' '0-'+string(z1);
      'Yellow zone:' string(z1)+'-'+string(z2);
      'Red zone:' string(z2)+'-']);
  disp(['ES: ' string(exeptions(1))+' exeptions';
      'VaR: ' string(exeptions(2))+' exeptions';
      'Linear Spectrum: ' string(exeptions(3))+' exeptions']);
  plot([y($-(N-1):$) -ES -VaR -M]);
  legend(['Historical returns','ES','VaR','Linear Spectrum'],2);
endfunction