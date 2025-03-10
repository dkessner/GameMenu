class Char
{
  float x;
  float y;
  float vx;
  float vy;
  float charWidth;
  float charHeight;
  int lives=5;
  int mazeCount=0;
  
  void display()
  {
    fill(0, 0, 255);
    ellipse(x, y, charHeight, charHeight);

    float x1 = x+charHeight/2;
    float y1 = y+charHeight/2;
    
    float x2 = x-charHeight/2;
    float y2 = y-charHeight/2;
    
    if (lives <= 0)
      gameState++;
    
    for (int i=0; i<balls.size(); i++)
    {
      if (dist(x, y, balls.get(i).x, balls.get(i).y)<=0.825*charHeight)
      {
        lives=lives-1;
        ball.rewind();
        ball.play();
        balls.remove(i);
        break;
      }
    }
    
    for (int i=0; i<food.size(); i++)
    {
      if (dist(x, y, food.get(i).x, food.get(i).y)<=0.75*charHeight)
      {
        lives++;
        foods.rewind();
        foods.play();
        food.remove(i);
        break;
      }
    }
   
    if (grid.isValidPosition(x1+vx, y1+vy) && grid.isValidPosition(x1+vx, y2+vy) && grid.isValidPosition(x2+vx, y1+vy) && grid.isValidPosition(x2+vx, y2+vy))
    {
       x += vx;
       y += vy;
    }
    
    if (grid.isWinPosition(x1, y1) && grid.isWinPosition(x1, y2) && grid.isWinPosition(x2, y1) && grid.isWinPosition(x2, y2))
    {
      mazeCount++;
      if (mazeCount>=gridValues.length)
        gameState=2;
      else
      {
        grid.nextMaze();
        nextmaze.rewind();
        nextmaze.play();
        x=grid.startx;
        y=grid.starty;
        for (Ball a : balls)
        {
          grid.moveBallRandom(a);
        }
        for (Food a : food)
        {
          grid.foodRandom(a);
        }
      }
    }
  }
  
  Char(float xIn, float yIn)
  {
    x = xIn;
    y = yIn;
    charWidth=grid.gridWidth/2;
    charHeight=grid.gridHeight/2;
  }
  
  void setVelocity(float vxNew, float vyNew)
  {
    vx=vxNew;
    vy=vyNew;
  }
}
