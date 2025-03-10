class Followers
{
  float x = 100;
  float y = 300;
  float w = 300;
  float h = 100;
  
  float vx = 4;
  
  void display()
  {
    if(state == 14)
    {
      image(imfollg, x, y, w, h);
      x = x + vx;
    if(x == 200)
    {
      x = 200;
    }
    }
    if(state == 15)
    {
      image(imfollg, x, y, w, h);
      x = 200;
    }
   /* if(state == 16)
    {
      image(imfollg, x, y, w, h);
      x = 200;
    }*/
  }
}