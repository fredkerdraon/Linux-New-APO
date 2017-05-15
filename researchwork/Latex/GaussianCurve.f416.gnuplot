set table "GaussianCurve.f416.table"; set format "%.5f"
set samples 100.0; plot [x=0:5.5] 52.5*(x**(0.5*6-1))*((1+6*x/3)**(-0.5*6-0.5*3))
