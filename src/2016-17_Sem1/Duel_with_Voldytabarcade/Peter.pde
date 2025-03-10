
class Peter
{
  float x = 380;
  float y = 330;
  float w = 1;
  float h = 1;

  float vx = 1;
  float vy = 1;
  float vw = 1;
  float vh = 1;

  void display()
  {
    if (state == 1)
    {
      image(impvg, x, y, w, h);
      y += vy;
      w += vw;
      h += vh;

      if (w > 60 && h > 60 && y > 390)
      {
        h = 60;
        y = 390;
        w = 60;
        state = 2;
      }
    }
    if (state == 2)
    {
      image(impvg, x, y, w, h);
      h = 60;
      w = 60;
      y = 390;
      //put in voice over "KILL THE SPARE"
    }
    if (state == 3)
    {
      image(impvg, x, y, w, h);
    }
    if (state == 4)
    {
      image(impvg, x, y, w, h);
      x = x - 2;
      y = y - 1;
      if (x < 180)
      {
        x = 180;
      }
      if (y < 370)
      {
        y = 370;
      }
      if (x == 180) //&& state == 4)
      {
        state = 5;
      }
    }
    if (state == 5)
    {
      image(igy, 0, 0, 620, 620);
      image(impg, x, y, w, h);
      println("state 5 entered");
       harry.display();
       cedric.display();
       cup.display();
       firstak.display();
       x = 183;
       if (x == 183)
      {
         state = 6;
      }
      
      /* if(x > cauldron.x + 279 && x < cauldron.x +281)
       {
         state++;
         println("Hey you there");
       }*/
    }
    if (state == 6)
    {
      x = 183;
      if(x > 182 && x < 184)
      {
       // state = 6;
        image(impg, x, y, w, h);
        println("Hey you there");
      }
       //if(x > cauldron.x + 279 && x < cauldron.x +281)
    }
    if(state == 7)
    {
      image(impg, x, y, w, h);
    }
    if(state == 8)
    {
      image(impg, x, y, w, h);
    }
    if(state == 9)
    {
      image(impg, x, y, w, h);
    }
    if(state == 10)
    {
      image(impg, x, y, w, h);
    }
    if(state == 11)
    {
      image(impg, x, y, w, h);
    }
    if(state == 12)
    {
      image(impg, x, y, w, h);
    }
    if(state == 13)
    {
      image(impg, x, y, w, h);
    }
    if(state == 14)
    {
      image(impg, x, y, w, h);
    }
  }
}