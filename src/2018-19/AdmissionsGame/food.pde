class Food
{
  PImage img;
  float x;
  float vy;
  float y;
  int pointValue=5;
  
  
  Food(PImage imageIn)
  {
    img = imageIn;
    x=random(0, width);
    vy=random(3, 10);
    y=random(-5*height, -100);
  }
  
  void display()
  {
    image(img, x, y);
    y+=vy;
    if (y>height+100){reset();}
  }
  
  void reset()
  {
    y=random(-5*height, -100);
    vy=random(3, 10);
    x=random(0, width);
  }
  
  PVector spot(){return new PVector(x, y);}
  float w(){return img.width;}
  int p(){return pointValue;}
}
