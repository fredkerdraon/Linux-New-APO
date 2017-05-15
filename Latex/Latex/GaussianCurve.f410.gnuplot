set table "GaussianCurve.f410.table"; set format "%.5f"
set samples 100.0; plot [x=0:5.5] 11.1463*(x**(0.5*5-1))*((1+5*x/8)**(-0.5*5-0.5*8))
