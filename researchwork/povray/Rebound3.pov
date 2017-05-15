//---------------------------------
#declare Time = clock +0.00  ;
//---------------------------------
sphere{ <0,0,0>,0.15
  texture{
    pigment{ color rgb<0.3,0.7,0>}
    finish{ phong 1 }
    }
#if(Time<0.5)
 translate<0.25,(1-Time*2)  *(1-0.15)+0.15,0>
#else
 translate<0.25,(Time-0.5)*2*(1-0.15)+0.15,0>
#end
} // end sphere

