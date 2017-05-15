set table "GaussianCurve.50.table"; set format "%.5f"
set samples 50.0; plot [x=5.3426:5.5] 6.6667*(x**(0.5*4-1))*((1+4*x/3)**(-0.5*4-0.5*3))
