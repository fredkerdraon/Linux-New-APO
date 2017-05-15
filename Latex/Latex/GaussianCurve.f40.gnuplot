set table "GaussianCurve.f40.table"; set format "%.5f"
set samples 100.0; plot [x=0:5.5] 6.6667*(x**(0.5*4-1))*((1+4*x/3)**(-0.5*4-0.5*3))
