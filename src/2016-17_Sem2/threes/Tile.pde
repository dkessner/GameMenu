class Tile
{
  int c; 
  int n;
  
  Tile(int nIn)
  {
    c = color(255);
    n = nIn;
  }
  
  void display()
  {
    if (n == 1)
    {
      fill(#9DD5FF);
    }
    else if (n == 2)
    {
      fill(#FF79AD);
    }
    else
    {
      fill(c);
    }
    stroke(c);
    strokeWeight(0);
    rect(0, 0, 110, 116, 7);
    textAlign(CENTER, CENTER);
    if (n == 1 || n == 2)
    {
      fill(255);
    }
    else
    {
      fill(0);
    }
    textSize(90);
    text(n, 55, 58);
  }
}