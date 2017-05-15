function [portf,varoptim]=markowitz(price,ER,r,dt);
  
// PURPOSE: Compute the optimal portfolio in the Markowitz
//          framework with and without riskless interest
//          rate, with and without short selling
//          Finally, the mean-variance frontier is drawn
//--------------------------------------------------------------
// INPUT:  
// * price   = matrix whose columns contain the historical
//             prices of each asset
// * ER      = expected (annual) portfolio return
// * r       = riskless (annual) interest rate
// * dt      = data frequencty (e.g. dt=1 for annual data,
//             dt=1/4 for quarter data, and so on...)
// -------------------------------------------------------------
// OUTPUT:
// * portf   = matrix of the optimal portfolio composition
//             first raw  : with short selling and with r
//             second raw : with short selling and without r
//             third raw  : without short selling and with r
//             fourth raw : without short selling and without r
// -------------------------------------------------------------
// Francesco Menoncin (2010)  

//
// Compute variances, covariances, and means
//
dlnprice=diff(log(price),1,1);
Q=mvvacov(dlnprice)/dt;
mu=mean(dlnprice,1)'/dt+1/2*diag(Q);
//
// Define vectors p and xi
//
p=zeros(size(price,2),1);
xi=zeros(size(price,2),1);
//
// Compute optimal unconstrained portfolio and variance
//
ww=qld(2*Q,p,(mu'-r),(ER-r),[],[],1);
varw=ww'*Q*ww;
wrw=qld(2*Q,p,[mu';ones(size(price,2),1)'],[ER;1],[],[],2);
varrw=wrw'*Q*wrw;
portf=[ww,wrw];
varoptim=[varw,varrw];
//
// Compute optimal constrained portfolio and variance
//
if ER>min(mu) & ER<max(mu) then
  w=qld(2*Q,p,(mu'-r),(ER-r),xi,[],1);
  var=w'*Q*w;
  wr=qld(2*Q,p,[mu';ones(size(price,2),1)'],[ER;1],xi,[],2);
  varr=wr'*Q*wr;
  portf=[ww,wrw,w,wr];
  varoptim=[varw,varrw,var,varr];
else
  portf(:,3)=%nan;
  portf(:,4)=%nan;
  varoptim(:,3)=%nan;
  varoptim(:,4)=%nan;
end 

frontier=input('Draw frontiers? (y/n) ','string');
disp(['     with short selling','     without short selling']);
disp(['    with r','    without r','   with r','    without r']);
if frontier=='y' then
  xtitle('Mean-Std frontier','Standard Deviation','Mean return');
  //
  // Define coordinates
  //
  ordi=max(0,min(mu));
  ords=max(mu);
  ord=[ordi:(ords-ordi)/100:ords];
  //
  // Compute and draw unconstrained frontiers
  //  
  for i=1:size(ord,2)
    ww=qld(2*Q,p,(mu'-r),(ord(i)-r),[],[],1);
    xw(i)=ww'*Q*ww;
    wrw=qld(2*Q,p,[mu';ones(size(price,2),1)'],[ord(i);1],[],[],2);
    xrw(i)=wrw'*Q*wrw;
  end
  plot(sqrt(xw),ord,'--black');
  plot(sqrt(xrw),ord,'black');
  if ER>min(mu) & ER<max(mu) then
    //
    // Compute and draw constrained frontiers
    //
    for i=1:size(ord,2)
      w=qld(2*Q,p,(mu'-r),(ord(i)-r),xi,[],1);
      x(i)=w'*Q*w;
      wr=qld(2*Q,p,[mu';ones(size(price,2),1)'],[ord(i);1],xi,[],2);
      xr(i)=wr'*Q*wr;
    end
    plot(sqrt(x),ord,'--red');
    plot(sqrt(xr),ord,'red');
    legend(['With r - with short selling','Without r - with short selling','With r - without short selling','Without r - without short selling'],2)
  else
    legend(['With r - with short selling','Without r - with short selling'],2)
  end
  else
end
endfunction
