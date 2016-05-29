class Turtle{
  float turtle_x;
  float turtle_y;
  float turtle_angle;
  
  //Size of step and thickness of the line
  float turtle_step;
  float turtle_thickness;
  
  int turtle_color_hue; //Color hue ranges from 0 to 360
  
  //Constructor
  Turtle(float x,float y,float angle, float step, float thickness, int c)
  {
    turtle_x = x; turtle_y = y; turtle_angle = angle; turtle_step = step; turtle_thickness = thickness; turtle_color_hue = c;
  }
  
  //Moving according to a string
  public void drawGraphicsFromString(String dragonCurve)
  {
    int turtle_color_add = 0; //Can be max 40
    int turtle_color_sat = 100; //Saturation will decrease at the edges
    int turtle_color_intensity = 100; //Intensity will decrease at the edges
    
    for(int i=0;i<dragonCurve.length();i++)
    {
      char c = dragonCurve.charAt(i);
      
      if(c=='F')
      {
        float prev_turtle_x = turtle_x;
        float prev_turtle_y = turtle_y;
        turtle_x = turtle_x + turtle_step*(float)Math.cos(turtle_angle) ;
        turtle_y = turtle_y - turtle_step*(float)Math.sin(turtle_angle) ;
        
        if(i%20 == 0) //Change color every 20 steps
        {
          turtle_color_add = (turtle_color_add+1)%40;
          turtle_color_sat = 100 - (int)( (30.0*i)/dragonCurve.length() );
          turtle_color_intensity = 100 - (int)( (30.0*i)/dragonCurve.length() );          
        }
        stroke( color(turtle_color_hue+turtle_color_add, turtle_color_sat , turtle_color_intensity) );
        strokeWeight(turtle_thickness);
        line(prev_turtle_x,prev_turtle_y,turtle_x,turtle_y);
        
      }
      
      if(c=='+')
        turtle_angle = turtle_angle - (float)Math.PI/2;
        
      if(c=='-')
        turtle_angle = turtle_angle + (float)Math.PI/2;
       
    }    
    //Parsed the string fully
  }
  
}//End of class
    

import processing.pdf.*;
size(4000,8000,PDF,"DragonTiles.pdf");
background(0,0,0);
noStroke();
colorMode(HSB,360,100,100);

//Variables to be used for turtles
float x_cen = 2000;
float y_cen = 1600;
float stepSize = 4.5;
float turtleRad = 2.3;

String dragonCurve = "FX" ; //Initialize

int generations = 17;

for(int i=1;i<generations;i++)
{
  //Replace X and Y according to rules
  String newDragonCurve = "";
  for(int j=0;j<dragonCurve.length();j++)
  {
    char c = dragonCurve.charAt(j);
    if(c=='X')
      newDragonCurve = newDragonCurve + "X+YF+";
    else
    if(c=='Y')
      newDragonCurve = newDragonCurve + "-FX-Y";
    else
      newDragonCurve = newDragonCurve + c;
      
  }
  
  dragonCurve = newDragonCurve;
  //println(dragonCurve);
}

//Now generate figure according to dragon curve
//Colors in HSI mode - Hue in deg
int c1 = 0;
int c2 = 60;
int c3 = 120;
int c4 = 180;

Turtle turtle1 = new Turtle(x_cen,y_cen, (float)Math.PI/2, stepSize, turtleRad, c1 );
turtle1.drawGraphicsFromString(dragonCurve);
Turtle turtle2 = new Turtle(x_cen,y_cen, (float)Math.PI , stepSize, turtleRad, c2 );
turtle2.drawGraphicsFromString(dragonCurve);
Turtle turtle3 = new Turtle(x_cen,y_cen, (float)Math.PI*3/2 , stepSize, turtleRad, c3 );
turtle3.drawGraphicsFromString(dragonCurve);
Turtle turtle4 = new Turtle(x_cen,y_cen, (float)0 , stepSize, turtleRad, c4 );
turtle4.drawGraphicsFromString(dragonCurve);

//Depends on which turtle is downward
y_cen = turtle3.turtle_y + (turtle3.turtle_y-y_cen);

turtle1 = new Turtle(x_cen,y_cen, (float)Math.PI/2, stepSize, turtleRad, c1 );
turtle1.drawGraphicsFromString(dragonCurve);
turtle2 = new Turtle(x_cen,y_cen, (float)Math.PI , stepSize, turtleRad, c2 );
turtle2.drawGraphicsFromString(dragonCurve);
turtle3 = new Turtle(x_cen,y_cen, (float)Math.PI*3/2 , stepSize, turtleRad, c3 );
turtle3.drawGraphicsFromString(dragonCurve);
turtle4 = new Turtle(x_cen,y_cen, (float)0 , stepSize, turtleRad, c4 );
turtle4.drawGraphicsFromString(dragonCurve);

//Depends on which turtle is downward
y_cen = turtle3.turtle_y + (turtle3.turtle_y-y_cen);

turtle1 = new Turtle(x_cen,y_cen, (float)Math.PI/2, stepSize, turtleRad, c1 );
turtle1.drawGraphicsFromString(dragonCurve);
turtle2 = new Turtle(x_cen,y_cen, (float)Math.PI , stepSize, turtleRad, c2 );
turtle2.drawGraphicsFromString(dragonCurve);
turtle3 = new Turtle(x_cen,y_cen, (float)Math.PI*3/2 , stepSize, turtleRad, c3 );
turtle3.drawGraphicsFromString(dragonCurve);
turtle4 = new Turtle(x_cen,y_cen, (float)0 , stepSize, turtleRad, c4 );
turtle4.drawGraphicsFromString(dragonCurve);

println("Done!");





    