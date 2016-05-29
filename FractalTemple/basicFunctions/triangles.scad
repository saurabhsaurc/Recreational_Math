/*triangle_points = [ [0,0], [0,10], [10,10], [10,20], [20,20], [20,30], [30,30], [30,20], [40,20], [40,10], [50,10], [50,0] ];

triangle_offset = 25;
triangle_step_height = 5;
*/

module triangles(triangle_points,triangle_offset,triangle_step_height)
{
    rotate([90,0,0])
    union(){
        
    linear_extrude(height=triangle_step_height)
    translate([-triangle_offset,0,0])
    polygon(points=triangle_points);

    linear_extrude(height=triangle_step_height*2)
    translate([-triangle_offset*0.8,0,0])
    polygon(points=triangle_points*0.8);

    linear_extrude(height=triangle_step_height*3)
    translate([-triangle_offset*0.6,0,0])
    polygon(points=triangle_points*0.6);
        
    }
    
}