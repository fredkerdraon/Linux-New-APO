// POV-Ray 3.7 Scene File "Running_Counter_10.pov"
// author: Friedrich A. Lohmueller, May-2009/Aug-2009/Jan-2011
// email: Friedrich.Lohmueller_at_t-online.de
// homepage: http://www.f-lohmueller.de
//--------------------------------------------------------------------------
#version 3.6; // 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }}
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------------------------------------<<<<
//--------------------------------------------------------------------------------------------------------<<<<
//------------------------------------------------------------- Camera_Position, Camera_look_at, Camera_Angle
#declare Camera_Number = 1 ;
//--------------------------------------------------------------------------------------------------------<<<<
#switch ( Camera_Number )
#case (0)
  #declare Camera_Position = < 0.65, 0.40, -2.00> ;  // front view
  #declare Camera_Look_At  = < 0.65, 0.40,  0.00> ;
  #declare Camera_Angle    =  45 ;
#break
#case (1)
  #declare Camera_Position = < 0.625, 0.35, -2.00> ;  // front view
  #declare Camera_Look_At  = < 0.625, 0.35,  0.00> ;
  #declare Camera_Angle    =  33 ;
#break
#else
  #declare Camera_Position = < 2.00, 1.50, -2.00> ;  // diagonal view
  #declare Camera_Look_At  = < 0.50, 0.40,  0.00> ;
  #declare Camera_Angle    =  45 ;
#break
#end // of "#switch ( Camera_Number )" -----------------------------
//------------------------------------------------------------------ 
camera{ // ultra_wide_angle
