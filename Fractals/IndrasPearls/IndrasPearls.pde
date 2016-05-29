class Circle{
  float x;
  float y;
  float r;
  
  //x,y coordinates of centre, r is radius
  
  //Constructor
  Circle(float x,float y,float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }
  
  //Reflection of another circle c2, in this circle
  //Formula taken from Wolfram Mathworld
  public Circle getReflection(Circle c2) {
    float s = (r*r )/( (x - c2.x)*(x - c2.x) + (y-c2.y)*(y-c2.y) - c2.r*c2.r ) ;
    float x_dash = x + s*(c2.x - x) ;
    float y_dash = y + s*(c2.y - y) ;
    float r_dash = Math.abs(s)*c2.r ;
    return new Circle(x_dash,y_dash,r_dash);
  }    
  
  public void display(){
    ellipse(x,y,2*r,2*r);
  }
  
}
    
import processing.pdf.*;

int scale = 2;
size(1800,1800);
//size(9000,9000,PDF,"indra.pdf");
//fullScreen();
background(0,0,0);
noStroke();

ArrayList<Circle> circleArr = new ArrayList<Circle>();

//Print Indra's Pearls
PFont f = createFont("Amienne",16,true);
//PFont f = loadFont("BlackadderITC-Regular-48.vlw"); //LoadFont doesnt work with PDF
textFont(f,75*scale);
fill(0,255,255);
textAlign(CENTER);
text("Indra's",450*scale,300*scale);
text("Pearls",450*scale,375*scale);
textFont(f,70*scale);
fill(255,255,255);
textAlign(CENTER);
text("Indra's",450*scale,300*scale);
text("Pearls",450*scale,375*scale);

//Hexagon
float sixtydeg = (float)(60*Math.PI/180);
float a = 100*scale; //Size of the hexagon
float x_cen = 450*scale;
float y_cen = 700*scale;

circleArr.add( new Circle( x_cen, y_cen, a/2 ));
circleArr.add( new Circle( x_cen + a, y_cen, a/2 ));
circleArr.add( new Circle( x_cen - a, y_cen, a/2 ));
circleArr.add( new Circle( x_cen + a*(float)Math.cos(sixtydeg), y_cen + a*(float)Math.sin(sixtydeg), a/2 ));
circleArr.add( new Circle( x_cen - a*(float)Math.cos(sixtydeg), y_cen + a*(float)Math.sin(sixtydeg), a/2 ));
circleArr.add( new Circle( x_cen + a*(float)Math.cos(sixtydeg), y_cen - a*(float)Math.sin(sixtydeg), a/2 ));
circleArr.add( new Circle( x_cen - a*(float)Math.cos(sixtydeg), y_cen - a*(float)Math.sin(sixtydeg), a/2 ));

//Necklace
int numNecklaceBits = 12;
float theta = (float)(15*Math.PI/180);
float reducing_factor = 0.9;
//left
float x_left =  x_cen - a*(float)Math.cos(sixtydeg);
float y_left =  y_cen - a*(float)Math.sin(sixtydeg);
float r_left= a/2;
float theta_left = theta;
for(int i=1;i<=numNecklaceBits;i++) //<>//
{
    float prev_r_left = r_left;
    r_left = reducing_factor*r_left;
    x_left = x_left - (prev_r_left+r_left)*(float)Math.cos(theta_left);
    y_left = y_left - (prev_r_left+r_left)*(float)Math.sin(theta_left);
    circleArr.add( new Circle(x_left,y_left,r_left ));
    theta_left= theta_left + theta;
}
//right
float x_right =  x_cen + a*(float)Math.cos(sixtydeg);
float y_right =  y_cen - a*(float)Math.sin(sixtydeg);
float r_right= a/2;
float theta_right = theta;
for(int i=1;i<=numNecklaceBits;i++)
{
    float prev_r_right = r_right;
    r_right = reducing_factor*r_right;
    x_right = x_right + (prev_r_right+r_right)*(float)Math.cos(theta_right);
    y_right = y_right - (prev_r_right+r_right)*(float)Math.sin(theta_right);
    circleArr.add( new Circle(x_right,y_right,r_right ));
    theta_right= theta_right + theta;
}

fill(255,0,0);
for(Circle c:circleArr)
{
  c.display();
}

color colorArray[] = {   color(255,100,0),
                         color(255,180,0),
                         color(255,255,0),
                         color(255,255,128),
                         color(255,255,255) };

for(int iter=0;iter<5;iter++)
{  //For every iteration
    fill(colorArray[iter]); //Selecting the color
    
    ArrayList<Circle> reflectedCircles = new ArrayList<Circle>(); //Will store all the reflected circles //<>//
    
    for(Circle c1:circleArr)
    {
        for(Circle c2:circleArr)
        {
          if( !c2.equals(c1) ) 
          {
            Circle ref = c1.getReflection(c2);
            if(ref.r > 1) 
            {
              ref.display();
              reflectedCircles.add(ref);
            }
          }
        }
    }
    //All reflected circles done
    
    circleArr = reflectedCircles; //Replaces the current circle array with the new reflected circles
}

println("Done!");

save("IndrasPearls.jpg");