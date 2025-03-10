class Food
{
  float x;
  float y;
  float foodHeight = char1.charHeight/2;
  void display()
  {
    fill(0, 255, 0);
    ellipse(x, y, foodHeight, foodHeight);
  }
}