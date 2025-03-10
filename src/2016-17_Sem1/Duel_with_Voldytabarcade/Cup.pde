class Cup
{
  float x = 650;
  float y = 0;
  float w = 60;
  float h = 60;

  float vx = 10;
  float vy = 10;

  void display()
  {
    image(imcg, x, y, w, h);
    if (state == 0)
    {
      x -= vx;
      y += vy;

      if (x<100 && y>500)
      {
        x = 100;
        y = 500;
      }
    }
    if(state == 15 || state == 16)
    {
      x = 500;
      y = 500;
      image(imcg, x, y, w, h);
    }
    
  }
}