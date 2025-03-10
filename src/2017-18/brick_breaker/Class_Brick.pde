class Brick
{
  float x;
  float y;
  float l;
  float w;
  int c;
  int vx;
  boolean special = false;
  
  Brick(float xIn, float yIn, float lIn, float wIn, int cIn, int vxIn)
  {
    x = xIn;
    y = yIn;
    l = lIn;
    w = wIn;
    c = cIn;
    vx = vxIn;
    if (random(0,1) < .03)
    {
       special = true; 
       c = color(random(0,256));
    }
  }
  
  boolean isInside(float a, float b)
  {
    if(x<=a && a<=x+l && y<=b && b<= y+w && c != 0)
      return true;
    else
      return false;
  }
  
  
  void display()
  {
    fill(c);
    rect(x,y,l,w);
    x += vx;
  }
}