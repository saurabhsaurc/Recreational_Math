function sikhara_scale(h,curvature,base_length) = (base_length - curvature*( 1 - cos( asin( h/curvature ) ) ) )/base_length;

module sikhara(temple_profile, temple_center_offset,height, num_storeys, curvature, base_length )
{
    //Inputs:
    //temple profile - set of points to form a polygon for the pofile
    //temple center offset - x,y offset array for centering
    //height - height of the sikhara
    //num_storeys - number of storeys or bhumis
    //curvature - radius of curvature  
  
    //Max limit on curvature: R = (h^2 - b^2)/2b    
    storey_height = floor(height/num_storeys);
    
    linear_extrude(height = 1)
    translate(temple_center_offset)
    polygon(points=temple_profile);
    
    for(i=[2:height])
    {
        section_scale = sikhara_scale(i,curvature,base_length)/sikhara_scale(i-1,curvature,base_length);
        
        section_scale_prev = sikhara_scale(i-1,curvature,base_length);
                
        if(i%storey_height == 0) {
            section_scale = 1.0*sikhara_scale(i,curvature,base_length)/sikhara_scale(i-1,curvature,base_length);
            section_scale_prev = 1.05*sikhara_scale(i-1,curvature,base_length);
            
            translate([0,0,i-1])
            linear_extrude(height = 1,scale=section_scale )
            translate(temple_center_offset*section_scale_prev)
            polygon(points=temple_profile*section_scale_prev);
        }
        
        translate([0,0,i-1])
        linear_extrude(height = 1,scale=section_scale )
        translate(temple_center_offset*section_scale_prev)
        polygon(points=temple_profile*section_scale_prev);
    }
}
