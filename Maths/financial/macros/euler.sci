function [x]=euler(drift,diffusion,dt,T,x0,t0);

// PURPOSE: Through Euler method, find the numerical
//          solution to a system of stochastic differential
//          equations of the following form
//          dx = drift(t,x) dt + diffusion(t,x) dW
//          where "dx" is a vecotr, "drift" is a vector,
//          "diffusion" is a matrix, and "dW" is a vector
//---------------------------------------------------------------
// INPUT:  
// * drift     = STRING describing the COLUMN vector of the
//               drifts, the unknowns must be named
//               "t" and "x" (if there are more x's, then they
//               must be named "x(1)", "x(2)",and so on)
// * diffusion = STRING describing the MATRIX of the 
//               diffusions, the unknowns must be named
//               as in the drift
// * T         = time during which performing the simulation
// * dt        = time interval (e.g. with daily data and "T"
//               set in years, dt=1/250)
// * x0        = the vector of initial values of variables "x"'s
// * t0        = the initial value of variable "t"
// ---------------------------------------------------------------
// OUTPUT:
// * x         = matrix whose columns contain the series of
//               simulated variable "x"'s
// ---------------------------------------------------------------
// Francesco Menoncin (2010)

  deff('y=mu(t,x)',strcat(['y=',drift]));
  deff('y=sigma(t,x)',strcat(['y=',diffusion]));
  dW=rand(size(sigma(t0,x0),2),T/dt,'normal')*sqrt(dt);
  x(:,1)=x0;
  t(1)=t0;
  for i=2:T/dt
    x(:,i)=x(:,i-1)+mu(t(i-1),x(:,i-1))*dt+sigma(t(i-1),x(:,i-1))*dW(:,i);
    t(i)=t(i-1)+dt;
  end;
  x=x';
endfunction