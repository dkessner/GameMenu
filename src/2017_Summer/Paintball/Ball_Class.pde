class Ball
{
  float x; 
  float y;
  float vx;
  float vy;
  int c; 
  
  Ball(float xIn, float yIn, float vxIn, float vyIn)
  {
    x = xIn;
    y = yIn; 
    vx = vxIn; 
    vy = vyIn;
    
    float temp = random(0, 1);
    if (temp < .333)
      c = color(0, 0, 255);
    else if (temp < .667)
      c = color(0, 255, 0);
    else
      c = color(255, 0, 0);
    
  }
  
  
  void display()
  {
    fill(c);
    ellipse(x, y, 50, 50);
    
    x += vx;
    y += vy;
    
    
  }
} // class Ball