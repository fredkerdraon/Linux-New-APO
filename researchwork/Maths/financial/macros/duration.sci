function [dur,con,ytm]=duration(t,c);
  
// PURPOSE: Compute "Duration", "Convexity" and "Yield to Maturity"
//          for an asset paying a stream of cash flows
//--------------------------------------------------------------
// INPUT:  
// * t   = column vector of times where flows are paid
//         (the first value must be zero)
// * c   = column vector of cash flows (the first negative
//         cash flow must be the price of the asset)
// -------------------------------------------------------------
// OUTPUT:
// * dur = duration of the asset
// * con = convexity of the asset
// * ytm = yield to maturity
//
// Cash flows are discounted with the Yield to Maturity
// -------------------------------------------------------------
// Francesco Menoncin (2010) 

  deff('[van]=van(r)','van=c''*(1+r)^(-t)');
  [ytm,f,inf]=fsolve(0,van);
  if inf<>1 then disp('Bad convergence'); else end
  dur=c(2:$)'*((1+ytm)^(-t(2:$)).*t(2:$))/(-c(1));
  con=c(2:$)'*((1+ytm)^(-t(2:$)).*(t(2:$).^2))/(-c(1));
endfunction