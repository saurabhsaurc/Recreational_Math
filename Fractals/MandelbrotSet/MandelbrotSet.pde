class complexNumber {
  //Complex number: x + i.y
  float x;
  float y;
  
  //Constructor
  complexNumber(float x,float y)
  {
    this.x = x; this.y = y;
  }
  
  float magnitude()
  {
    return (float)Math.sqrt(x*x + y*y);
  }
  
  complexNumber multiply(complexNumber c2)
  {
    float x_mult = x*c2.x - y*c2.y;
    float y_mult = x*c2.y + c2.x*y;
    return new complexNumber( x_mult,y_mult );
  }
  
  complexNumber sum(complexNumber c2)
  {
    return new complexNumber( x+c2.x, y+c2.y );
  }
  
}

size(10000,3000);
int panelSizeX = 10000;
int panelSizeY = 3000;
colorMode(HSB,360,100,100);

int maxIterations = 1000;
float bound = 1+(float)Math.sqrt(2); //Beyond this number is unbounded, see Penrose

loadPixels();

float pixelsPerUnit = 20000;
float x_cen = panelSizeX/2 + 0.912*pixelsPerUnit; //put offset here
float y_cen = panelSizeY + 0.200*pixelsPerUnit;
//Centre of origin

for(int x=0;x<panelSizeX;x++)
{
  for(int y=0;y<panelSizeY;y++)
  {

    float x_i = (x-x_cen)/pixelsPerUnit ;
    float y_i = (y_cen-y)/pixelsPerUnit ;
    
    complexNumber z = new complexNumber( x_i, y_i );
    complexNumber c = new complexNumber( x_i, y_i );
    
    int n=0; //Number of iterations for it to move beyond the bound
    
    while( n < maxIterations )
    {
      z = c.sum( z.multiply(z) );
      n = n+1;
      if(z.magnitude() > bound )
        break;
    }
    
    if (n == maxIterations) {
      pixels[x+y*panelSizeX] = color(0, 100, 35); //Dark red color
    } else {
      int nHue = 0;
      int nIntensity = 35;
      if(n>=8)
      {    
          nHue = ( (int)( log(n)/log(2) )*20 )%60;        
          nIntensity = min( n*5, 100 );
      }
      pixels[x+y*panelSizeX] = color( nHue ,100,nIntensity );
    }
    
  }
}

updatePixels();

//Draw coordinate axes
//stroke(180,100,100);
//line(panelSize/2,0,panelSize/2,panelSize);
//line(0, panelSize/2, panelSize, panelSize/2 );
//fill(180,100,100);

//for(int i=-2;i<=2;i++)
//{
//  ellipse( x_cen + i*200 , panelSize/2 , 4, 4);
//  ellipse( panelSize/2 , y_cen + i*200 ,4, 4);
//}

save("Mandelbrot.jpg");
println("Done");