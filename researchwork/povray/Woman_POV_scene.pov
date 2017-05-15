//==================================================
//POV-Ray Main scene file
//==================================================
//This file has been created by PoseRay v3.13.23.587
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: https://sites.google.com/site/poseray/
//==================================================
//Files needed to run the POV-Ray scene:
//Woman_POV_main.ini (initialization file - open this to render)
//Woman_POV_scene.pov (scene setup of cameras, lights and geometry)
//Woman_POV_geom.inc (geometry)
//Woman_POV_mat.inc (materials)
//V5BreeEyesM.jpg
//V5BreeInMouthM.jpg
//V5BreeHeadM.jpg
//V5BreeLimbsM.jpg
//V5BreeHead3M.jpg
//V5BreeEyes6M.jpg
//V5BreeTorsoM.jpg
//V5BreeLashes2.tif
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 185300
//Number of vertices............. 89002
//Number of normals.............. 89882
//Number of UV coordinates....... 97356
//Number of lines................ 0
//Number of materials............ 35
//Number of groups/meshes........ 35
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.00456933,0.0109623)
//                        to u,v=(0.99543,0.989699)
//Bounding Box....... from x,y,z=(-0.1279387,-0.000164743,-0.0207489)
//                      to x,y,z=(0.1279387,0.289516,0.03212785)
//                 size dx,dy,dz=(0.2558774,0.2896807,0.05287674)
//                  center x,y,z=(0,0.1446756,0.005689477)
//                       diagonal 0.3901078
//Surface area................... 0.04585166
//             Smallest face area 1.142132E-10
//              Largest face area 2.947523E-6
//Memory allocated for geometry.. 16 MBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H240 +FN -A +Q9 +C -UA +MV3.7
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
#include "rad_def.inc"
 
global_settings {
  //This setting is for alpha transparency to work properly.
  //Increase by a small amount if transparent areas appear dark.
   max_trace_level 15
   assumed_gamma 1
 
   #local p_start	        =	64/max(image_width,image_height);
   #local p_end_final	=	4/max(image_width,image_height);
radiosity {
     pretrace_start p_start
     pretrace_end   p_end_final 
     count 100
     nearest_count 5
     error_bound 0.05
     recursion_limit 1
     low_error_factor .5
     gray_threshold 0.0
     minimum_reuse 0.015
     brightness 1
     adc_bailout 0.01/2
}
subsurface {}
mm_per_unit 25.4
}
#include "Woman_POV_geom.inc" //Geometry
 
//CAMERA PoseRayCAMERA
camera {
        perspective
        up <0,1,0>
        right -x*image_width/image_height
        location <0,-6.7112E-9,0.7802156>
        look_at <0,-6.7112E-9,-0.2197844>
        angle 32.93461 // horizontal FOV angle
        rotate <0,0,0> //roll
        rotate <-25,0,0> //pitch
        rotate <0,45,0> //yaw
        translate <0,0.1446756,0.005689477>
        }
 
//PoseRay default Light attached to the camera
light_source {
              <0,-6.71120001238812E-9,0.78021562319> //light position
              color rgb <1,1,1>*1.6
              parallel
              point_at <0,-6.7112E-9,0>
              rotate <0,0,0> //roll
              rotate <-25,0,0> //elevation
              rotate <0,45,0> //rotation
             }
 
//Background
background { color srgb<1,1,1>  }
 
//Assembled object that is contained in Woman_POV_geom.inc with no SSLT components
object{
      Woman_
      }
 
//Assembled object that is contained in Woman_POV_geom.inc with SSLT components
object{
      Woman__sslt1
      material{interior{ior 1.3}}
      }
 
//Assembled object that is contained in Woman_POV_geom.inc with SSLT components
object{
      Woman__sslt7
      material{interior{ior 1.3}}
      }
 
//Assembled object that is contained in Woman_POV_geom.inc with SSLT components
object{
      Woman__sslt8
      material{interior{ior 1.3}}
      }
//==================================================
