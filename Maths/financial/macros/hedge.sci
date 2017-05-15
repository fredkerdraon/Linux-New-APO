function [h]=hedge(S,F);
  
// PURPOSE: Compute the hedge ratio between an asset "S"
//          and a derivative on it "F"
//------------------------------------------------------------------
// INPUT:  
// * S = column vector of historical prices of an asset
// * F = column vector of historical prices of a derivative
//
// S and F must have the same dimension
// -----------------------------------------------------------------
// OUTPUT:
// * h = hedge ratio between S and F. If one multiplies the wealth
//       invested in S by "h", one obtains the wealth that must be
//       invested in F in order to hedged the position on S
// -----------------------------------------------------------------
// Francesco Menoncin (2010)

  dlnS=diff(log(S),1,1);
  dlnF=diff(log(F),1,1);

  X=[ones(dlnS) dlnS];
  [nobs,nvar]=size(X);
  bhat=(X'*X)^(-1)*X'*dlnF;
  h=-1/bhat(2);
  R2=1-(dlnF-X*bhat)'*(dlnF-X*bhat)/((dlnF-mean(dlnF))'*(dlnF-mean(dlnF)));
  R2c=1-(1-R2)*(nobs-1)/(nobs-nvar);
  
// computation of t-statistics

  tstat=sqrt((nobs-nvar)/((dlnF-X*bhat)'*(dlnF-X*bhat)))*bhat./sqrt(diag((X'*X)^(-1)));

  plot(dlnF,'blue');
  plot(X*bhat,'red');
  legend(['Historical values','Estimated values']);

  disp(['N. observations' string(nobs);...
  'N. variables' string(nvar);...
  'R-square' string(R2);...
  'R-square corrected' string(R2c)]);
  disp(['Coefficients' 't-statistics';...
  string(bhat) string(tstat)]);

endfunction
