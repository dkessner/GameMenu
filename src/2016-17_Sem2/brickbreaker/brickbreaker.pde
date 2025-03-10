int rows = 7; 
int columns = 7; 
int total = rows * columns; 
int score = 0;
int gameScore = 0; 
int lives = 7; 

Paddle paddle2 = new Paddle(); 
Ball ball2 = new Ball(); 
Brick[] box = new Brick[total]; 

void setup()
{
  size(600, 600);
  noCursor();
  background(219, 219, 255);
  smooth();

  for (int i = 0; i < rows; i++)
  {
    for (int j = 0; j< columns; j++)
    {
      box[i*rows + j] = new Brick((i+1) *width/(rows + 2), (j+1) * 50);
    }
  }
}

void draw()
{

  background(219, 219, 255);

  for (int i = 0; i<total; i++)
  {
    box[i].update();
  }

  paddle2.update();
  ball2.update();

  if (ball2.y == paddle2.y && ball2.x > paddle2.x && ball2.x <= paddle2.x + (paddle2.w / 2) )
  {
    ball2.goLeft();
    ball2.changeY();
  }

  if (ball2.y == paddle2.y && ball2.x > paddle2.x + (paddle2.w/2) && ball2.x <= paddle2.x + paddle2.w )
  {
    ball2.goRight();
    ball2.changeY();
  }

  if (ball2.x + ball2.D / 2 >= width)
  {
    ball2.goLeft();
  }

  if (ball2.x - ball2.D / 2 <= 0)
  {
    ball2.goRight();
  }

  if (ball2.y - ball2.D / 2 <= 0)
  {
    ball2.changeY();
  }

  for (int i = 0; i < total; i ++)
  {
    if (ball2.y - ball2. D / 2 <= box[i].y + box[i].h &&  ball2.y - ball2.D/2 >= box[i].y && ball2.x >= box[i].x && ball2.x <= box[i].x + box[i].w  && box[i].hit == false )
    {
      ball2.changeY();
      box[i].gotHit();
      score += 1;
      gameScore += 10;
      {
      }
    } 

    if (ball2.y + ball2.D / 2 >= box[i].y && ball2.y - ball2.D /2 <= box[i].y + box[i].h/2 && ball2.x >= box[i].x && ball2.x <= box[i].x + box[i].w && box[i].hit == false ) 
    {
      ball2.changeY();
      box[i].gotHit();
      score += 1;
      gameScore += 10;
      {
      }
    }

    if (ball2.x + ball2.D / 2 >= box[i].x && ball2.x + ball2.D / 2 <= box[i].x + box[i].w / 2 && ball2.y >= box[i].y && ball2.y <= box[i].y + box[i].h  && box[i].hit == false)
    {
      ball2.goLeft();
      box[i].gotHit();
      score += 1;
      gameScore += 10;
      {
      }
    }

    if (ball2.x - ball2.D/2 <= box[i].x + box[i].w && ball2.x +ball2.D / 2 >= box[i].x + box[i].w / 2 && ball2.y >= box[i].y && ball2.y <= box[i].y + box[i].h  && box[i].hit == false)
    {
      ball2.goRight();
      box[i].gotHit();
      score += 1;
      gameScore += 10;
      {
      }
    }
  }
  {  
    paddle2.g = 255; 
    paddle2.b = 255;
  }

  if (ball2.y > height)
  {
    ball2.reset();
    lives -= 1;
  }

  textSize(32);
  text(gameScore, 10, 30);

  textSize(18);
  text("LIVES: ", 10, 570);
  text(lives, 70, 570); 

  if ((score == total || lives <= 0) && (keyCode == ENTER))
  {
    resetGame();
  } 

  if (score == total)
  {
    gameWin();
  }

  if (lives <= 0)
  {
    gameLose();
  }
}

void gameLose()
{
  background(219, 219, 255);
  textSize(32);
  text("GAME OVER", 200, 200);
  text("Score: ", 225, 355);
  text(gameScore, 318, 355);
  text("Click first red button to play again!", 30, 500);

  ball2.x = -10;
  ball2.y = -10;
  ball2.vx = 0;
  ball2.vy = 0;
}

void gameWin()
{ 
  background(219, 219, 255);
  textSize(32);
  text("YOU WIN!", 100, 200);
  text("Score: ", 100, 355);
  text(gameScore, 300, 355);
  text("Click mouse to play again!", 100, 500);

  ball2.x = -10;
  ball2.y = -10;
  ball2.vx = 0;
  ball2.vy = 0;
}

void resetGame()
{
  for (int i = 0; i < rows; i++)
  {
    for (int j = 0; j< columns; j++)
    {
      box[i*rows + j] = new Brick((i+1) *width/(rows + 2), (j+1) * 50);
    }

    score = 0;
    gameScore = 0;

    lives = 7;
  }

  ball2.reset();
}

class Paddle
{
  float x; 
  float y; 
  float w; 
  float h; 
  float r; 
  float g; 
  float b;
  float vx; 

  Paddle()
  {
    x = width/2;
    y = 500;
    w = 100;
    h = 10;
    r=255;
    g=255;
    b=255;
    vx = 0;
  }

  void update()
  {
    x += vx;    

    fill(r, g, b);
    rect(x, y, w, h);
  }
}

class Ball
{

  float x;  
  float y; 
  float vx; 
  float vy; 
  float D; 

  Ball()
  {
    x = 300;
    y = 400;
    vx = 0; 
    vy = 4; 
    D = 10;
  }

  void update()
  {
    noStroke();
    fill(255);
    ellipse(x, y, D, D);

    y += vy; 
    x += vx;
  }

  void goLeft()
  {
    vx = -4;
  }

  void goRight()
  {
    vx = 4;
  }

  void changeY()
  {
    vy *= -1;
  }

  void reset()
  {
    x = 300;
    y = 400;
    vx = 0;
    vy = 4;
  }
}

class Brick
{
  float x; 
  float y; 
  float w; 
  float h; 
  float r; 
  float g; 
  float b; 

  boolean hit; 

  Brick(float x0, float y0)
  {
    x = x0;
    y = y0;

    r = random(255, 255);
    g = random(255, 255);
    b = random(255, 255);
    w = 50; 
    h = 25; 

    hit = false;
  }

  void update()
  {
    noStroke();
    fill(r, g, b);
    rect(x, y, w, h);
  }

  void gotHit()
  {
    hit = true; 

    r = 219;
    g = 219;
    b = 255;
    rect(x, y, w, h);
  }
}

void keyPressed()
{
  if (keyCode == RIGHT)
  {
    paddle2.vx = 7;
  }
  if (keyCode == LEFT)
  {
    paddle2.vx = -7;
  }
}

void keyReleased()
{
  if (keyCode == RIGHT)
  {
    paddle2.vx = 0;
  }
  if (keyCode == LEFT)
  {
    paddle2.vx = 0;
  }
}