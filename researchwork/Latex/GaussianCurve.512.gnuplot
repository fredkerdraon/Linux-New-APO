set table "GaussianCurve.512.table"; set format "%.5f"
set samples 50.0; plot [x=3.1075:5.5] 12.4807*(x**(0.5*5-1))*((1+5*x/6)**(-0.5*5-0.5*6))
