/*
vimana_base_rad = 8;
vimana_base_height = 5;
vimana_cone_height = 5;
vimana_cone_rad = 6;
vimana_cone_scale = 0.3;
vimana_sphere_rad=2;

num_lugs = 20;
lug_thickness = 0.5;
lug_retract_distance = 1;

lugged_vimana(vimana_base_rad,vimana_base_height, vimana_cone_height, vimana_cone_rad, vimana_sphere_rad, vimana_cone_scale, num_lugs, lug_thickness,lug_retract_distance );
*/

module lugged_vimana(vimana_base_rad,vimana_base_height, vimana_cone_height, vimana_cone_rad, vimana_sphere_rad, vimana_cone_scale, num_lugs, lug_thickness,lug_retract_distance )
{

$fn=50;
 minkowski(){
            
            translate([0,0,vimana_base_height/2])            
            linear_extrude(height = 0.1)
            circle(r=vimana_base_rad);
     
            sphere(r=vimana_base_height/2);      
}

translate([0,0,vimana_base_height])            
linear_extrude(height = vimana_cone_height, scale=vimana_cone_scale )
circle(r=vimana_cone_rad);

translate([0,0,vimana_base_height+vimana_cone_height+vimana_sphere_rad/2])  
sphere(r=vimana_sphere_rad);

//Lugs
angle_between_lugs = 360/num_lugs; //In degrees
r = vimana_base_rad + vimana_base_height/2 - lug_retract_distance;
    
for(i=[1:num_lugs]){
    
phi = angle_between_lugs*i;
    
translate([r*cos(phi),r*sin(phi),vimana_base_height/2])
rotate([0,90,phi-90])
linear_extrude(height=lug_thickness)
circle(r=vimana_base_height/2);
    
}

}