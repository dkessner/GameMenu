int[][] values = {{1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
                  {1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1},
                  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
                  {1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1},
                  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
                  {1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1},
                  {1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
                  {1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1},
                  {1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                  {1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1},
                  {1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1},
                  {1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1},
                  {1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1},
                  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1}};
                  
int[][] values2 = {{1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1},
                    {1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1},
                    {1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1},
                    {1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1},
                    {1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1},
                    {1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1},
                    {1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1},
                    {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
                    {1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1},
                    {1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
                    {1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1},
                    {1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1},
                    {1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1},
                    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1},
                    {1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1}};
                    
int[][] values3 = {{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                    {1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1},
                    {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1},
                    {1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1},
                    {1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1},
                    {1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1},
                    {1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1},
                    {1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
                    {1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1},
                    {1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1},
                    {1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1},
                    {1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1},
                    {1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1},
                    {1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1},
                    {1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1}};
                    
int[][] values4 = {{1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                  {1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1},
                  {1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1},
                  {1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1},
                  {1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1},
                  {1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                  {1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1},
                  {1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1},
                  {1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1},
                  {1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1},
                  {1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1},
                  {1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1},
                  {1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1},
                  {1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1},
                  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1}};
                  
int[][] values5 = {{1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                  {1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1},
                  {1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
                  {1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1},
                  {1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1},
                  {1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1},
                  {1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1},
                  {1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1},
                  {1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1},
                  {1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1},
                  {1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1},
                  {1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1},
                  {1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1},
                  {1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1},
                  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1}};
                    
int[][] values6 = {{1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                  {1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1},
                  {1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1},
                  {1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                  {1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1},
                  {1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1},
                  {1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1},
                  {1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1},
                  {1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1},
                  {1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1},
                  {1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1},
                  {1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1},
                  {1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1},
                  {1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1},
                  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1}};
                  
int[][] values7 = {{1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                  {1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1},
                  {1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1},
                  {1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1},
                  {1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1},
                  {1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1},
                  {1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1},
                  {1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1},
                  {1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1},
                  {1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1},
                  {1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1},
                  {1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1},
                  {1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1},
                  {1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1},
                  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1}};

int[][] values8 = {{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1},
                  {1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1},
                  {1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1},
                  {1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1},
                  {1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1},
                  {1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                  {1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1},
                  {1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1},
                  {1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
                  {1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1},
                  {1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1},
                  {1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1},
                  {1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1},
                  {1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1},
                  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1}};

int[][][] gridValues = {values, values2, values3, values4, values5, values6, values7, values8};

int currentGridIndex = 0;

int[][] currentValues = gridValues[0];


// currentValues = values2;

class Grid
{
  float gridWidth;
  float gridHeight;
  float startx;
  float starty;
  int newBall=1;
  
  Grid()
  {
    gridWidth=width/15;
    gridHeight=height/15; 
    initializeStart();
  }

  void display()
  {
     for (int i=0; i<currentValues.length; i++)
      {
        for (int j=0; j<currentValues[i].length; j++)
        {
          if (currentValues[i][j] == 1)
            fill(255);
          else if (currentValues[i][j]==0)
            fill(0);
          else if (currentValues[i][j]==2)
            fill(0, 255, 0);
          else
            fill(200);
          
          rect(j*gridWidth, i*gridHeight, gridWidth, gridHeight);
        }
      }
  }
  
  boolean isValidPosition(float x, float y)
  {
    // return true if position is ok, i.e. not in wall
    // return false if position is in a wall
    
    for (int i=0; i<15; i++)
    {
      for (int j=0; j<15; j++)
      {
        float xbox=j*gridWidth;
        float ybox=i*gridHeight;
        if (x>xbox && x<xbox+gridWidth && y>ybox && y<ybox+gridHeight)
        {
          if (currentValues[i][j] == 0 || currentValues[i][j] == 2 || currentValues[i][j] == 3)
             return true;
          else
            return false;
        }
      }
    }
    return true; // we'll never get here
  }
  
  boolean isWall(float x, float y)
  {
    for (int i=0; i<15; i++)
    {
      for (int j=0; j<15; j++)
      {
        float xbox=j*gridWidth;
        float ybox=i*gridHeight;
        if (x>=xbox && x<=xbox+gridWidth && y>=ybox && y<=ybox+gridHeight)
        {
          if (currentValues[i][j] == 1 || currentValues[i][j] == 2 || currentValues[i][j] == 3)
             return true;
          else
            return false;
        }
      }
    }
    
    println("Something's wrong.");
    return true;
  }
  
  boolean isWinPosition(float x, float y)
  {
    for (int i=0; i<15; i++)
    {
      for (int j=0; j<15; j++)
      {
        float xbox=j*gridWidth;
        float ybox=i*gridHeight;
        if (x>xbox && x<xbox+gridWidth && y>ybox && y<ybox+gridHeight)
        {
          if (currentValues[i][j] == 2)
             return true;
          else
            return false;
        }
      }
    }
    return true;
  }
  
  void moveBallRandom(Ball ball)
  {
    int startbi = (int)random(15);
    int startbj = (int)random(15);
      
      while (currentValues[startbi][startbj] != 0)
      {
        startbi = (int)random(15);
        startbj = (int)random(15);
      }
     
    float startbx=startbj*gridWidth+gridWidth/2;
    float startby=startbi*gridHeight+gridHeight/2;
    
    ball.x = startbx;
    ball.y = startby;
  }
  
  void foodRandom(Food food)
  {
    int startbi = (int)random(15);
    int startbj = (int)random(15);
      
      while (currentValues[startbi][startbj] != 0)
      {
        startbi = (int)random(15);
        startbj = (int)random(15);
      }
     
    float startbx=startbj*gridWidth+gridWidth/2;
    float startby=startbi*gridHeight+gridHeight/2;
    
    food.x = startbx;
    food.y = startby;
  }
  
  void initializeStart()
  {
    for (int i=0; i<15; i++)
      {
        for (int j=0; j<15; j++)
        {
          if (currentValues[i][j]==3)
          {
           startx=j*gridWidth+gridWidth/2;
           starty=i*gridHeight+gridHeight/2;
          }
        }
      }
  }
  
  void nextMaze()
  {
    currentGridIndex++;
    if (currentGridIndex >= gridValues.length)
      currentGridIndex=0;
    currentValues=gridValues[currentGridIndex];
    initializeStart();
    int newBallCount = 10-balls.size()+newBall;
    newBall++;
    for (int i=0; i<newBallCount; i++)
    {
      Ball b = new Ball(0, 0, random(-3, 3), random(-3, 3));
      grid.moveBallRandom(b);
      balls.add(b);
      println("adding ball");
    }
    int newFoodCount = 3-food.size();
    for (int i=0; i<newFoodCount; i++)
    {
      Food f = new Food();
      grid.foodRandom(f);
      food.add(f);
      println("adding food");
    }
  }
  void startOver()
  {
    gameState=0;
    currentGridIndex=0;
    currentValues=gridValues[currentGridIndex];
    initializeStart();
    char1.mazeCount=0;
    int newBallCount = 10-balls.size()-newBall;
    newBall=1;
    for (int i=0; i<newBallCount; i++)
    {
      Ball b = new Ball(0, 0, random(-3, 3), random(-3, 3));
      grid.moveBallRandom(b);
      balls.add(b);
      println("adding ball");
    }
    int newFoodCount = 3-food.size();
    for (int i=0; i<newFoodCount; i++)
    {
      Food f = new Food();
      grid.foodRandom(f);
      food.add(f);
      println("adding food");
    }
    char1.lives=5;
    char1.x=grid.startx;
    char1.y=grid.starty;
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