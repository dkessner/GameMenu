
class Bird
{
  float xbird;
  float vxbird;
  float ybird;
  float vybird;
  
  Bird( float xbirdIn, float ybirdIn, float vxbirdIn, float vybirdIn)
  {
    xbird = xbirdIn;
    ybird = ybirdIn;
    vxbird = vxbirdIn;
    vybird = vybirdIn;
  }
 
  void keyPressed()
  {
   if( keyCode == UP)
      vybird = -5;
  }
  
  void display()
  {
   imageMode(CENTER);
   image(bird, xbird, ybird);
    ybird += vybird;
    vybird += ay;
    xbird = xbird + 4;
 
 if(ybird>height - 40)
   ybird=height - 40;
    
  
  
  //if(xbird > width+100)
  //  xbird = -50;
  }
}

// float xbird = 100;
//float vxbird = 4;
//float ybird = 400;
//float vybird = 5;
  
  // xbird = 100;
  //  ybird = 400;
 