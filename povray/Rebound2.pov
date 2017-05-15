//---------------------------------
#macro  Bounce_101( X )
 #if(X<1/2) (sin(pi*( X + 1/2)))
 #else      (sin(pi*(1-X + 1/2)))
 #end
#end //----------------------------
#declare Time = clock +0.00  ;
//---------------------------------
sphere{ <0,0,0>,0.15
  texture{
    pigment{ color rgb<0.3,0.7,0>}
    finish{ phong 1 }
    }
  translate
  <0.25, Bounce_101(Time)*(1-0.15)+0.15,0>
} // end sphere
