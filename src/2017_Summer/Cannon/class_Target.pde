class Target
{
 float x;
 float y;
 float vx;
 float vy;
 boolean visible;
 
 Target(float xIn, float yIn, float vxIn, float vyIn)
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
    {    
      int n = 5;
      stroke(255);
      strokeWeight(3);
      
      for (int i = 0; i<n; i++)
      {
          if (i%1 == 0)
          {
            fill(255, 0, 0);
          }
          else
          {
            fill(255);
          }
            
          float radius = (n-i)*25.0/n;  
          ellipse(x, y, radius*2, radius*2);
      }
    }
     x += vx;
    y += vy;
  }
}

  