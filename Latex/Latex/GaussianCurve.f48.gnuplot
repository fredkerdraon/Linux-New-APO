set table "GaussianCurve.f48.table"; set format "%.5f"
set samples 100.0; plot [x=0:5.5] 10.3684*(x**(0.5*5-1))*((1+5*x/10)**(-0.5*5-0.5*10))
