set table "GaussianCurve.f43.table"; set format "%.5f"
set samples 100.0; plot [x=0:5.5] 5.3333*(x**(0.5*4-1))*((1+4*x/6)**(-0.5*4-0.5*6))
