class Priorinc
{
  float x = width/2;
  float y = height/2;
  float w = 1;
  float h = 1;
  
  void display()
  {
    if(state == 16)
    {
    fill(237, 214, 5);
    rect(0, 0, w, h);
    w = w + 10;
    h = h + 10;
    fill(0);
    text("Priori incantatem!", x, y);
    }
  }
}