set table "GaussianCurve.f440.table"; set format "%.5f"
set samples 100.0; plot [x=0:5.5] 266.0*(x**(0.5*9-1))*((1+9*x/10)**(-0.5*9-0.5*10))
