function [rf]=interest(r,dt,T,model,n,r0);
  
// PURPOSE: Simulate future interest rate by estimating
//          the parameters of three models on the historical
//          interest rate
//---------------------------------------------------------
// INPUT:  
// * r     = column vector of historical interest rates
// * dt    = time unit of measure
// * T     = number of periods to simulate
// * model = either "merton", or "vasicek", or "cir"
// * n     = the number of simulations to perform
// * r0    = the first interest rate for simulation
// -------------------------------------------------------------
// OUTPUT:
// * rf    = the matrix whose rows contain the future values of
//           interest rate and whose columns contains
//           each simulation
// -------------------------------------------------------------
// Francesco Menoncin (2009)

  select model
    case 'merton' then
      mu=mean(diff(r))/dt;
      sigma=sqrt(mvvacov(diff(r))/dt);
      rf=r0*ones(1,n);
      for j=1:n
        dW=rand(T/dt,1,'normal')*sqrt(dt);
        for i=2:T/dt
          rf(i,j)=rf(i-1,j)+mu*dt+sigma*dW(i);
        end;
      end;
      disp(['Coefficient', 'Value';...
           'Drift', string(mu);...
           'Diffusion', string(sigma)]);
    case 'vasicek' then
      X=[ones(size(r,1)-1,1),r(1:$-1)];
      bhat=(X'*X)^(-1)*X'*r(2:$);
      a=(1-bhat(2))/dt;
      b=bhat(1)/(1-bhat(2));
      sigma=sqrt(mvvacov(diff(r))/dt);
      rf=r0*ones(1,n);
      for j=1:n
        dW=rand(T/dt,1,'normal')*sqrt(dt);
        for i=2:T/dt
          rf(i,j)=rf(i-1,j)+a*(b-rf(i-1,j))*dt+sigma*dW(i);
        end;
      end;
      disp(['Coefficient', 'Value';...
           'Mean reversion', string(a);...
           'Mean', string(b);...
           'Diffusion', string(sigma)]);
    case 'cir' then
       sigma=sqrt(mvvacov(diff(2*sqrt(r)))/dt);
       X=[2*sqrt(r(1:$-1)),(2*sqrt(r(1:$-1))).^(-1)];
       bhat=(X'*X)^(-1)*X'*(2*sqrt(r(2:$)));
       a=2*(1-bhat(1))/dt;
       b=(bhat(2)+sigma^2*dt/2)/(4*(1-bhat(1)));
       rf=r0*ones(1,n);
       for j=1:n
          dW=rand(T/dt,1,'normal')*sqrt(dt);
          for i=2:T/dt
             rf(i,j)=rf(i-1,j)+a*(b-rf(i-1,j))*dt+sigma*sqrt(rf(i-1,j))*dW(i);
          end;
       end;
       disp(['Coefficient', 'Value';...
            'Mean reversion', string(a);...
            'Mean', string(b);...
            'Diffusion coeff.', string(sigma)]);
  end
  plot([1:size(rf,1)]'*dt,rf);
  title('Simulated interest rates');
endfunction
