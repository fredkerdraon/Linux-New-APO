set table "GaussianCurve.f44.table"; set format "%.5f"
set samples 100.0; plot [x=0:5.5] 5.1429*(x**(0.5*4-1))*((1+4*x/7)**(-0.5*4-0.5*7))
