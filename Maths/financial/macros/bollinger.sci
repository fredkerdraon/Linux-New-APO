function bollinger(S,m,a)

// PURPOSE: On historical data "S", draw both the moving
//          average of length "m" and the Bollinger bands
//          of width "a". Also draw the percentage b.
//---------------------------------------------------------
// INPUT:  
// * S = historical data
// * m = moving average length
// * a = width of the Bollinger bands
// -------------------------------------------------------------
// OUTPUT:
// 
// -------------------------------------------------------------
// Francesco Menoncin (2010)

  for k=size(S,1):-1:m
    M(k,1)=mean(S(k-m+1:k));
    V(k,1)=sqrt(variance(S(k-m+1:k)));
  end
  M(1:m-1)=%nan;
  subplot(2,1,1);
  plot(S); plot(M,'green'); plot([M+a*V,M-a*V],'--red');
  title('Moving average and Bollinger bands');
  b(1:m-1,1)=%nan;
  b=[b;(S(m:$)-(M(m:$)-a*V(m:$)))./(2*a*V(m:$))];
  subplot(2,1,2);
  plot(b);
  plot([zeros(size(S,1),1), ones(size(S,1),1)],'--red');
  title('Percentage b');
endfunction
