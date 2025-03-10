class Circle
{
  float x;
  float y;
  float l;
  float w;
  float vx;
  float vy;
  
  Circle(float xIn, float yIn, float lIn, float wIn,float vxIn, float vyIn)
  {
    x = xIn;
    y = yIn;
    l = lIn;
    w = wIn;
    vx = vxIn;
    vy = vyIn;
  }
  
  void display()
  {
    x += vx;
    y+=vy;
    
     fill(255);
     ellipse(x, y, l, w);
      
      if(x>width-20 || x<20)
        vx = -vx;
      if(y<20)
        vy = -vy;   
    }
}