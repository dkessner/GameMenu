
class Bubble
{
  
  float x;
  float y;
  float vx;
  float vy;
  
  Bubble(int xIn, int yIn, int vxIn, int vyIn)
  {
    x = xIn;
    y = yIn;
    vx = vxIn;
    vy = vyIn;
  }
  
  void display()
  {
  image(bubbles, x, y);
  x += vx;
  y += vy;
  
  if(dist(x, y, humanx, humany)<100)
  {
    humanFrozen = true;
    humanalarm = millis() + 1000;
  }
  }
}