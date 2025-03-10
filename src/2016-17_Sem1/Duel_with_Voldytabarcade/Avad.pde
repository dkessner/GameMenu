class Avad
{
  float x = voldy.x;
  float y = voldy.y;
  float w = 100;
  float h = 5;
  float vx = 0;
  float vy = 0;
  int c = 0;
  int d = 255;
  int e = 0;
  
Avad(float xIn, float yIn)
{
  x = xIn;
  y = yIn;
}

  void display()
  {
    fill(c, d, e);
    rect(x, y, w, h);
    vx = 10;
    x -= vx;
    if(state == 15 && x<harry.x+30 && x>harry.x-30 && y < harry.y + 60 && y > harry.y)
    {
      state = 17;
    }
  }
}


/*class Avad
{
  float x;
  float y;
  float w = 200;
  float h = 10;
  
  float vx = 10;
  float vy = 3;
  
  Avad()
  {
    x = voldy.x;
    y = voldy.y + 50;
    x += vx;
  }
  
  void display()
  {
    //if(x == 15)
    //{
 //   noStroke();*/
 /*
      fill(0, 255, 0);
      rect(x, y, w, h);
      vx = -10;
      println("DOBBY IS LATINLY DEAD");
  }
   // }
}*/


class Expel
{
  float x = harry.x;
  float y = harry.y;
  float w = 100;
  float h = 5;
  float vx = 0;
  float vy = 0;
  int f = 255;
  int g = 0;
  int i = 0;
  
Expel(float xIn, float yIn)
{
  x = xIn;
  y = yIn;
}

  void display()
  {
    fill(f, g, i);
    rect(x, y, w, h);
    vx = 10;
    x += vx; 
    if(state == 15 && x<voldy.x+30 && x>voldy.x-30 && y < voldy.y + 100 && y > voldy.y)
    {
      state = 18;
    }
  }
}