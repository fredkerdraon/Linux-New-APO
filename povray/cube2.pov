//DIFFERENCE OF CUBE WITH (UNION OF THREE PERPENDICULAR CYLINDERS)

//Files with predefined colors and textures
#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"

//Place the camera
camera {
  sky <0,0,1>          //Don't change this
  direction <-1,0,0>   //Don't change this  
  right <-4/3,0,0>     //Don't change this
  location  <10,7,4>  //Camera location
  look_at   <0,0,0>    //Where camera is pointing
  angle 50      //Angle of the view--increase to see more, decrease to see less
}

//Ambient light to "brighten up" darker pictures
global_settings { ambient_light White }

//Place a light--you can have more than one!
light_source {
  <0,0,5>       //Change this if you want to put the light at a different point
  color White*2        //Multiplying by 2 doubles the brightness
}  

light_source{ <5,5,5> color Blue*2}

//Set a background color
background { color White }

plane{<0,0,-1>,5 texture{T_Stone1}}

#declare Texture_W =
 texture{ pigment{ color White*0.9}
          normal { bumps 1 scale 0.025}
          finish { diffuse 0.9 specular 1}
        } // end of texture
#declare Texture_S =
 texture{ T_Stone10 scale 1
          normal { agate 0.5 scale 0.25}
          finish { diffuse 0.9 phong 1 }
        } // end of texture
//------------------------------------------------------
sphere { <-10,0,0>, 1
         texture{ crackle  scale 1.5 turbulence 0.1
           texture_map {[0.00 Texture_W]
                        [0.05 Texture_W]
                        [0.05 Texture_S]
                        [1.00 Texture_S]
                       }// end of texture_map
                   scale 0.2
         } // end of texture ---------------------------
  scale<1,1,1>  rotate<0,0,0>  translate<0.40,1,0>
}  // end of sphere ------------------------------------

difference{   

box { <-2,-2,-2>,<2,2,2> texture{Texture_W} }  

union{
cylinder { <-5, 0, 0>, <5, 0, 0>, 1 texture {T_Wood1}}
//cylinder { <0, -5, 0>, <0, 5, 0>, 1 texture {T_Wood1}}
cylinder { <0, 0, -5>, <0, 0,5 >, 1 texture {T_Wood1}}
}

}

// sphere{<0,0,0>,0.8 scale <1.5,1,1>  translate<0.2,1.1,0>
//       texture{
//         pigment{ average turbulence 0.75
//                  pigment_map{
//                   [3 color Yellow] // pondération, pigment
//                   [3 Candy_Cane translate<-10,-10,-10> ]
//                   [5 color Clear ]
//                           } // fin de pigment_map
//                  scale 0.5 } // fin de pigment
//        finish  { diffuse 0.9 phong 0.5}
//              } // fin de texture
//      interior{ caustics 0.5 }
//      clipped_by{sphere{< 0.5,1,0.5>,1.25}}
//    }// fin de sphere ------------------------------

#declare Pigment_1 =
pigment{ mandel 50 exponent 2 //2...33
         // interior 1,2 exterior 1,2
         scale 0.50 translate<0.15,0,0>
         color_map{[0.00 color rgb <0.5,0,0.25>]
                   [0.08 color rgb <0.8,0,0.10>]
                   [0.20 color rgb <1,0.4,0.05>]
                   [0.30 color rgb <1,0.7,0>]
                   [0.60 color rgb <0.0,0,0>]
                   [0.80 color rgb <0,0,0>]
                   [1.00 color rgb <1,1,1>]}
         } // end of pigment -------------------
sphere{ <-5,0,2>, 1
        pigment{ Pigment_1
               } // end pigment
        normal { pigment_pattern { Pigment_1 }
                 3 // BUMP_SIZE
               } // end normal
        finish { phong 1 }
      } // end of sphere
