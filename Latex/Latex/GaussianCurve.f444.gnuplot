set table "GaussianCurve.f444.table"; set format "%.5f"
set samples 100.0; plot [x=0:5.5] 498.7*(x**(0.5*9-1))*((1+9*x/6)**(-0.5*9-0.5*6))
