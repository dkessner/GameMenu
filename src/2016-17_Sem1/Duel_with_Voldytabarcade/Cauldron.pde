class Cauldron
{
  float x = -100;
  float y = 200;
  float w = 500;
  float h = 380;

  void display()
  {
    if (state == 0 || state == 1 ||  state == 2 || state == 3 || state == 4 || state == 5 || state == 6)
    {
      image(imcaul1g, x, y, w, h);
      /*if(x > peter.x - 281 && x < peter.x - 279)
      {
        state;
      }*/
    }
    if(state == 6)
    {
      image(imcaul2g, x, y, w, h);
      //state++;

    }
    if(state == 7)
    {
      image(imcaul3g, x, y, w, h);
      println("State seven!!!!!");
    }
    if(state == 8)
    {
      image(imcaul4g, x, y, w, h);
    }
    if(state == 9)
    {
      image(imcaul5g, x, y, w, h);
    }
    if(state == 10)
    {
      image(imcaul6g, x, y, w, h);
    }
    if(state == 11)
    {
      image(imcaul7g, x, y, w, h);
    }
    if(state == 12)
    {
      image(imcaul8g, x, y, w, h);
    }
    if(state == 13)
    {
      image(imcaul9g, x, y, w, h);
    }
    if(state == 14)
    {
      image(imcaul9g, x, y, w, h);
    }
  }
  
}