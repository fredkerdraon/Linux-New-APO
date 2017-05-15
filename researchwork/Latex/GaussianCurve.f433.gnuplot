set table "GaussianCurve.f433.table"; set format "%.5f"
set samples 100.0; plot [x=0:5.5] 320*(x**(0.5*8-1))*((1+8*x/4)**(-0.5*8-0.5*4))
