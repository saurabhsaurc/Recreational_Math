//Creates a doorway
//doorway(10,4);

module doorway( doorway_size,doorway_thickness )
{
    doorway_size_small = doorway_size - 2;
    
    translate([doorway_thickness,0,0])
    rotate([0,-90,0])
    linear_extrude(height=doorway_thickness)
    union(){
    translate([0,-doorway_size/2,0])
    square([doorway_size,doorway_size]);

    translate([doorway_size,0,0])
    circle(r=doorway_size/2);
    }
    
    translate([2*doorway_thickness,0,0])
    rotate([0,-90,0])
    linear_extrude(height=doorway_thickness)
    difference(){
        
    union(){
        
    translate([0,-doorway_size/2,0])
    square([doorway_size,doorway_size]);

    translate([doorway_size,0,0])
    circle(r=doorway_size/2);
        
    }
    
    union(){
        
    translate([0,-doorway_size_small/2,0])
    square([doorway_size_small,doorway_size_small]);

    translate([doorway_size_small,0,0])
    circle(r=doorway_size_small/2);
        
    }
    
    }
    
}