PImage treasurechestI;

import processing.sound.*;
SoundFile bounce;
PImage[] treasurechest = new PImage[12];
boolean open = false;
int treasurechestIndex = 0;
float xTreasurechest = width+150;
float yTreasurechest = 200;
float ballX;
float ballY;
float ballVX = random(3, 6);
float ballVY = -5;
float paddleVX = 0;
float paddleVY = 0;
float paddleX = 300;
float paddleY = height-45;
float gameState = 0;
int score = 0;
float rectX= 300;
float rectY = 200;
float faceX = 400;
float faceY = 500;
PImage flying;
int flyingX= width;
int flyingY =400;
int highscore = 0;
int drawFlowerX=200;
int drawFlowerY =200;
float ellipseX =200;
float ellipseY= 200;


void initialize()


{
  ballX = width/2;
  ballY = height-100;
  ballVX = random(3, 6);
   
  ballVY = -5;
  
  paddleX= width/2;
  paddleY = height-45;

  score = 0;

  rectX = random(100,width-100);
  
  rectY = random(100,125);
 
  faceX = random(100,width-100);
  faceY = random(100,125); 
  flyingX = width+75;
  
  ellipseX = random(125,width-100);
  ellipseY= random(125  ,width-100);
  
  xTreasurechest= width+150;
  yTreasurechest= 200;
  
}


void setup ()
{
  fullScreen();
  initialize();
  flying=loadImage("flying.png");
  flying.resize(140,140);
   flyingX = width+75;
   xTreasurechest= width+150;
  yTreasurechest= 200;
  bounce = new SoundFile(this,"Pickup_Coin4.wav");

  treasurechestI = loadImage("treasurechest11.png");
  
   
  
  
  
  noCursor();
  
  treasurechest[0] = loadImage("treasurechest" + 11 + ".png");
  treasurechest[1] = loadImage("treasurechest" + 0 + ".png");
  treasurechest[2] = loadImage("treasurechest" + 1 + ".png");
  treasurechest[3] = loadImage("treasurechest" + 2 + ".png");
  treasurechest[4] = loadImage("treasurechest" + 3 + ".png");
  treasurechest[5] = loadImage("treasurechest" + 4 + ".png");
  treasurechest[6] = loadImage("treasurechest" + 5 + ".png");
  treasurechest[7] = loadImage("treasurechest" + 6 + ".png");
  treasurechest[8] = loadImage("treasurechest" + 7 + ".png");
  treasurechest[9] = loadImage("treasurechest" + 8 + ".png");
  treasurechest[10] = loadImage("treasurechest" + 9 + ".png");
  treasurechest[11] = loadImage("treasurechest" + 10 + ".png");
}




void drawStart ()
{
  background(0);
  fill(255,255,255);
  textSize(30);
  
  textAlign(CENTER, CENTER);
  text("Welcome to our game! To play move to paddle from left to right " +
       "so the ball bounces off of it and hits targets to score points. " +
       "Make sure not to let the ball go into the red or the game is over.",
      width/2-200, height/2-200, 400, 400);
  
}

void drawEnd ()
{
  background(0);
  textAlign(CENTER,CENTER);
  textSize(50);
  rectMode(CENTER);
  fill(255);
  text("GAME OVER",width/2,height/2,400,400);
  
}



void draw ()

{
 if(gameState == 0)
  drawStart();
 else if (gameState == 1)
  drawGame();
 else if(gameState == 2)
  drawEnd();
}

void keyPressed () 
{
  if(gameState == 0)
  {
    if (key == '5')
      gameState = 2;
    else
      gameState = 1;
  }
  else if(gameState == 1)
  {
  
  if(keyCode == RIGHT)
    paddleVX = 6;
  if(keyCode == LEFT)
    paddleVX = -6;
  if(keyCode == UP)
    score+=1;
  }
 
 else if(gameState == 2)
 {
   gameState=1;
   initialize();
 }

else if(key == 'e')
{
 open = true;
 treasurechestIndex = 0;

}
}

void keyReleased ()
{
  paddleVX=0;
  
  
}