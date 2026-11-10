// author:   Gisele Vitória Cassuboski  
// date:   2024                               
// Trabalho 1 CG 


//--------------------------------------------------------------------------
#version 3.7;
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

#include "textures.inc"  // pre-defined scene elements    
#include "shapes.inc" 
#include "glass.inc" 
#include "metals.inc" 
#include "woods.inc"  





// Cameras 
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 75      // front view
                            location  <0.0 , 1.0 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}    
#declare Camera_0_1 = camera {/*ultra_wide_angle*/ angle 75      // front view
                            location  <0.0 , 1.0 ,-18.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
                                                        
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-18.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 75      // Visão lateral em formato de L
                            location  <-18.0 , 0 , 3>     // Localização da câmera
                            right     x*image_width/image_height
                            look_at   <10.0 , 0.0 , -10.0>}   // Direção de olhar   
#declare Camera_2_2 = camera {/*ultra_wide_angle*/ angle 75      // Visão lateral em formato de L
                            location  <-30.0 , 0 , 3>     // Localização da câmera
                            right     x*image_width/image_height
                            look_at   <10.0 , 0.0 , -10.0>}   // Direção de olhar
#declare Camera_3 = camera {
                            angle 90 
                            location <0, 17, 0>   // Posição da câmera acima do plano XY
                            look_at <0, 0, 0>     // Direção de olhar para o centro da cena
                            up <0, 0, -1>         // Vetor "up" apontando para baixo
                        }
                                               
camera{Camera_0_1} 


// Sun / Luzes
//light_source{<1500,2500,-2500> color White}   
//light_source {<20, 20, -20> color White  }   

// Fontes de luz para efeito fantasmagórico
light_source {
  <20, 20, -20>
  color rgb <1, 0.5, 0>
  fade_distance 60
  fade_power 2
}

light_source {
  <-20, 20, 20>
  color rgb <0, 1, 0.5>
  fade_distance 60
  fade_power 2
}

// Sky
sky_sphere { 
        pigment { gradient <0,1,0>
       color_map { [0.00 rgb <0.8,0.9,1.0>]
                   [0.35 rgb <0.0,0.1,0.8>]
                   [0.65 rgb <0.0,0.1,0.8>]
                   [1.00 rgb <0.8,0.9,1.0>] 
                 } 
       scale 2         
     } // end of pigment
} //end of skysphere


/*plane{ <0,1,0>, 0 
       texture{ Polished_Chrome
                normal{ bumps 0.25 scale <0.25,0.25,0.25>*0.5 turbulence 0.5 } 
                finish{ reflection 0.60 }}}
*/


// Parede
isosurface { 

  function { x }
  contained_by { box { -2, 2 } }
  accuracy 0.003
  max_gradient 5

  texture{ pigment{ color rgb <0.7451, 0.8039, 0.7608>}
         finish { specular 0.2 phong 1}}    
     
  scale < 10, 2, 0.2>
  rotate<0,0,0>
  translate <10, 0, 8>
} // end of isosurface      

// Piso
isosurface {

  function { x }
  contained_by { box { -2, 2 } }
  accuracy 0.003
  max_gradient 5

  texture{ pigment{ color rgb <0.7451, 0.8039, 0.7608>}
           finish { specular 0.2 phong 1}}
  scale < 10,4.2, 0.2>
  rotate<90,0,0>
  translate <10, -4, 0>
} // end of isosurface      
                
  

// Chapéus de espetos      
lathe {
    linear_spline
    6,
    <0,0>, <1,1>, <3,2>, <2,3>, <2,4>, <0,4>
    pigment { Blue }
    finish {
      ambient .3
      phong .75
    }      
    scale < 0.5, 0.5, 0.5> 
    translate <-3, 1.5, -3>    // x, y, z    
     rotate<0,0,180>
} 
 
lathe {
    linear_spline
    6,
    <0,0>, <1,1>, <3,2>, <2,3>, <2,4>, <0,4>
    pigment { Red }
    finish {
      ambient .3
      phong .75
    }      
    scale < 0.5, 0.5, 0.5> 
    translate <-5, 1.5, 3>    // x, y, z    
    rotate<0,0,180>
}      
      

 
lathe {
    linear_spline
    6,
    <0,0>, <1,1>, <3,2>, <2,3>, <2,4>, <0,4>  
    
    pigment { Green }
    finish {
      ambient .3
      phong .75
    }      
    scale < 0.5, 0.5, 0.5> 
    translate <-8, 1.5,-3>    // x, y, z    
    rotate<0,0,180>
}

// Epelho fundo
cylinder
{ 
        0, y, 4
      pigment { 
        rgb <1, .9, .2> 
        
      }
      finish { 
        specular 1 
        reflection .5 
        
      }
      normal
      { wood 1
        rotate x*90
      }          
      
       rotate x*90  
       translate <5, 0, 7>                        
 
}     


// Espelho a baixo taca
cylinder
{ 0, y, 4
  pigment {
    rgb <0.5, 0, 0.5>
  }
  finish {
    reflection .5 
  }
     
  translate <-6, -4.3, -3>    // x, y, z  
}



// Taça            
sor {
    8,
    <0.0,  -0.5>,
    <3.0,   0.0>,
    <1.0,   0.2>,
    <0.5,   0.4>,
    <0.5,   4.0>,
    <1.0,   5.0>,
    <3.0,  10.0>,
    <4.0,  11.0> 
    
    scale 0.4  
    translate <-1, 5, -2.5>    // x, y, z    
    rotate<-10,30, 85>
   
    //open
    //texture { T_Gold_1B } 
      texture {
        pigment {
          bozo
          color_map {
            [0.0 rgb <0.8, 0.8, 0.8>]
            [0.8 rgb <0.6, 0.6, 0.6>]
            [1.0 rgb <0.5, 0.5, 0.5>]
          }
          
        }
        finish {
          ambient 0.1
          diffuse 0.9
          specular 0.2
          roughness 0.1
          reflection 0.2
        }   
     }
}    

  
// Pac-Man usando union 3 intersection de objetos
union { 
    // Corpo do Pac-Man
    intersection { 
        sphere { 
            0, 30 
        }
        sphere { 
            0, 28 inverse 
        }

        union {
            plane { 
                y, 0 
                rotate -35*x 
            }
            plane { 
                -y, 0 
                rotate 10*x 
            }
        }

        sphere { 
            -29*z, 1.5 inverse 
            rotate <16, -4, 0> 
        }
        sphere { 
            -29*z, 1.5 inverse 
            rotate <16, 4, 0> 
        }

        pigment { 
            rgb <.83, .67, 0> 
        }
        finish { 
            specular .5 
            roughness .1 
        }        
         // Adicionando escala para diminuir o tamanho
        scale 0.5
        
    }

    // Boca do Pac-Man
    intersection { 
        sphere { 
            0, 28 
        }

        union {
            plane { 
                y, -2 
                rotate -35*x 
            }
            plane { 
                -y, -2 
                rotate 10*x 
            }
        }

        pigment { 
            rgb <.29, 0, 0> 
        }
        finish { 
            ambient .05 
            diffuse .95 
        }  
         // Adicionando escala para diminuir o tamanho
        scale 0.5
        
    }

    // Língua do Pac-Man
    union { 
        sphere { 
            <3, 0, -15>, 10 
        }
        sphere { 
            <-3, 0, -15>, 10 
        }

        rotate -45*x

        pigment { 
            rgb <1, 0, 0> 
        }
        normal { 
            wrinkles .5 
            scale .5 
        }
        finish { 
            reflection .5 
        }   
         // Adicionando escala para diminuir o tamanho
        scale 0.3
        
    }

    // Olho direito do Pac-Man
    union { 
        union {
            sphere { 
                0, 6 
                pigment { 
                    rgb 1 
                } 
            }
            sphere { 
                -2.3*z, 4 
                pigment { 
                    rgb <.11, .19, .67> 
                } 
            }
            sphere { 
                -5.5*z, 1 
                pigment { 
                    rgb 0 
                } 
            }

            finish { 
                reflection .5 
            }
        }

        sphere {
            0, 1

            scale <9, 2, 9>
            translate <0, 8, 6>
            rotate -10*z

            pigment { 
                rgb 0 
            }
        }

        rotate <-25, -20, 0>
        translate -26*z
        rotate <25, 20, 0>  
         // Adicionando escala para diminuir o tamanho
        scale 0.5
        
    }

    // Olho esquerdo do Pac-Man
    union { 
        union {
            sphere { 
                0, 6 
                pigment { 
                    rgb 1 
                } 
            }
            sphere { 
                -2.3*z, 4 
                pigment { 
                    rgb <.11, .19, .67> 
                } 
            }
            sphere { 
                -5.5*z, 1 
                pigment { 
                    rgb 0 
                } 
            }

            finish { 
                reflection .5 
            }
        }

        sphere {
            0, 1

            scale <9, 2, 9>
            translate <0, 8, 6>
            rotate 10*z

            pigment { 
                rgb 0 
            }
        }

        rotate <-25, 20, 0>
        translate -26*z
        rotate <25, -20, 0>    
         // Adicionando escala para diminuir o tamanho
        scale 0.5
        
    }
            
            
    translate -1*y    
    translate -10*x     
    translate 20*z
     // Adicionando escala para diminuir o tamanho
       scale 0.2     
       
     rotate <0, -20, 0> 
     
     
        
}       

// Segundo Pac-man  doido
    
// Criar o Pac-Man usando uma união de objetos
union { 
    // Corpo do Pac-Man
    intersection { 
        sphere { 
            0, 30 
        }
        sphere { 
            0, 28 inverse 
        }

        union {
            plane { 
                y, 0 
                rotate -35*x 
            }
            plane { 
                -y, 0 
                rotate 10*x 
            }
        }

        sphere { 
            -29*z, 1.5 inverse 
            rotate <16, -4, 0> 
        }
        sphere { 
            -29*z, 1.5 inverse 
            rotate <16, 4, 0> 
        }

        pigment { 
            rgb <.83, .67, 0> 
        }
        finish { 
            specular .5 
            roughness .1 
        }        
         // Adicionando escala para diminuir o tamanho
        scale 0.5
        
    }

   

    // Língua do Pac-Man
    union { 
        sphere { 
            <3, 0, -15>, 10 
        }
        sphere { 
            <-3, 0, -15>, 10 
        }

        rotate -45*x

        pigment { 
            rgb <1, 0, 0> 
        }
        normal { 
            wrinkles .5 
            scale .5 
        }
        finish { 
            reflection .5 
        }   
         // Adicionando escala para diminuir o tamanho
        scale 0.45
        
    }

    // Olho direito do Pac-Man
    union { 
        union {
            sphere { 
                0, 6 
                pigment { 
                    rgb 1 
                } 
            }
            sphere { 
                -2.3*z, 4 
                pigment { 
                    rgb <.11, .19, .67> 
                } 
            }
            sphere { 
                -5.5*z, 1 
                pigment { 
                    rgb 0 
                } 
            }

            finish { 
                reflection .5 
            }
        }


        rotate <-25, -20, 0>
        translate -26*z
        rotate <25, 20, 0>  
         // Adicionando escala para diminuir o tamanho
        scale 0.55
        
    }

    // Olho esquerdo do Pac-Man
    union { 
        union {
            sphere { 
                0, 6 
                pigment { 
                    rgb 1 
                } 
            }
            sphere { 
                -2.3*z, 4 
                pigment { 
                    rgb <.11, .19, .67> 
                } 
            }
            sphere { 
                -5.5*z, 1 
                pigment { 
                    rgb 0 
                } 
            }

            finish { 
                reflection .5 
            }
        }

        

        rotate <-25, 20, 0>
        translate -26*z
        rotate <25, -20, 0>    
         // Adicionando escala para diminuir o tamanho
        scale 0.7
        
    }
            
            
    translate 55*z 
    translate -5*x    
    translate -15*y
     // Adicionando escala para diminuir o tamanho
      scale 0.1   
       
     rotate <0, 120, 0> 
        
}  


// Escada
union{
 // Caixa com textura de madeira
  box { 
    <-0.5, -0.5, -0.5>, <0.5, 0.5, 0.5>
    texture { 
      T_Wood1 
    }
    translate <1, -1.5, 0>  
     scale 0.2*y 
    scale 1*x
    scale 2*z
  } 
  
   // Caixa com textura de madeira
  box { 
    <-0.5, -0.5, -0.5>, <0.5, 0.5, 0.5>
    texture { 
      T_Wood1 
    }
    translate <1.5, -1, 0>  
     scale 0.2*y
    scale 1*x
    scale 2*z
  }  
     // Caixa com textura de madeira
  box { 
    <-0.5, -0.5, -0.5>, <0.5, 0.5, 0.5>
    texture { 
      T_Wood1 
    }
    translate <2, 0, 0>  
    scale 0.2*y 
    scale 1*x
    scale 2*z
  }   
  
  
  rotate <0,180,0> 
  translate <0, -3.2, -3.5>  
  
  
  
}
  
// Cilindro que segura corrente
cylinder { 
	<0, 1, 0>, // Center of one end 
	<1, 2, 3>, // Center of other end 
	0.4 // Radius 
	open // Remove end caps 
	texture { T_Stone25 scale 4 }  
	rotate<115,100,0> 
	translate <-10.5,-0.2,4.9> 
	
} 
 
// Corrente 
union { 
   
  
        torus {
          1, 0.2   // main radius and tube radius  
          rotate <65,30,0> 
          translate <0,-4.5, -5>  // translate by the vector (1,0,0)
          pigment { Blue }
        }
        
        torus {
          1, 0.2 // main radius and tube radius. (the torus's directrix is the y-axes)
          rotate <-30,0,0>      // rotate around x-axis 30°
          translate <1,-4, -5>  // translate by the vector (1,0,0)
          pigment { Red }
        } 
        
        torus {
          1, 0.2   // main radius and tube radius      
          rotate <-90,0,0>      // rotate around x-axis 30°
          translate <2.5,-3.5, -5>  // translate by the vector (1,0,0)
          pigment { Yellow }
        }
        
        torus {
          1.3, 0.2 // main radius and tube radius. (the torus's directrix is the y-axes)
          rotate <-30,30,0>      // rotate around x-axis 30°
          translate <3.5, -2.8, -5>  // translate by the vector (1,0,0)
          pigment { rgb 1 }
        }
           
                         
       translate <-14,0,9>  
    
    
} 
 
// Objeto na frente Box com um corte no meio em forma de cone 
difference { 

    // Caixa
    box { 
        <-1, 0, -1>, // Canto inferior esquerdo próximo 
        < 1, 0.5, 3> // Canto superior direito distante 
        texture { 
            T_Stone25 // Textura predefinida do arquivo stones.inc 
            scale 4 // Escala pelo mesmo valor em todas as direções 
        } 
        rotate y*60 // Equivalente a "rotate <0,60,0>" 
    }   
    
    // Cone
    cone { 
        <-1, 0.25, -1>, 0.3// Centro e raio de uma extremidade 
        < 1, 0.75, 3>, 1.0 // Centro e raio da outra extremidade 
        open // Remove as tampas das extremidades 
        texture { 
            T_Stone33 // Textura predefinida do arquivo stones.inc 
            scale 4 
        } 
        pigment {
            checker color Red, color Blue
        }
        rotate 20*y   
        rotate 10*x  
        rotate 20*y  
        scale 0.7
    }
    // Rotações adicionais para garantir que os objetos se encontrem
    rotate 210*y   
    rotate 90*x  
    scale 0.5
    translate <7, -2.7, -6>    // x, y, z  
}
  

// Sorvete 
  
union { 

    // Casquinha
     cone { 
    	<0, 1, 0>, 0 // Center and radius of one end 
    	<1, 2, 3>, 1// Center and radius of other end 
    	open // Removes end caps 
    	texture { T_Wood3 	scale 4 	} 
    	
    	rotate x*130  
    	translate <0, 1, 2>    // x, y, z  
    	scale 0.9
    	
	
    }           
      
    // Bola
    sphere {
        <0,0,0>,1
        texture { Brass_Valley }
        translate <1, -2., 0>    
        scale 1.3
    }  
    
    
    translate <0.5, 0, 4>    // x, y, z  
    


}
