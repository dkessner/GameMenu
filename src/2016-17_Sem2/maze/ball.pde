class Ball
{
  float x;
  float y;
  float vx;
  float vy;
  float ballHeight = 0.65*char1.charHeight;
  
  void display()
  {
    fill(255, 0, 0);
    ellipse(x, y, ballHeight, ballHeight);
    move(); 
  }
  
  
  Ball(float xIn, float yIn, float vxIn, float vyIn)
  {
    x=xIn;
    y=yIn;
    vx=vxIn;
    vy=vyIn;
  }
  
  
  void move()
  {
    float x1 = x+ballHeight/2+vx;
    float x2 = x-ballHeight/2+vx;
    float y1 = y+ballHeight/2;
    float y2 = y-ballHeight/2;
    
    if (grid.isWall(x1, y1) || grid.isWall(x2, y1) || grid.isWall(x1, y2) || grid.isWall(x2, y2))
      vx=-vx;
    x+=vx;
    
    x1=x+ballHeight/2;
    x2=x-ballHeight/2;
    y1 = y+ballHeight/2+vy;
    y2 = y-ballHeight/2+vy;
    
    if (grid.isWall(x1, y1) || grid.isWall(x2, y1) || grid.isWall(x1, y2) || grid.isWall(x2, y2))
      vy=-vy;
    y+=vy;
    
  }
  
}