function [uopt,rf]=svennson(t,r,u0,varargin);
  
// PURPOSE: Estimate the parameters u1, u2, u3, u4, u5, u6
//          for the Svennson model f(t) of spot
//          interest rates (least square method)
//
// f(t)=u1+u4*u6/t+(u2+u3)*u5/t*(1-e^(-t/u5))
//      -(u6/t-1)*u4*e^(-t/u6)-u3*e^(-t/u5)
//
// Finally draw the actual spot rate curve and the
// interporalted curve
//--------------------------------------------------------------
// INPUT:  
// * t    = spot rate maturities (column vector)
// * r    = spot interest rates (column vector)
// * u0   = initial values of the parameters (vector 6x1)
// * tf   = optional input: the dates for which spot rates
//          must be foreseen (column vector)
// -------------------------------------------------------------
// OUTPUT:
// * uopt = optimal values of the parameters
//          u1, u2, u3, u4, u5, u6 (vector 6x1)
// * rf   = optional output: foreseen values of spot rates
// -------------------------------------------------------------
// Francesco Menoncin (2010)
    
  function rh=rhat(u,t);
    rh=u(1)+u(4)*u(6)*t.^(-1)+(u(2)+u(3))*u(5)*(1-exp(-t/u(5)))./t...
       -u(4)*(u(6)*t.^(-1)-1).*exp(-t/u(6))-u(3)*exp(-t/u(5));
  endfunction
     
  function D=Diff(u);
    D=rhat(u,t)-r;
  endfunction
  
  [f,uopt,gopt]=leastsq(Diff,u0);
  disp('Gradient');
  disp(gopt);
  disp('Objective function');
  disp(f);
  r_estim=rhat(uopt,t)
  plot(t,r);
  plot(t,r_estim,'red');
  if size(varargin)<>0 then
    tf=varargin(1);
    rf=rhat(uopt,tf);
    plot([t($);tf],[r_estim($);rf],'green');
    legend(['Actual values','Estimated values','Foreseen values'],4);
  else
    legend(['Actual values','Estimated values'],4);
  end  
endfunction