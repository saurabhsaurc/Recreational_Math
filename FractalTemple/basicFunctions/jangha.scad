function cumulative_height(height_array,index) = ( index < 0 ) ? 0 : height_array[index] + cumulative_height(height_array,index-1) ;

//Actually this is just the same thing as pitha
module jangha(temple_profile,temple_mid_profile, temple_center_offset,height_array, size_array, diagonal_array)
{
    //Inputs:
    //temple profile - set of points to form a polygon for the profile
    //temple mid profile - Middle of the profile, to be left out (hollow)
    //temple center offset - x,y offset array for centering
    //height array - height of each section from bottom to top
    //Size array - scaling for each section
    //Diagonal array - specifies if we should have diagonal angle from previous section or not
    
    
    for(i=[0:len(height_array)-1])
    {
        if(diagonal_array[i]==0)
        {
            section_profile = temple_profile*size_array[i];
            section_center_offset = temple_center_offset*size_array[i];
                    
            translate([0,0,cumulative_height(height_array,i-1)])
            linear_extrude(height = height_array[i])
            difference(){
                translate(section_center_offset)
                polygon(points=section_profile);
                
                translate(temple_center_offset)
                polygon(points=temple_mid_profile);
            }
        }
        else{
            section_profile = temple_profile*size_array[i-1];
            section_center_offset = temple_center_offset*size_array[i-1];
            section_scale = size_array[i]/size_array[i-1];
                
            translate([0,0,cumulative_height(height_array,i-1)])
            linear_extrude(height = height_array[i],scale = section_scale)
            difference(){
                translate(section_center_offset)
                polygon(points=section_profile);
                
                translate(temple_center_offset)
                polygon(points=temple_mid_profile);
            }
        }
        
    }
}
