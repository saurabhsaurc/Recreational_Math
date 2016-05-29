
//kuta( 10,20, 30);

function kuta_scale(h,curvature,kuta_radius) = (kuta_radius - curvature*( 1 - cos( asin( h/curvature ) ) ) )/kuta_radius;

module kuta(kuta_radius ,height, curvature )
{
    //Inputs:
    //kuta_radius- radius of the base of the kuta
    //height - height of the kuta
    //curvature - radius of curvature  
  
    //Max limit on curvature: R = (h^2 - r^2)/2r   
    
    linear_extrude(height = 1)
    circle(r=kuta_radius);
    
    for(i=[2:height])
    {
        section_scale = kuta_scale(i,curvature,kuta_radius)/kuta_scale(i-1,curvature,kuta_radius);
        
        section_scale_prev = kuta_scale(i-1,curvature,kuta_radius);
        
        translate([0,0,i-1])
        linear_extrude(height = 1,scale=section_scale )
        circle(r=kuta_radius*section_scale_prev);
    }
    
    $fn = 30;
    translate([0,0,height])
    sphere(r=(kuta_radius - curvature*( 1 - cos( asin( height/curvature ) ) ) ) );
}
