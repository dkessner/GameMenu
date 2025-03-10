class Firstak
{
  float x = 380;
  float y = 380;
  float w = 50;
  float h = 40;

  float vx = 20;
  float vy = 20;

  float a = 150;
  float b = 300;
  void display()
  {

    image(imfakg, x, y, w, h);
    x -= vx;
    y += vy;
    if (y > 550)
    {
      //state = 3;
      w = 0;
      h = 0;
    }
  }
}