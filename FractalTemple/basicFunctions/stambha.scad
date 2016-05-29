//Stambha,ie pillar
$fn=30;

//stambha_radius = 2;
//stambha_height = 50;

//stambha(stambha_radius,stambha_height);

module stambha(stambha_radius,stambha_height){

translate([-stambha_radius,-stambha_radius,0])
cube(size=[stambha_radius*2,stambha_radius*2,stambha_height/5]);

cylinder(h=stambha_height,r=stambha_radius);
    
}