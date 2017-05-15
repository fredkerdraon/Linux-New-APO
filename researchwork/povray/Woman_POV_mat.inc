//==================================================
//POV-Ray Materials list
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
 
//Macros used by PoseRay to manipulate pigments
//October 06, 2010
//By FlyerX 

#macro pigment_gray(p1)
//converts to grayscale
#local PR1 = function {pigment{p1}}
#local PR_Gray=function (x,y,z) {0.2126*PR1(x,y,z).red+0.7152*PR1(x,y,z).green+0.0722*PR1(x,y,z).blue}
function{PR_Gray(x,y,z)}
#end  

#macro pigment_multiply(p1,p2)
//multiplies two pigments
#local PR1 = function {pigment{p1}}
#local PR2 = function {pigment{p2}}
#local PR_FRed=function (x,y,z) {PR1(x,y,z).red*PR2(x,y,z).red}
#local PR_FGrn=function (x,y,z) {PR1(x,y,z).green*PR2(x,y,z).green}
#local PR_FBlu=function (x,y,z) {PR1(x,y,z).blue*PR2(x,y,z).blue} 
average pigment_map{
    [function{PR_FRed(x,y,z)} color_map{[0 rgb 0][1 rgb <1,0,0>*3]}]  //add each color and then divide by 3
    [function{PR_FGrn(x,y,z)} color_map{[0 rgb 0][1 rgb <0,1,0>*3]}]
    [function{PR_FBlu(x,y,z)} color_map{[0 rgb 0][1 rgb <0,0,1>*3]}]    
  }
#end       

#macro pigment_transmit(p1,tr)
//sets the transparency to tr
#local PR1 = function {pigment{p1}} 
#local PR_FRed=function (x,y,z) {PR1(x,y,z).red}
#local PR_FGrn=function (x,y,z) {PR1(x,y,z).green}
#local PR_FBlu=function (x,y,z) {PR1(x,y,z).blue} 
average pigment_map{
    [function{PR_FRed(x,y,z)} color_map{[0 rgbft <0,0,0,0,tr>][1 rgbft <1,0,0,0,tr/3>*3]}]
    [function{PR_FGrn(x,y,z)} color_map{[0 rgbft <0,0,0,0,tr>][1 rgbft <0,1,0,0,tr/3>*3]}]
    [function{PR_FBlu(x,y,z)} color_map{[0 rgbft <0,0,0,0,tr>][1 rgbft <0,0,1,0,tr/3>*3]}]   
  }
#end  

#macro pigment_process(p1,p2,tr)
//multiplies two pigments and sets the transparency to tr
#local PR1 = function {pigment{p1}}
#local PR2 = function {pigment{p2}}
#local PR_FRed=function (x,y,z) {PR1(x,y,z).red*PR2(x,y,z).red}
#local PR_FGrn=function (x,y,z) {PR1(x,y,z).green*PR2(x,y,z).green}
#local PR_FBlu=function (x,y,z) {PR1(x,y,z).blue*PR2(x,y,z).blue} 
average pigment_map{
    [function{PR_FRed(x,y,z)} color_map{[0 rgbft <0,0,0,0,tr>][1 rgbft <1,0,0,0,tr/3>*3]}]
    [function{PR_FGrn(x,y,z)} color_map{[0 rgbft <0,0,0,0,tr>][1 rgbft <0,1,0,0,tr/3>*3]}]
    [function{PR_FBlu(x,y,z)} color_map{[0 rgbft <0,0,0,0,tr>][1 rgbft <0,0,1,0,tr/3>*3]}]    
  }
#end   


#macro pigment_add(p1,p2)
//adds two pigments - values are clamped from 0 to 1
#local PR1 = function {pigment{p1}}
#local PR2 = function {pigment{p2}}
#local PR_FRed=function (x,y,z) {clamp(PR1(x,y,z).red+PR2(x,y,z).red,0,1)}
#local PR_FGrn=function (x,y,z) {clamp(PR1(x,y,z).green+PR2(x,y,z).green,0,1)}
#local PR_FBlu=function (x,y,z) {clamp(PR1(x,y,z).blue+PR2(x,y,z).blue,0,1)}
average pigment_map{
    [function{PR_FRed(x,y,z)} color_map{[0 rgb 0][1 rgb <1,0,0>*3]}]
    [function{PR_FGrn(x,y,z)} color_map{[0 rgb 0][1 rgb <0,1,0>*3]}]
    [function{PR_FBlu(x,y,z)} color_map{[0 rgb 0][1 rgb <0,0,1>*3]}]
  }
#end 

#macro pigment_substract(p1,p2)
//substracts two pigments - values are clamped from 0 to 1
#local PR1 = function {pigment{p1}}
#local PR2 = function {pigment{p2}}
#local PR_FRed=function (x,y,z) {clamp(PR1(x,y,z).red-PR2(x,y,z).red,0,1)}
#local PR_FGrn=function (x,y,z) {clamp(PR1(x,y,z).green-PR2(x,y,z).green,0,1)}
#local PR_FBlu=function (x,y,z) {clamp(PR1(x,y,z).blue-PR2(x,y,z).blue,0,1)}
average pigment_map{
    [function{PR_FRed(x,y,z)} color_map{[0 rgb 0][1 rgb <1,0,0>*3]}]
    [function{PR_FGrn(x,y,z)} color_map{[0 rgb 0][1 rgb <0,1,0>*3]}]
    [function{PR_FBlu(x,y,z)} color_map{[0 rgb 0][1 rgb <0,0,1>*3]}]
  }
#end

#macro pigment_power(p1,n)
//raises a pigment to a power - works with images with no mask (jpeg, bmp...)
#local PR1 = function {pigment{p1}}
#local PR_FRed=function (x,y,z) {pow(PR1(x,y,z).red,n)}
#local PR_FGrn=function (x,y,z) {pow(PR1(x,y,z).green,n)}
#local PR_FBlu=function (x,y,z) {pow(PR1(x,y,z).blue,n)}
average pigment_map{
    [function{PR_FRed(x,y,z)} color_map{[0 rgb 0][1 rgb <1,0,0>*3]}]
    [function{PR_FGrn(x,y,z)} color_map{[0 rgb 0][1 rgb <0,1,0>*3]}]
    [function{PR_FBlu(x,y,z)} color_map{[0 rgb 0][1 rgb <0,0,1>*3]}]
  }
#end 


#macro pigment_step(p1,s)
//makes a pigment black if color < s or white otherwise
#local PR1 = function {pigment{p1}}
#local PR_FRed=function (x,y,z) {0.5*(sgn(PR1(x,y,z).red-s)+1)}
#local PR_FGrn=function (x,y,z) {0.5*(sgn(PR1(x,y,z).green-s)+1)}
#local PR_FBlu=function (x,y,z) {0.5*(sgn(PR1(x,y,z).blue-s)+1)}
average pigment_map{
    [function{PR_FRed(x,y,z)} color_map{[0 rgb 0][1 rgb <1,0,0>*3]}]
    [function{PR_FGrn(x,y,z)} color_map{[0 rgb 0][1 rgb <0,1,0>*3]}]
    [function{PR_FBlu(x,y,z)} color_map{[0 rgb 0][1 rgb <0,0,1>*3]}]
  }
#end  

#macro pigment_luminance(p1)
//calculate luminance from RGB colors
#local PR1 = function {pigment{p1}}
#local PR_FRed=function (x,y,z) {0.2126*PR1(x,y,z).red + 0.7152*PR1(x,y,z).green + 0.0722*PR1(x,y,z).blue}
#local PR_FGrn=function (x,y,z) {0.2126*PR1(x,y,z).red + 0.7152*PR1(x,y,z).green + 0.0722*PR1(x,y,z).blue}
#local PR_FBlu=function (x,y,z) {0.2126*PR1(x,y,z).red + 0.7152*PR1(x,y,z).green + 0.0722*PR1(x,y,z).blue}
average pigment_map{
    [function{PR_FRed(x,y,z)} color_map{[0 rgb 0][1 rgb <1,0,0>*3]}]
    [function{PR_FGrn(x,y,z)} color_map{[0 rgb 0][1 rgb <0,1,0>*3]}]
    [function{PR_FBlu(x,y,z)} color_map{[0 rgb 0][1 rgb <0,0,1>*3]}]
  }
#end  

#macro pigment_invert(p1)
//inverts the color -> 1-RGB
#local PR1 = function {pigment{p1}}
#local PR_FRed=function (x,y,z) {1-PR1(x,y,z).red}
#local PR_FGrn=function (x,y,z) {1-PR1(x,y,z).green}
#local PR_FBlu=function (x,y,z) {1-PR1(x,y,z).blue}
average pigment_map{
    [function{PR_FRed(x,y,z)} color_map{[0 rgb 0][1 rgb <1,0,0>*3]}]
    [function{PR_FGrn(x,y,z)} color_map{[0 rgb 0][1 rgb <0,1,0>*3]}]
    [function{PR_FBlu(x,y,z)} color_map{[0 rgb 0][1 rgb <0,0,1>*3]}]
  }
#end  

#macro pigment_mix(p1,p2,xv)
//mixes two pigments on a sliding scale xv from 0 to 1 
#local PR1 = function {pigment{p1}}
#local PR2 = function {pigment{p2}}
#local PR_FRed=function (x,y,z) {PR1(x,y,z).red*(1-xv)+PR2(x,y,z).red*xv}
#local PR_FGrn=function (x,y,z) {PR1(x,y,z).green*(1-xv)+PR2(x,y,z).green*xv}
#local PR_FBlu=function (x,y,z) {PR1(x,y,z).blue*(1-xv)+PR2(x,y,z).blue*xv}
average pigment_map{
    [function{PR_FRed(x,y,z)} color_map{[0 rgb 0][1 rgb <1,0,0>*3]}]
    [function{PR_FGrn(x,y,z)} color_map{[0 rgb 0][1 rgb <0,1,0>*3]}]
    [function{PR_FBlu(x,y,z)} color_map{[0 rgb 0][1 rgb <0,0,1>*3]}]
  }
#end

//=======================================

#macro power_ramp(xv,xa,xb,ya,yb,pw)
//generates a float with a power ramp from (xa,ya) to (xb,yb) with power pw and argument xv. 
//ramp slope is zero at xb
  ((ya-yb)/pow((xa-xb),pw))*pow((xv-xb),pw)+yb
#end

#macro power_ramp2(xv,xa,xb,ya,yb,pw)
//generates a float with a power ramp from (xa,ya) to (xb,yb) with power pw and argument xv. 
//ramp slope is zero at xa
  ((yb-ya)/pow((xb-xa),pw))*pow((xv-xa),pw)+ya
#end
 
//==================================================
//Map definitions
#declare p_map1=pigment {image_map{jpeg "./Maps/V5BreeEyesM.jpg" gamma srgb  transmit all 0 } }
#declare p_map2=pigment {image_map{jpeg "./Maps/V5BreeInMouthM.jpg" gamma srgb interpolate 2 transmit all 0 } }
#declare p_map3=pigment {image_map{jpeg "./Maps/V5BreeHeadM.jpg" gamma srgb interpolate 2 transmit all 0 } }
#declare p_map4=pigment {image_map{jpeg "./Maps/V5BreeLimbsM.jpg" gamma srgb interpolate 2 transmit all 0 } }
#declare p_map5=pigment {image_map{jpeg "./Maps/V5BreeHead3M.jpg" gamma srgb interpolate 2 transmit all 0 } }
#declare p_map6=pigment {image_map{jpeg "./Maps/V5BreeEyes6M.jpg" gamma srgb interpolate 2 transmit all 0 } }
#declare p_map7=pigment {image_map{jpeg "./Maps/V5BreeTorsoM.jpg" gamma srgb interpolate 2 transmit all 0 } }
#declare p_map8=pigment {image_map{tiff "./ConvertedMaps/V5BreeLashes2.tif" gamma 1.0  }}
 
//==================================================
//Material definitions
#declare Lacrimals_=
#declare PR_DIFFUSE=pigment{p_map1}


#declare F1=finish{specular albedo 0.2 //Max highlight intensity: 0 -> 1
                   roughness 0.00286312 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare InnerMouth_=
#declare PR_DIFFUSE=pigment{p_map2}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.2 //Max highlight intensity: 0 -> 1
                   roughness 0.00286312 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Pupils_=
#declare PR_DIFFUSE=pigment{p_map1}


#declare F1=finish{specular albedo 0 //Max highlight intensity: 0 -> 1
                   roughness 0.09632328 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Sclera_=
#declare PR_DIFFUSE=pigment{p_map1}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0 //Max highlight intensity: 0 -> 1
                   roughness 0.09632328 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <4.76,0.57,0.39>}
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Irises_=
#declare PR_DIFFUSE=pigment{p_map1}


#declare F1=finish{specular albedo 0 //Max highlight intensity: 0 -> 1
                   roughness 0.09632328 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Face_=
#declare PR_DIFFUSE=pigment{p_map3}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare TeethSurface_=
#declare PR_DIFFUSE=pigment {color srgb <1.00,1.00,1.00> transmit 0/100 }
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0 //Max highlight intensity: 0 -> 1
                   roughness 0.00286312 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0.2 fresnel} conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <8.51,5.57,3.95>}
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Legs_=
#declare PR_DIFFUSE=pigment{p_map4}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare EyeReflection_=
#declare PR_DIFFUSE=pigment {color srgb <1.00,1.00,1.00> transmit 100/100 }


#declare F1=finish{specular albedo 0 //Max highlight intensity: 0 -> 1
                   roughness 0.005259534 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0.2 fresnel} conserve_energy //reflection amount: 0 -> 1
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
            interior{ior 1.33}
}
//==================================================
#declare Nostrils_=
#declare PR_DIFFUSE=pigment{p_map5}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Lacrimals_Genesis_2_Female_=
#declare PR_DIFFUSE=pigment{p_map1}


#declare F1=finish{specular albedo 0.2 //Max highlight intensity: 0 -> 1
                   roughness 0.00286312 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Pupils_Genesis_2_Female_=
#declare PR_DIFFUSE=pigment{p_map6}


#declare F1=finish{specular albedo 0 //Max highlight intensity: 0 -> 1
                   roughness 0.09632328 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Lips_=
#declare PR_DIFFUSE=pigment{p_map5}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.05 //Max highlight intensity: 0 -> 1
                   roughness 0.00286312 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0.1 fresnel} conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Tear_=
#declare PR_DIFFUSE=pigment {color srgb <0.00,0.00,0.00> transmit 100/100 }


#declare F1=finish{specular albedo 0.2 //Max highlight intensity: 0 -> 1
                   roughness 0.00286312 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Gums_=
#declare PR_DIFFUSE=pigment{p_map2}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.2 //Max highlight intensity: 0 -> 1
                   roughness 0.00286312 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Irises_Genesis_2_Female_=
#declare PR_DIFFUSE=pigment{p_map6}


#declare F1=finish{specular albedo 0 //Max highlight intensity: 0 -> 1
                   roughness 0.09632328 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Teeth_=
#declare PR_DIFFUSE=pigment{p_map2}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0 //Max highlight intensity: 0 -> 1
                   roughness 0.09632328 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0.2 fresnel} conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <8.51,5.57,3.95>}
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Cornea_=
#declare PR_DIFFUSE=pigment {color srgb <1.00,1.00,1.00> transmit 100/100 }


#declare F1=finish{specular albedo 0 //Max highlight intensity: 0 -> 1
                   roughness 0.005259534 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0.2 fresnel} conserve_energy //reflection amount: 0 -> 1
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
            interior{ior 1.33}
}
//==================================================
#declare Face_Genesis_2_Female_=
#declare PR_DIFFUSE=pigment{p_map5}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Toenails_=
#declare PR_DIFFUSE=pigment{p_map4}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.1 //Max highlight intensity: 0 -> 1
                   roughness 0.01244878 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0.2 fresnel} conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Sclera_Genesis_2_Female_=
#declare PR_DIFFUSE=pigment{p_map6}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0 //Max highlight intensity: 0 -> 1
                   roughness 0.09632328 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <4.76,0.57,0.39>}
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Fingernails_=
#declare PR_DIFFUSE=pigment{p_map4}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.1 //Max highlight intensity: 0 -> 1
                   roughness 0.01244878 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0.2 fresnel} conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Head_=
#declare PR_DIFFUSE=pigment{p_map7}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Ears_=
#declare PR_DIFFUSE=pigment{p_map7}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Hands_=
#declare PR_DIFFUSE=pigment{p_map4}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Shoulders_=
#declare PR_DIFFUSE=pigment{p_map4}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Neck_=
#declare PR_DIFFUSE=pigment{p_map7}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Hips_=
#declare PR_DIFFUSE=pigment{p_map7}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Torso_=
#declare PR_DIFFUSE=pigment{p_map7}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Nipples_=
#declare PR_DIFFUSE=pigment{p_map7}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Forearms_=
#declare PR_DIFFUSE=pigment{p_map4}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Feet_=
#declare PR_DIFFUSE=pigment{p_map4}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.03 //Max highlight intensity: 0 -> 1
                   roughness 0.04839499 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare Eyelashes_=
#declare PR_DIFFUSE=pigment {color srgb <0.17,0.16,0.13> transmit 0/100 }


#declare F1=finish{specular albedo 0 //Max highlight intensity: 0 -> 1
                   roughness 0.06037706 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   }


#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                    }

#declare T2=texture{    pigment{color rgbft<0,0,0,1,1>} 
                        finish{ambient 0}}

material{
         texture{/*uv_mapping*/ 
                 pigment_pattern{uv_mapping p_map8 }
                 texture_map{
                     [0 T2]
                     [1 T1]
                     }}
}
//==================================================
#declare Tongue_=
#declare PR_DIFFUSE=pigment{p_map2}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.2 //Max highlight intensity: 0 -> 1
                   roughness 0.00286312 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
#declare InnerMouth_Genesis_2_Female_=
#declare PR_DIFFUSE=pigment{p_map2}
#declare PR_DIFFUSE=pigment{average pigment_map{ //Fix for SSLT in POV-Ray 3.7.0
   [1 PR_DIFFUSE]
   [0.001 color rgb 1]
}}


#declare F1=finish{specular albedo 0.2 //Max highlight intensity: 0 -> 1
                   roughness 0.00286312 //surface roughness: 0.0005 -> 1
                   phong albedo 0 phong_size 0 //Phong specular disabled
                   
                   ambient <0,0,0> emission srgb <0.00,0.00,0.00> //ambient RGB color: 0->1 for each component
                   diffuse albedo 0.6 
                   reflection{0 } conserve_energy //reflection amount: 0 -> 1
                   subsurface {translucency <3.67,1.37,0.68>}
                   }


#declare N1=
normal{agate 0.2 agate_turb 1.0 scale 0.01} 

#declare T1=texture{
                   pigment{uv_mapping PR_DIFFUSE }
                            finish{F1}
                        normal{N1}
                    }


material{
         texture{/*uv_mapping*/
                 T1
                }
}
//==================================================
