class Harry
{
  float x = 600;
  float y = 0;
  float w = 60;
  float h = 60;

  float vx = 0;
  float vy = 0;
  void display()
  {
    //if(state == 1 || state == 2 || state == 3 || state == 4 || state == 5 || state == 6 || state == 7 || state == 8 || state == 9 || state == 10 || state 
    if(state < 15)
    {
    image(img, x, y, w, h);
    }
    if (state == 0)
    {
      vx = 10;
      vy = 10;
      x -= vx;
      y += vy;

      if (x<100 && y>500)
      {
        x = 100;
        y = 500;
        state = 1;
      }
    }
    if(state == 14)
    {
      x = 45;
      y = 300; 
      vx = 0;
      vy = 0;
    }
    if(state == 15)
    {
       image(img, x, y, w, h);
       x += vx;
       y += vy;
       if(x + 30 > cup.x && x - 30 < cup.x && y + 30 > cup.y && y - 30 < cup.y)
       {
         state = 19;
       }
    }
    
    /*if(state == 16)
    {
      image(img, x, y, w, h);
    }*/
  }
}