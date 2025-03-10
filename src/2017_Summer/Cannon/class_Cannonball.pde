class Cannonball
{
  float x;
  float y;
  float vx;
  float vy;
  boolean visible;
  
  Cannonball(float xIn, float yIn, float vxIn, float vyIn)
    {
      x = xIn;
      y = yIn;
      vx = vxIn;
      vy = vyIn;
      visible = true;
    }
    
  void display()
  {
      if (visible)
        image(cannonball, x, y);
     
      x += vx;
      y += vy;
  }
}