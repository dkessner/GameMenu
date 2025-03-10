int x = 50;
int y = 50;

int i = 100;
int vi = 5;

int p = 75;
int vp = 0;

int carb = 100;
int vcarb = 5;

int ycarb = 250;
int vycarb = 0;

int carr = 100;
int vcarr = 5;

int ycarr = 375;
int vycarr = 0;

int carp = 400;
int vcarp = 5;

int ycarp = 400;
int vycarp = 0;

int xsnail = 300;
int vxsnail = 8;

int ysnail = 500;
int vysnail = 8;

PImage purple;
PImage blue;
PImage red;
PImage yellow;
PImage snail;

int gameState = 0;

int score = 0;



void setup()
{
size(600, 600);
purple = loadImage("purple.png");
purple.resize(75, 50);
blue = loadImage("blue.png");
blue.resize(75, 50);
red = loadImage("red.png");
red.resize(75, 50);
yellow = loadImage("yellow.png");
yellow.resize(75, 50);
snail = loadImage("snail.png");
snail.resize(100, 100);
imageMode(CENTER);
}

void road(int x, int y)
{
  strokeWeight(10);
  stroke(#EBFA4E);
  line(x,y, x+100, y);
  line(x + 150,y,x + 250,y);
  line(x + 300, y, x+415, y);
}

void draw()
{
  background(108);
  
  if (gameState == 0)
  {
    drawStart();
  }
  else if(gameState ==1)
  {
    drawGame();
  }
  else
  {
    drawEnd();
  }
  
}

void drawStart()
{
  background(0);
  textSize(50);
  textAlign(CENTER,CENTER);
  text("Zippy Snail", width/2, height/2-100);
  textSize(30);
  text("Don't get hit by the cars", width/2, height/2);
  text("Press the space bar to continue", width/2, height/2 + 100);
}

void drawGame()
{
  road(x, y);
  road(100, 200);
  road(x, 350);
  road(100, 500);
  strokeWeight(5);
  stroke(0);
  line(0, 115, 600, 115);
  line(0,275,600,275);
  line(0,425,600,425);
  
  image(snail, xsnail, ysnail);
  image(yellow, i, p);
   i = i + 7;
  
  if(i>width)
  {
  i = 0;
  score++;
  }
  image(blue, carb, ycarb);
  carb = carb - 3;
  
 if(carb< 0)
 {
  carb = 600;
   score++;
 }
  image(purple, carp, ycarp);
    carp = carp + 6;
  
  if(carp>width+100)
  carp = -350;
  
  image(red, carr, ycarr);
  carr = carr + 5;
  
  if(carr>width+100)
  carr = -350;
  
  fill(255);
  text("score: " + score, 60, 20);
  
  if (dist(xsnail, ysnail, carr, ycarr)< 45)
  {
   gameState = 2; 
  }
  
  if (dist(xsnail, ysnail, carp, ycarp)< 45)
  {
    gameState = 2;
  }
  
  if (dist(xsnail, ysnail, carb, ycarb)< 45)
  {
    gameState = 2;
  }
 
   if (dist(xsnail, ysnail, i, p)< 45)
 {
   gameState = 2;
 }

    
  if(ysnail<50)
    ysnail = 501;
    
   // if(ysnail <= 500 && millis() > 10000)
   // gameState = 2;
}


void drawEnd()
{
  background(0);
  textSize(50);
  text("Game Over!", width/2, height/2);
  textSize(30);
  text("Score = " + score, width/2 - 200, height/2-275);
}

void keyPressed()
{
  if(key == ' ')
  {
    gameState++;
    
    if(gameState>2)
    {
      gameState = 0;
      xsnail = 300;
      ysnail= 501;
    }
  } 
  if (keyCode == RIGHT)
  {
    xsnail += 4; // x = x + 5
  }
  else if (keyCode == LEFT)
  {
    xsnail -= 4;
  }
  else if (keyCode == UP)
  {
    ysnail -= 4;
  }
 
  else if (keyCode == DOWN)
  {
    ysnail += 4;
  }
}