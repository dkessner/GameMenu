class Cedric
{
  float x = 700;
  float y = 0;
  float w = 60;
  float h = 80;

  float vx = 10;
  float vy = 10;

  void display()
  {
    if (state == 0)
    {
      image(imcd, x, y, w, h);
      x -= vx;
      y += vy;

      if (x<100 && y>500)
      {
        x = 100;
        y = 500;
      }
    }
    if (state == 1)
    {
      image(imcd, x, y, w, h);
    }
    if (state == 2)
    {
      image(imcd, x, y, w, h);
    }
    if (state == 3)
    {
      image(imdcd, x, y+30, h, w);
      //state = 4;
    }
    
    if(state == 4)
    {
      image(imdcd, x, y+30, h, w);
      //state = 4;
    }
    if(state == 5)
    {
      image(imdcd, x, y+30, h, w);
      //state = 6;
    }
   
    if(state == 6)
    {
      image(imdcd, x, y+30, h, w);
    }
    if(state == 7)
    {
      image(imdcd, x, y+30, h, w);
    }
    if(state == 8)
    {
      image(imdcd, x, y+30, h, w);
    }
    if(state == 9)
    {
      image(imdcd, x, y+30, h, w);
    }
    if(state == 10)
    {
      image(imdcd, x, y+30, h, w);
    }
    if(state == 11)
    {
      image(imdcd, x, y+30, h, w);
    }
    if(state == 12)
    {
      image(imdcd, x, y+30, h, w);
    }
    if(state == 13)
    {
      image(imdcd, x, y+30, h, w);
    }
    if(state == 14)
    {
      image(imdcd, x, y+30, h, w);
    }
    if(state == 15)
    {
      image(imdcd, x, y+30, h, w);
    }
    if(state == 16)
    {
      image(imdcd, x, y+30, h, w);
    }
  }
}