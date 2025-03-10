
PImage ibackpack;
PImage backpackfront;


class Backpack
{
  float x;
  float vx;
  float w;
  float h;
  int pointTotal;
  
  Backpack()
  {
    x=width/2;
    vx=0;
    w=ibackpack.width;
    h=ibackpack.width;
    pointTotal=0;
  }
  
  void display()
  {
    x+=vx;
    back();
    if (x<-2*w){x=width+w;}
    else if (x+w>width+2*w){x=-w;}
  }
  
  void back()
  {
    image(ibackpack, x, height-150);
  }
  
  void front()
  {
    image(backpackfront, x, height-150);
  }
  
  void moveR(){vx=15;}
  void moveL(){vx=-15;}
  void stopMove(){vx=0;}
  
  float getX(){return x;}
  float getW(){return w;}
  
  void collision(Food food)
  {
    PVector spot = food.spot();
    float wIn = food.w();
    int p = food.p();
    
    if(spot.x+wIn<x+w && spot.x>x && spot.y>height-100)
    {
      pointTotal+=p;
      food.reset(); 
    }
  }
  
  int getPoints(){return pointTotal;}
  
  void resetbackpack()
  {
    x=width/2;
    pointTotal=0;
  }

  void resize()
  {
    w=ibackpack.width;
    h=ibackpack.width;
  }
}
