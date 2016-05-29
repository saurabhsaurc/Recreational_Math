include<../basicFunctions/sikhara.scad>;
include<../basicFunctions/vimana.scad>;
include<../basicFunctions/lugged_vimana.scad>;

//Vimana parameters
vimana_base_rad = 7;
vimana_base_height = 5;
vimana_cone_height = 5;
vimana_cone_rad = 6;
vimana_cone_scale = 0.3;
vimana_sphere_rad=2;

num_lugs = 20;
lug_thickness = 0.8;
lug_retract_distance = 1.8;

//Sikhara parameters
temple_profile = [ [0,0],[5,0],[5,-5], [10,-5], [10,-10], [20,-10],     [20,-5] ,[25,-5] ,[25,0] ,
                    [30,0],[30,5],[35,5],[35,10],[40,10],[40,20],       [35,20], [35,25] ,[30,25],
                    [30,30],[25,30],[25,35],[20,35],[20,40],[10,40],     [10,35],[5,35],[5,30],
                    [0,30],[0,25],[-5,25],[-5,20],[-10,20],[-10,10],    [-5,10],[-5,5],[0,5] 
        ];

temple_center_offset = [ -15,-15,0 ];

sikhara_num_storeys = 4; //ie. Bhumis
sikhara_height = 60;
sikhara_curvature = 150; //Radius of curvature for the largest segments
sikhara_base_length = 15*sqrt(2);

//Limit on radius of curvature
min_curvature = ( sikhara_height*sikhara_height + sikhara_base_length*sikhara_base_length )/(2*sikhara_base_length);

//Scaling factor for fractals
fractal_scaling = 0.5;

//Check for minimum radius of curvature
if(sikhara_curvature<min_curvature){
    echo("Curvature too small, minimum is",min_curvature);
}
else{
    //3 times recursion, initial scale 1
    fractal_sikhara(3,1);
}


//Recursive function
module fractal_sikhara( n, sikhara_scale ) {
    if(n>=1)
    {
        sikhara(sikhara_scale*temple_profile, sikhara_scale*temple_center_offset, sikhara_scale*sikhara_height, sikhara_num_storeys, sikhara_scale*sikhara_curvature, sikhara_scale*sikhara_base_length);
        
        translate([0,0,sikhara_scale*sikhara_height])
        lugged_vimana(sikhara_scale*vimana_base_rad,sikhara_scale*vimana_base_height, sikhara_scale*vimana_cone_height, sikhara_scale*vimana_cone_rad, sikhara_scale*vimana_sphere_rad, vimana_cone_scale, num_lugs, lug_thickness*sikhara_scale,lug_retract_distance*sikhara_scale );
        
        translate([0,sikhara_base_length*sikhara_scale,0])
        fractal_sikhara(n-1,sikhara_scale*fractal_scaling);
        
        translate([0,-sikhara_base_length*sikhara_scale,0])
        fractal_sikhara(n-1,sikhara_scale*fractal_scaling);
        
        translate([sikhara_base_length*sikhara_scale,0,0])
        fractal_sikhara(n-1,sikhara_scale*fractal_scaling);
        
        translate([-sikhara_base_length*sikhara_scale,0,0])
        fractal_sikhara(n-1,sikhara_scale*fractal_scaling);
        
    }    
} 


