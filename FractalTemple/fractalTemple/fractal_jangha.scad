include<../basicFunctions/jangha.scad>;
include<../basicFunctions/doorway.scad>;

//temple_profile = [ [0,0],[0,20],[20,20],[20,0] ];
temple_profile = [ [0,0],[10,0],[10,2],[12,2],[12,0],[14,0],[14,2],[16,2],[16,0],[20,0],[20,2],[35,2],[35,0],[39,0],[39,2],[41,2],[41,0],[43,0],[43,2],[45,2],[45,0],
                   [55,0],[55,10],[53,10],[53,12],[55,12],[55,14],[53,14],[53,16],[55,16],[55,20],[53,20],[53,35],[55,35],[55,39],[53,39],[53,41],[55,41],[55,43],[53,43],[53,45],[55,45],
                   [55,55],[45,55],[45,53],[43,53],[43,55],[41,55],[41,53],[39,53],[39,55],[35,55],[35,53],[20,53],[20,55],[16,55],[16,53],[14,53],[14,55],[12,55],[12,53],[10,53],[10,55],
                    [0,55],[0,45],[2,45],[2,43],[0,43],[0,41],[2,41],[2,39],[0,39],[0,35],[2,35],[2,20],[0,20],[0,16],[2,16],[2,14],[0,14],[0,12],[2,12],[2,10],[0,10]  ];

temple_mid_profile = [ [10,10],[45,10],[45,45],[10,45] ];

temple_center_offset = [ -27.5,-27.5,0 ];

jangha_height_array = [ 5, 10, 5, 10, 5, 2];
jangha_size_array = [ 1, 0.97, 1, 0.97, 1, 1.04 ];
jangha_diagonal_array = [ 0, 0, 0, 0, 0, 1]; //1st element must be 0 

jangha(temple_profile, temple_mid_profile, temple_center_offset, jangha_height_array, jangha_size_array,jangha_diagonal_array );

translate([25,0,0])
doorway(10,2);

translate([-25,0,0])
rotate([0,0,180])
doorway(10,2);

translate([0,25,0])
rotate([0,0,90])
doorway(10,2);

translate([0,-25,0])
rotate([0,0,-90])
doorway(10,2);
    



