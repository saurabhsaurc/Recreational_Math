
module vimana(vimana_base_rad,vimana_base_height, vimana_cone_height, vimana_cone_rad, vimana_sphere_rad, vimana_cone_scale )
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

}