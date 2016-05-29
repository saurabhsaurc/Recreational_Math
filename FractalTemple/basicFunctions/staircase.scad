//Creates a staircase
/*
stair_side_profile = [ [0,0],[12,0],[12,4],[0,8] ];

stair_width = 10;
num_stairs = 6;
stair_step_height = 1;
stair_step_width = 2;

staircase( stair_side_profile, stair_width, num_stairs, stair_step_height, stair_step_width );
*/

module staircase( stair_side_profile, stair_width, num_stairs, stair_step_height, stair_step_width )
{

    translate([0,stair_width/2,0])
    rotate([90,0,0])
    linear_extrude(height=2)
    polygon(stair_side_profile);

    translate([0,-stair_width/2,0])
    rotate([90,0,0])
    linear_extrude(height=2)
    polygon(stair_side_profile);

    for( i= [1:num_stairs])
    {
        translate([0,-stair_width/2,(i-1)*stair_step_height])
        cube(size=[(num_stairs-i+1)*stair_step_width,stair_width,stair_step_height]);
    }

}