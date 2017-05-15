function [w,ES,VaR]=esvaroptim(price,ER,r,dt,alpha);
  
// PURPOSE: Compute the optimal portfolio
//          minimizing the "Expected Shortfall" and
//          also show the value of the "Value at Risk"
//--------------------------------------------------------------
// INPUT:  
// * price   = matrix whose columns contain the historical
//             prices of each asset
// * ER      = expected (annual) portfolio return
// * r       = riskless (annual) interest rate
// * dt      = data frequencty (e.g. dt=1 for annual data,
//             dt=1/4 for quarter data, and so on...)
// * alpha   = confidence level of both Expected Shortfall
//             and Value at Risk
// -------------------------------------------------------------
// OUTPUT:
// * w       = matrix of the optimal portfolio composition
//             first raw  : with short selling and with r
//             second raw : with short selling and without r
//             third raw  : without short selling and with r
//             fourth raw : without short selling and without r
// * ES      = Expected Shortfall of the optimal portfolio
// * VaR     = Value at Risk of the optimal portfolio
// -------------------------------------------------------------
// Francesco Menoncin (2010)

  ER=ER*dt;
  r=r*dt,
  Rp=diff(price,1,1)./price(1:$-1,:);
  K=size(Rp,1);
  n=size(Rp,2);
  p=[-1;ones(K,1)/(alpha*K);zeros(n,1)];
  yiw=[-100000; zeros(K+n,1)];
  yi=[-100000; zeros(K,1); -ones(n,1)*100000]
  //
  // Matrices without r
  //
  C=[zeros(1,K+1),mean(Rp,1); zeros(1,K+1),ones(1,n); ones(K,1),-eye(K,K),-Rp];
  b=[ER;1;zeros(K,1)];
  //
  // Matrice with r
  //
  Cr=[zeros(1,K+1),mean(Rp,1)-r;ones(K,1),-eye(K,K),-Rp+r];
  br=[ER-r;ones(K,1)*r];       
  //
  // Portfolio with short selling
  //
  Q=zeros(size(p,1),size(p,1));
  yr=qld(Q,p,Cr,br,yi,[],1);
  y=qld(Q,p,C,b,yi,[],2);
  VaR=[-yr(1) -y(1)];
  w=[yr(K+2:$) y(K+2:$)];
  ES=[yr'*p y'*p];
  //
  // Portfolio without short selling
  //
  if ER>min(mean(Rp,1)) & ER<max(mean(Rp,1)) then
    yrw=qld(Q,p,Cr,br,yiw,[],1);
    yw=qld(Q,p,C,b,yiw,[],2);
    VaR(:,3:4)=[-yrw(1) -yw(1)];
    w(:,3:4)=[yrw(K+2:$) yw(K+2:$)];
    ES(:,3:4)=[yrw'*p yw'*p];
  else
    VaR(:,3:4)=%nan;
    w(:,3:4)=%nan;
    ES(:,3:4)=%nan;
  end
  //
  // Draw frontiers
  //
  frontier=input('Draw frontier? (y/n) ','string');
  disp(['     with short selling','     without short selling']);
  disp(['    with r','    without r','   with r','    without r']);
if frontier=='y' then
  xtitle('Return-Expected Shortfall Frontier','Expected Shortfall','Mean return');
  //
  // Define coordinates
  //
  ordi=max(0,min(mean(Rp,1)));
  ords=max(mean(Rp,1));
  ord=[ordi:(ords-ordi)/100:ords];
  //
  // Compute and draw unconstrained frontiers
  //  
  for i=1:size(ord,2)
    b=[ord(i);1;zeros(K,1)];
    br=[ord(i)-r;ones(K,1)*r];
    y=qld(Q,p,C,b,yi,[],2);
    yr=qld(Q,p,Cr,br,yi,[],1);
    x(i)=y'*p;
    xr(i)=yr'*p;
  end
  plot(x,ord,'black');
  plot(xr,ord,'--black');
  if ER>min(mean(Rp,1)) & ER<max(mean(Rp,1)) then
    for i=1:size(ord,2)
      b=[ord(i);1;zeros(K,1)];
      br=[ord(i)-r;ones(K,1)*r];
      yw=qld(Q,p,C,b,yiw,[],2);
      yrw=qld(Q,p,Cr,br,yiw,[],1);
      xw(i)=yw'*p;
      xrw(i)=yrw'*p;
    end
    plot(xw,ord,'red');
    plot(xrw,ord,'--red');
    legend(['Without r - with short selling','With r - with short selling','Without r - without short selling','With r - without short selling'],2)
  else
    legend(['Without r - with short selling','With r - with short selling'],2)
  end
  else
end
endfunction
