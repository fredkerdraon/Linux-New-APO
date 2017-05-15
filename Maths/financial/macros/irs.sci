function [spread,leg]=irs(time,months,r,setting);
  
// PURPOSE: Compute both the spread for a fix-for-floating
//          Interest Rate Swap and the value of the legs
//
//--------------------------------------------------------------
// INPUT:  
// * time      = subscribing date in the form
//               [year month day]
// * months    = number of months for each period
// * r         = curve of relevant
//               spot interest rates (column vector)
// * setting   = must be "0" (zero) for "in advance" swap
//               and "1" for "in arrears" swap
// -------------------------------------------------------------
// OUTPUT:
// * spread    = is the fix amount that
//               must be paid at each perdio
// * leg       = is the value of both legs of the swap
// -------------------------------------------------------------
// Francesco Menoncin (2010)

  Y(1)=time(1); M(1)=time(2);
  for i=2:max(size(r))+1
    if M(i-1)+months>12 then 
      M(i)=modulo(M(i-1)+months,12);
      Y(i)=Y(i-1)+1;
    else 
      M(i)=M(i-1)+months;
      Y(i)=Y(i-1);
    end
  end
  t=datenum(Y,M,time(3)*ones(M));
  g=diff(t)/360;
  gg=cumsum(g);
  B=[1; (1+r.*gg).^(-1)];
  f=(B(1:$-1)./B(2:$)-1)./g;
  leg=sum(f(1+setting:$).*B(2:$-setting).*g(1:$-setting));
  spread=leg/sum(B(2:$-setting).*g(1:$-setting));
endfunction